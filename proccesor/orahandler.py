import sqlalchemy as db
import cx_Oracle
import time
import datetime as dt
import pandas as pd
import psutil as ps
from functools import reduce
from collections import defaultdict


class oracleHandler():
    def __init__(self, engine):
        self.engine = engine
        self.init = 0
        self.stat = {}
        self.old_stat = {}
        self.ora_stats = (
            "bytes received via SQL*Net from client",
            "bytes sent via SQL*Net to client",
            "session logical reads",
            "consistent gets",
            "enqueue waits",
            "execute count",
            "leaf node splits",
            "logons cumulative",
            "parse count (total)",
            "parse count (hard)",
            "physical reads",
            "physical writes",
            "redo size",
            "sorts (memory)",
            "sorts (disk)",
            "table scans (long tables)",
            "table scans (short tables)",
            "transaction rollbacks",
            "user commits",
            "user rollbacks",
            "redo synch time",
            "redo synch writes",
            "user calls",
            "SQL*Net roundtrips to/from client",
            "gc cr blocks served",
            "gc cr blocks received",
            "gc cr block receive time",
            "gc cr block send time",
            "gc current blocks served",
            "gc current blocks received",
            "gc current block receive time",
            "gc current block send time",
            "gcs messages sent",
            "ges messages sent",
            "db block changes",
            "redo writes",
            "physical read total bytes",
            "physical write total bytes"
        )
        self.wait_events = (
            "db file sequential read",
            "db file scattered read",
            "log file parallel write",
            "log file sync",
            "log file parallel write",
            "enq: TX - row lock contention"
        )
        self.time_model = (
            'DB time',
            'DB CPU',
            'background cpu time'
        )

        self.os_stats = (
            'PHYSICAL_MEMORY_BYTES', 'NUM_CPUS', 'IDLE_TIME', 'BUSY_TIME'
        )

        self.old_stat = {}

    def init_stat_vals(self):
        for stat in self.ora_stats:
            self.old_stat[stat] = 0

        for stat in self.wait_events:
            self.old_stat[stat] = 0
            self.old_stat[stat + '/time waited'] = 0

        for stat_name in self.time_model:
            self.old_stat[stat_name] = 0

        for stat_name in self.os_stats:
            self.old_stat[stat_name] = 0

        return

    def get_metrics(self):
        columns = ['Disk Read IO/sec', 'Batch Requests/sec', 'Disk Write IO/sec']
        resultset = {}
        i = 0
        with self.engine.begin() as con:
            rs = con.execute("SELECT METRIC_NAME,SUM(AVERAGE) from dba_hist_sysmetric_summary \
            WHERE METRIC_NAME IN ('Executions Per Sec','Physical Read Total Bytes Per Sec','Physical Write Total Bytes Per Sec')\
            GROUP BY METRIC_NAME")
            for row in rs:
                resultset[columns[i]] = row[1]
                i += 1
        return resultset

    def print_query(self, query):
        with self.engine.connect() as con:
            rs = con.execute(query)
            print(rs.keys())
            for row in rs:
                print(row)
        return

    def get_query(self, query):
        with self.engine.connect() as con:
            return con.execute(query)

    def get_engine_stats(self):
        if self.init == 0:
            self.init = 1
            self.init_stat_vals()
            self.get_oracle_stats()
        return self.get_oracle_stats()

    def get_oracle_stats(self):
        orastat = {}
        orastat = {**orastat, **self.oracle_osstat()}
        orastat = {**orastat, **self.get_ora_stat()}
        orastat = {**orastat, **self.get_wait_events()}
        orastat = {**orastat, **self.get_oracle_session_count()}
        orastat = {**orastat, **self.get_oracle_load()}
        orastat = {**orastat, **self.get_oracle_mem()}
        return orastat

    def get_uptime(self):
        sql = "select startup_time, version, parallel from v$instance "
        startup_time, version, parallel = super().query_one(sql, self.db_conn)
        uptime = dt.datetime.now() - startup_time
        up_seconds = uptime.days * 86400 + uptime.seconds
        return up_seconds

    def get_oracle_pga(self):
        sql = """select value from v$pgastat where name = 'total PGA allocated'
                       """
        pga_size, = self.get_query(sql).fetchone()
        return round(pga_size / 1024 / 1024, 2)

    def get_oracle_sga(self):
        sql = """select sum(bytes) from v$sgainfo where name in (
                       'Fixed SGA Size',
                       'Redo Buffers',
                       'Buffer Cache Size',
                       'Shared Pool Size',
                       'Large Pool Size',
                       'Java Pool Size',
                       'Streams Pool Size',
                       'Shared IO Pool Size'
                   )
               """
        sga_size, = self.get_query(sql).fetchone()
        sql = "select bytes from  v$sgainfo where name = 'Granule Size'"
        granu_size, = self.get_query(sql).fetchone()
        return round(int(sga_size + granu_size - 1) / granu_size * granu_size / 1024 / 1024, 2)

    def get_oracle_mem(self):
        sga = self.get_oracle_sga()
        pga = self.get_oracle_pga()
        mem_phy = self.old_stat['PHYSICAL_MEMORY_BYTES'] / 1024 / 1024
        mem_pct = round(100 * (pga + sga) / mem_phy, 2)

        return {
            'sga_size': sga,
            'pga_size': pga,
            'memory_used_percent': mem_pct
        }

    def get_ora_stat(self):
        sql = """
                   select name, value
                   from v$sysstat
                   where name in (%s)
                   """
        stat_names = ",".join(("'" + s + "'" for s in self.ora_stats))
        sql_real = sql % (stat_names)
        res = self.get_query(sql_real).fetchall()

        stat_delta = {}
        for stat_name, stat_val in res:
            stat_delta[stat_name] = round((stat_val - self.old_stat[stat_name]) * 1.0)
            self.old_stat[stat_name] = stat_val

        return {
            'logons_cumulative': stat_delta['logons cumulative'],
            'qps': stat_delta['execute count'],
            'tps': stat_delta['user commits'] + stat_delta['transaction rollbacks'],
            'consistent_gets': stat_delta['consistent gets'],
            'logical_reads': stat_delta['session logical reads'],
            'physical_reads': stat_delta['physical reads'],
            'physical_writes': stat_delta['physical writes'],
            'block_changes': stat_delta['db block changes'],
            'redo_size': round(stat_delta['redo size'] / 1024),
            'total_parse_count': stat_delta['parse count (total)'],
            'hard_parse_count': stat_delta['parse count (hard)'],
            'bytes_received': round(stat_delta['bytes received via SQL*Net from client'] / 1024),
            'bytes_sent': round(stat_delta['bytes sent via SQL*Net to client'] / 1024),
            'exec_count': stat_delta['execute count'],
            'user_commits': stat_delta['user commits'],
            'user_rollbacks': stat_delta['user rollbacks'],
            'redo_writes': stat_delta['redo writes'],
            'io_throughput': round(stat_delta['physical read total bytes'] / 1024 / 1024 + stat_delta[
                'physical write total bytes'] / 1024 / 1024, 2)
        }

    def get_wait_events(self):
        sql = """
                 select /* dbagent */event, total_waits, round(time_waited_micro/1000,2) as time_waited
                 from v$system_event
                 where event in (%s)
             """
        event_names = ",".join("'" + s + "'" for s in self.wait_events)
        sql_real = sql % event_names
        res = self.get_query(sql_real).fetchall()

        stat_delta = defaultdict(int)
        for event, total_waits, time_waited in res:
            waits = total_waits - self.old_stat[event]
            if waits == 0:
                stat_delta[event + "/avg waitim"] = 0
                stat_delta[event] = 0
            else:
                stat_delta[event + "/avg waitim"] = round((time_waited - self.old_stat[event + "/time waited"]) / waits)
                stat_delta[event] = round((total_waits - self.old_stat[event]))

            self.old_stat[event] = total_waits
            self.old_stat[event + "/time waited"] = time_waited

        return {
            'log_file_sync_wait': stat_delta['log file sync/avg waitim'],
            'log_file_sync_count': stat_delta['log file sync'],
            'log_parallel_write_wait': stat_delta['log file parallel write/avg waitim'],
            'db_file_scattered_read_wait': stat_delta['db file scattered read/avg waitim'],
            'db_file_scattered_read_count': stat_delta['db file scattered read'],
            'db_file_sequential_read_wait': stat_delta['db file sequential read/avg waitim'],
            'db_file_sequential_read_count': stat_delta['db file sequential read'],
            'row_lock_wait_count': stat_delta['enq: TX - row lock contention']
        }

    def get_oracle_session_count(self):
        sql = """
               select count(*) as total_sess,
               sum(case when status='ACTIVE' and type = 'USER' then 1 else 0 end) as act_sess,
               sum(case when status='ACTIVE' and type = 'USER' and command in (2,6,7) then 1 else 0 end) as act_trans,
               sum(case when blocking_session is not null then 1 else 0 end) as blocked_sessions
           from v$session
           """
        # v$sqlcommand
        rs = self.get_query(sql)
        # print(rs.fetchone())
        total_sess, act_sess, act_trans, blocked_sess = self.get_query(sql).fetchone()
        return {
            'total_sessions': total_sess,
            'active_sessions': act_sess,
            'active_trans_sessions': act_trans,
            'blocked_sessions': blocked_sess
        }

    def oracle_osstat(self):
        sql = """select stat_name, value from v$osstat
                   where stat_name in ('PHYSICAL_MEMORY_BYTES', 'NUM_CPUS', 'IDLE_TIME', 'BUSY_TIME'
                   )
               """
        res = self.get_query(sql)
        cpu_idle = 0
        cpu_busy = 0

        for stat_name, value in res:
            if stat_name == 'IDLE_TIME':
                cpu_idle = value - self.old_stat[stat_name]
            elif stat_name == 'BUSY_TIME':
                cpu_busy = value - self.old_stat[stat_name]
            self.old_stat[stat_name] = value

        if cpu_idle + cpu_busy == 0:
            self.stat['host_cpu'] = 0
        else:
            self.stat['host_cpu'] = max(round(100.0 * cpu_busy / (cpu_idle + cpu_busy), 2), 0)

        return {
            'num_cpus': 1.0 * self.old_stat['NUM_CPUS'],
            'physical_memory': 1.0 * self.old_stat['PHYSICAL_MEMORY_BYTES']
        }

    def get_oracle_load(self):
        stats = ",".join("'" + s + "'" for s in self.time_model)
        sql = """
                   select stat_name, value
                   from v$sys_time_model
                   where stat_name in (%s)
               """ % stats
        res = self.get_query(sql).fetchall()
        stat_delta = {}
        num_cpu = self.old_stat.get('NUM_CPUS', 1)
        for stat_name, value in res:
            diff_val = max((value - self.old_stat[stat_name]) * 1.0, 0)
            if stat_name in ('DB time', 'DB CPU', 'background cpu time'):
                diff_val /= 10000.0 * num_cpu
            stat_delta[stat_name] = round(diff_val, 2)
            self.old_stat[stat_name] = value

        return {
            'dbtime': stat_delta['DB time'],
            'dbcpu': stat_delta['DB CPU'],
            'bgcpu': stat_delta['background cpu time']
        }
