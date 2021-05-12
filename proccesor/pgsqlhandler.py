import sqlalchemy as db
import cx_Oracle
import time
import datetime as dt
import pandas as pd
import psutil as ps


metric_defs = {
    "pg_backends_waiting": {
        "description": "Number of postgres backends that are waiting",
        "units": "backends",
        "inc": 0,
        "query": "SELECT count(*) AS backends_waiting FROM " + \
            "pg_stat_activity WHERE wait_event <> 'None';"
    },
    "pg_database_size": {
        "description": "Total size of all databases in bytes",
        "value_type": "double",
        "format": "%.0f",
        "units": "bytes",
        "inc": 1,
        "query": "SELECT sum(pg_database_size(d.oid)) AS " + \
            "size_database FROM pg_database d ORDER BY 1 DESC;"
    },
    "pg_idx_blks_read": {
        "description": "Total index blocks read",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(idx_blks_read) AS idx_blks_read " + \
            "FROM pg_statio_all_indexes;"
    },
    "pg_idx_blks_hit": {
        "description": "Total index blocks hit",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(idx_blks_hit) AS idx_blks_hit " + \
            "FROM pg_statio_all_indexes;"
    },
    "pg_locks": {
        "description": "Number of locks held",
        "units": "locks",
        "inc": 0,
        "query": "SELECT count(*) FROM pg_locks;"
    },
    "pg_txn_time_max": {
        "description": "Age of longest transaction",
        "units": "seconds",
        "inc": 0,
        "query": "SELECT max(COALESCE(ROUND(EXTRACT(epoch " + \
            "FROM now()-xact_start)),0)) as txn_time_max " + \
            "FROM pg_stat_activity WHERE xact_start IS NOT NULL;"
    },
    "pg_connections": {
        "description": "Number of connections",
        "units": "connctions",
        "inc": 1,
        "query": "SELECT sum(numbackends) FROM pg_stat_database;"
    },
    "pg_xact_commit": {
        "description": "Transactions committed",
        "slope": "positive",
        "units": "transactions",
        "inc": 0,
        "query": "SELECT sum(xact_commit) as xact_commit FROM " + \
            "pg_stat_database;",
    },
    "pg_xact_rollback": {
        "description": "Transactions rolled back",
        "slope": "positive",
        "units": "transactions",
        "inc": 0,
        "query": "SELECT sum(xact_rollback) as xact_rollback FROM " + \
            "pg_stat_database;",
    },
    "pg_blks_read": {
        "description": "Blocks read",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(blks_read) as blks_read FROM " + \
            "pg_stat_database;",
    },
    "pg_blks_hit": {
        "description": "Blocks hit",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(blks_hit) as blks_hit FROM " + \
            "pg_stat_database;",
    },
    "pg_tup_returned": {
        "description": "Tuples returned",
        "slope": "positive",
        "units": "tuples",
        "inc": 0,
        "query": "SELECT sum(tup_returned) as tup_returned FROM " + \
            "pg_stat_database;",
    },
    "pg_tup_fetched": {
        "description": "Tuples fetched",
        "slope"       : "positive",
        "units": "tuples",
        "inc": 0,
        "query": "SELECT sum(tup_fetched) as tup_fetched FROM " + \
            "pg_stat_database;",
    },
    "pg_tup_inserted": {
        "description": "Tuples inserted",
        "slope": "positive",
        "units": "tuples",
        "inc": 0,
        "query": "SELECT sum(tup_inserted) as tup_inserted FROM " + \
            "pg_stat_database;",
    },
    "pg_tup_updated": {
        "description": "Tuples updated",
        "slope": "positive",
        "units": "tuples",
        "query": "SELECT sum(tup_updated) as tup_updated FROM " + \
            "pg_stat_database;",
    },
    "pg_tup_deleted": {
        "description": "Tuples deleted",
        "slope": "positive",
        "units": "tuples",
        "inc": 0,
        "query": "SELECT sum(tup_deleted) as tup_deleted FROM " + \
            "pg_stat_database;",
    },
    "pg_heap_blks_read": {
        "description": "Heap blocks read",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(heap_blks_read) as heap_blks_read FROM " + \
            "pg_statio_all_tables;",
    },
    "pg_heap_blks_hit": {
        "description": "Heap blocks hit",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(heap_blks_hit) as heap_blks_hit FROM " + \
            "pg_statio_all_tables;",
    },
    "pg_idx_blks_read_tbl": {
        "description": "Index blocks read",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(idx_blks_read) as idx_blks_read_tbl FROM " + \
            "pg_statio_all_tables;",
    },
    "pg_idx_blks_hit_tbl": {
        "description": "Index blocks hit",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(idx_blks_hit) as idx_blks_hit_tbl FROM " + \
            "pg_statio_all_tables;",
    },
    "pg_toast_blks_read": {
        "description": "Toast blocks read",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(toast_blks_read) as toast_blks_read FROM " + \
            "pg_statio_all_tables;",
    },
    "pg_toast_blks_hit": {
        "description": "Toast blocks hit",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(toast_blks_hit) as toast_blks_hit FROM " + \
            "pg_statio_all_tables;",
    },
    "pg_tidx_blks_read": {
        "description": "Toast index blocks read",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(tidx_blks_read) as tidx_blks_read FROM " + \
            "pg_statio_all_tables;",
    },
    "pg_tidx_blks_hit": {
        "description": "Toast index blocks hit",
        "slope": "positive",
        "units": "blocks",
        "inc": 0,
        "query": "SELECT sum(tidx_blks_hit) as tidx_blks_hit FROM " + \
            "pg_statio_all_tables;",
    },
}

class pgsqlHandler():
    def __init__(self, engine):
        self.stat = {}
        self.stat1 = {}
        self.stat2 = {}
        self.stat_now = {}
        self.init = 0
        self.engine = engine

    def get_metrics(self):
        resultset = {}
        i=0
        j=0
        with self.engine.begin() as con:
            rs = con.execute("select sum(tup_inserted)+sum(tup_inserted)+sum(tup_inserted)+sum(tup_fetched) AS \"Batch Requests/sec\" \
                            ,sum(blks_read) AS \"Disk Read IO/sec\" \
                            from pg_stat_database ")
            for row in rs:
             for column in rs._metadata.keys:
                resultset[column]=row[i]
                i+=1
            rs = con.execute("SELECT buffers_checkpoint + buffers_clean + buffers_backend \"Disk Write IO/sec\" FROM pg_stat_bgwriter")
            for row in rs:
                for column in rs._metadata.keys:
                    resultset[column] = row[j]
                    j+= 1
        return resultset



    def get_engine_stats(self):
        if self.init == 0:
            self.init = 1
            self.init_stat_vals()
            self.get_pg_stat()
        return self.get_pg_stat()


    def init_stat_vals(self):
        stat_dict = {}
        for metric_name, metric_attrs in metric_defs.items():
            stat_dict[metric_name] = 0
        self.stat['pgstat'] = stat_dict

    def get_pg_stat(self):
        stat2_dict = {}
        stat_now = {}
        old_stat = self.stat['pgstat']

        for metric_name, metric_attrs in metric_defs.items():
            query_results = self.get_query(metric_attrs['query'])
            for row in query_results:
                stat2_dict[metric_name] = float(row[0])

        for metric_name, metric_attrs in metric_defs.items():
            if metric_defs[metric_name].get('inc') == 0:
                stat_now[metric_name] = round(1.0 * (stat2_dict[metric_name] - old_stat[metric_name]), 2)
            else:
                stat_now[metric_name] = stat2_dict[metric_name]

        self.stat['pgstat'] = stat2_dict

        return stat_now


    def print_query(self,query):
        with self.engine.connect() as con:
            rs = con.execute(query)
            print(rs.keys())
            for row in rs:
                print(row)
        return

    def get_query(self,query):
        with self.engine.connect() as con:
            return con.execute(query)