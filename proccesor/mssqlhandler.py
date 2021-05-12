import sqlalchemy as db
import cx_Oracle
import time
import datetime as dt
import pandas as pd
import psutil as ps

metric_defs = {
    "Batch_requests_sec": {
        "description": "Rate of T-SQL batches received per second",
        "units": "Work: Throughput",
        "inc": 1,
        "query": """SELECT cntr_value FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:SQL Statistics' AND counter_name='Batch Requests/sec';"""
    },
    "last_elapsed_time": {
        "description": "Time taken to complete the most recent execution of a query plan, in microseconds (accurate to milliseconds)",
        "value_type": "double",
        "format": "%.0f",
        "units": "Work: Performance",
        "inc": 1,
        "query": """SELECT avg(last_elapsed_time)
        FROM sys.dm_exec_query_stats;"""
    },
    "SQL_compilations_sec": {
        "description": "Number of times SQL Server compiles T-SQL queries per second",
        "slope": "positive",
        "units": "blocks",
        "inc": 1,
        "query": """SELECT cntr_value 
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:SQL Statistics' AND counter_name='SQL compilations/sec';"""
    },
    "SQL_recompilations_sec": {
        "description": "Number of times query recompilations are initiated per second",
        "slope": "positive",
        "units": "blocks",
        "inc": 1,
        "query": """SELECT cntr_value 
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:SQL Statistics' AND counter_name='SQL Re-Compilations/sec';"""
    },
    "memoryallocated_objects_in_kb": {
        "description": "The memory used in kilobytes, by tables",
        "units": "Resource: Utilization",
        "inc": 1,
        "query": """SELECT isnull(SUM( isnull(memory_allocated_for_indexes_kb,0) + isnull(memory_allocated_for_table_kb,0)),0) AS  
         memoryallocated_objects_in_kb   
        FROM sys.dm_db_xtp_table_memory_stats; """
    },
    "Disk_usage": {
        "description": "Space used by data or by indexes in a given table",
        "units": "Resource: Utilization",
        "inc": 1,
        "query": """SELECT
                    CONVERT(VARCHAR,SUM(size)*8/1024) AS [Disk usage] 
        FROM        sys.databases   
        JOIN        sys.master_files  
        ON          sys.databases.database_id=sys.master_files.database_id  """
    },
    "Buffer_cache_hit_ratio": {
        "description": "Percentage of requested pages found in the buffer cache",
        "units": "Other",
        "inc": 1,
        "query": """SELECT cntr_value 
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:Buffer Manager' AND counter_name='Buffer cache hit ratio';"""
    },
    "Page life expectancy": {
        "description": "Minimal time for pages to exist in buffer pool",
        "slope": "positive",
        "units": "transactions",
        "inc": 1,
        "query": """SELECT cntr_value 
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:Buffer Manager' AND counter_name='Page life expectancy';"""
    },
    "Checkpoint pages_sec": {
        "description": "Number of pages written to disk per second by a checkpoint",
        "slope": "positive",
        "units": "transactions",
        "inc": 1,
        "query": """SELECT cntr_value 
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:Buffer Manager' AND counter_name='Checkpoint pages/sec';"""
    },
    "Lock waits_sec": {
        "description": "Number of requests causing the calling transaction to wait for a lock, per second",
        "slope": "positive",
        "units": "blocks",
        "inc": 1,
        "query": """SELECT  avg(cntr_value)
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:Locks' AND counter_name='Lock waits/sec';"""
    },
    "Processes blocked": {
        "description": "Count of processes blocked at the time of measurement",
        "slope": "positive",
        "units": "tuples",
        "inc": 1,
        "query": """SELECT cntr_value 
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:General Statistics' AND counter_name='Processes blocked';"""
    },
    "Used memory": {
        "description": "Kilobytes of memory used in the resource pool",
        "slope": "positive",
        "units": "tuples",
        "inc": 1,
        "query": """SELECT sum(cntr_value) 
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:Resource Pool Stats' AND counter_name='Used memory (KB)';"""
    },
    "Page_splits_sec": {
        "description": "Count of page splits resulting from index page overflows per second",
        "slope": "positive",
        "units": "tuples",
        "inc": 1,
        "query": """SELECT cntr_value 
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:Access Methods' AND counter_name='Page splits/sec';"""
    },
    "avg_fragmentation_in_percent": {
        "description": "Percentage of leaf pages in an index that are out of order",
        "slope": "positive",
        "units": "tuples",
        "inc": 0,
        "query": """SELECT avg(avg_fragmentation_in_percent) FROM sys.dm_db_index_physical_stats (NULL, NULL, NULL, NULL, NULL); """
    },
    "User connections": {
        "description": "Count of users connected to SQL Server at the time of measurement",
        "slope": "positive",
        "units": "tuples",
        "inc": 1,
        "query": """SELECT cntr_value 
        FROM sys.dm_os_performance_counters 
        WHERE object_name='SQLServer:General Statistics' AND counter_name='User connections';"""
    },
    "Memory grants": {
        "description": "Number of grants to the memory during transactions",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": """SELECT cntr_value 
        FROM sys.dm_os_performance_counters WHERE counter_name = 'Memory Grants Pending'"""
    },
    "Read ahead": {
        "description": "Number of pages read ahead",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": """SELECT 100.0 *cntr_value / (
        SELECT 1.0*cntr_value FROM sys.dm_os_performance_counters WHERE counter_name = 'Page Reads/sec') 
        FROM sys.dm_os_performance_counters WHERE counter_name = 'Readahead pages/sec'"""
    },
}


class mssqlHandler():
    def __init__(self, engine):
        self.engine = engine
        self.stat = {}
        self.stat1 = {}
        self.stat2 = {}
        self.stat_now = {}
        self.init = 0

    def get_metrics(self):
        resultset = {}
        with self.engine.begin() as con:
            rs = con.execute("SELECT counter_name, SUM(cntr_value) \
                             FROM sys.dm_os_performance_counters\
                             WHERE counter_name IN ('Disk Read IO/sec', 'Disk Write IO/sec', 'Batch Requests/sec') \
                             GROUP BY counter_name")
            for row in rs:
                resultset[row[0].strip()] = row[1]
        return resultset

    def get_engine_stats(self):
        if self.init == 0:
            self.init = 1
            self.init_stat_vals()
            self.get_mssql_stat()
        return self.get_mssql_stat()

    def init_stat_vals(self):
        stat_dict = {}
        for metric_name, metric_attrs in metric_defs.items():
            stat_dict[metric_name] = 0
        self.stat['mssqlstat'] = stat_dict

    def get_mssql_stat(self):
        stat2_dict = {}
        stat_now = {}
        old_stat = self.stat['mssqlstat']

        for metric_name, metric_attrs in metric_defs.items():
            with self.engine.connect() as con:
                rs = con.execute(metric_attrs['query'])
                for row in rs:
                    if metric_defs[metric_name].get('inc') == 0:
                        stat2_dict[metric_name] = float(row[0])
                    else:
                        stat2_dict[metric_name] = row[0]

        for metric_name, metric_attrs in metric_defs.items():
            if metric_defs[metric_name].get('inc') == 0:
                stat_now[metric_name] = round(1.0 * (stat2_dict[metric_name] - old_stat[metric_name]), 2)
            else:
                stat_now[metric_name] = stat2_dict[metric_name]

        self.stat['mssqlstat'] = stat2_dict

        return stat_now

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
