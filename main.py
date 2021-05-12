import threading
from forecaster.sparkhandler import *
from forecaster.tensorflowhandler import time_series
from proccesor.rdbmsmanager import rdbmsManager
from datetime import datetime
from resources.setup import setup_kafka


def get_spark_schema(engine):
    if engine == 'mysql':
        schema = StructType(
            [
                StructField("Batch Requests/sec", FloatType()),
                StructField("Disk Read IO/sec", FloatType()),
                StructField("Disk Write IO/sec", FloatType()),
                StructField("create_time", StringType()),
                # StructField("cpu", FloatType()),
                StructField("Key_writes", FloatType()),
                StructField("bytes_received", FloatType()),
                StructField("bytes_sent", FloatType()),
                StructField("disk_tmp_tabs", FloatType()),
                StructField("innodb_buffer_pool_pages_data", FloatType()),
                StructField("innodb_buffer_pool_pages_dirty", FloatType()),
                StructField("innodb_buffer_pool_pages_flushed", FloatType()),
                StructField("innodb_buffer_pool_pages_free", FloatType()),
                StructField("innodb_buffer_pool_pages_total", FloatType()),
                StructField("innodb_buffer_pool_read_requests", FloatType()),
                StructField("innodb_buffer_pool_reads", FloatType()),
                StructField("innodb_data_fsyncs", FloatType()),
                StructField("innodb_data_read", FloatType()),
                StructField("innodb_data_reads", FloatType()),
                StructField("innodb_data_writes", FloatType()),
                StructField("innodb_data_written", FloatType()),
                StructField("innodb_log_writes", FloatType()),
                StructField("innodb_os_log_fsyncs", FloatType()),
                StructField("innodb_os_log_written", FloatType()),
                StructField("innodb_row_lock_time_avg", FloatType()),
                StructField("innodb_row_lock_waits", FloatType()),
                StructField("innodb_rows_deleted", FloatType()),
                StructField("innodb_rows_inserted", FloatType()),
                StructField("innodb_rows_read", FloatType()),
                StructField("innodb_rows_updated", FloatType()),
                StructField("key_blocks_not_flushed", FloatType()),
                StructField("key_blocks_unused", FloatType()),
                StructField("key_blocks_used", FloatType()),
                StructField("key_read_requests", FloatType()),
                StructField("key_reads", FloatType()),
                StructField("key_write_requests", FloatType()),
                StructField("mysql_del", FloatType()),
                StructField("mysql_ins", FloatType()),
                StructField("mysql_sel", FloatType()),
                StructField("mysql_upd", FloatType()),
                StructField("open_files", FloatType()),
                StructField("open_tables", FloatType()),
                StructField("qps", FloatType()),
                StructField("questions", FloatType()),
                StructField("select_scan", FloatType()),
                StructField("slow_queries", FloatType()),
                StructField("sort_rows", FloatType()),
                StructField("threads_cached", FloatType()),
                StructField("threads_connected", FloatType()),
                StructField("threads_created", FloatType()),
                StructField("threads_running", FloatType()),
                StructField("tps", FloatType())  # ,
                # StructField("uptime", FloatType())
            ]
        )
    if engine == 'postgresql':
        schema = StructType(
            [
                StructField("Batch Requests/sec", FloatType()),
                StructField("Disk Read IO/sec", FloatType()),
                StructField("Disk Write IO/sec", FloatType()),
                StructField("create_time", StringType()),
                # StructField("cpu", FloatType()),
                StructField("pg_backends_waiting", FloatType()),
                StructField("pg_database_size", FloatType()),
                StructField("pg_idx_blks_read", FloatType()),
                StructField("pg_idx_blks_hit", FloatType()),
                StructField("pg_locks", FloatType()),
                StructField("pg_txn_time_max", FloatType()),
                StructField("pg_connections", FloatType()),
                StructField("pg_xact_commit", FloatType()),
                StructField("pg_xact_rollback", FloatType()),
                StructField("pg_blks_read", FloatType()),
                StructField("pg_blks_hit", FloatType()),
                StructField("pg_tup_returned", FloatType()),
                StructField("pg_tup_fetched", FloatType()),
                StructField("pg_tup_inserted", FloatType()),
                StructField("pg_tup_updated", FloatType()),
                StructField("pg_tup_deleted", FloatType()),
                StructField("pg_heap_blks_read", FloatType()),
                StructField("pg_heap_blks_hit", FloatType()),
                StructField("pg_idx_blks_read_tbl", FloatType()),
                StructField("pg_idx_blks_hit_tbl", FloatType()),
                StructField("pg_toast_blks_read", FloatType()),
                StructField("pg_toast_blks_hit", FloatType()),
                StructField("pg_tidx_blks_read", FloatType()),
                StructField("pg_tidx_blks_hit", FloatType())
            ]
        )
    if engine == 'mssql':
        schema = StructType(
            [
                StructField("Batch Requests/sec", FloatType()),
                StructField("Disk Read IO/sec", FloatType()),
                StructField("Disk Write IO/sec", FloatType()),
                StructField("create_time", StringType()),
                # StructField("cpu", FloatType()),
                StructField("last_elapsed_time", FloatType()),
                StructField("SQL_compilations_sec", FloatType()),
                StructField("SQL_recompilations_sec", FloatType()),
                StructField("memoryallocated_objects_in_kb", FloatType()),
                StructField("Disk_usage", FloatType()),
                StructField("Page life expectancy", FloatType()),
                StructField("Checkpoint pages_sec", FloatType()),
                StructField("Lock waits_sec", FloatType()),
                StructField("Processes blocked", FloatType()),
                StructField("Used memory", FloatType()),
                StructField("Page_splits_sec", FloatType()),
                StructField("avg_fragmentation_in_percent", FloatType()),
                StructField("User connections", FloatType()),
                StructField("Memory grants", FloatType()),
                StructField("Read ahead", FloatType())
            ]
        )
    if engine == 'oracle':
        schema = StructType(
            [
                StructField("Batch Requests/sec", FloatType()),
                StructField("Disk Read IO/sec", FloatType()),
                StructField("Disk Write IO/sec", FloatType()),
                StructField("create_time", StringType()),
                # StructField("cpu", FloatType()),
                StructField("bytes received via SQL*Net from client", FloatType()),
                StructField("bytes sent via SQL*Net to client", FloatType()),
                StructField("session logical reads", FloatType()),
                StructField("consistent gets", FloatType()),
                StructField("enqueue waits", FloatType()),
                StructField("execute count", FloatType()),
                StructField("leaf node splits", FloatType()),
                StructField("logons cumulative", FloatType()),
                StructField("parse count (total)", FloatType()),
                StructField("parse count (hard)", FloatType()),
                StructField("physical reads", FloatType()),
                StructField("physical writes", FloatType()),
                StructField("redo size", FloatType()),
                StructField("sorts (memory)", FloatType()),
                StructField("sorts (disk)", FloatType()),
                StructField("table scans (long tables)", FloatType()),
                StructField("table scans (short tables)", FloatType()),
                StructField("transaction rollbacks", FloatType()),
                StructField("user commits", FloatType()),
                StructField("user rollbacks", FloatType()),
                StructField("redo synch time", FloatType()),
                StructField("redo synch writes", FloatType()),
                StructField("user calls", FloatType()),
                StructField("SQL*Net roundtrips to/from client", FloatType()),
                StructField("gc cr blocks served", FloatType()),
                StructField("gc cr blocks received", FloatType()),
                StructField("gc cr block receive time", FloatType()),
                StructField("gc cr block send time", FloatType()),
                StructField("gc current blocks served", FloatType()),
                StructField("gc current blocks received", FloatType()),
                StructField("gc current block receive time", FloatType()),
                StructField("gc current block send time", FloatType()),
                StructField("gcs messages sent", FloatType()),
                StructField("ges messages sent", FloatType()),
                StructField("db block changes", FloatType()),
                StructField("redo writes", FloatType()),
                StructField("physical read total bytes", FloatType()),
                StructField("physical write total bytes", FloatType()),
                StructField("db file sequential read", FloatType()),
                StructField("db file scattered read", FloatType()),
                StructField("log file parallel write", FloatType()),
                StructField("log file sync", FloatType()),
                StructField("enq: TX - row lock contention", FloatType()),
                StructField("DB time", FloatType()),
                StructField("DB CPU", FloatType()),
                StructField("background cpu time", FloatType()),
                StructField("PHYSICAL_MEMORY_BYTES", FloatType()),
                StructField("NUM_CPUS", FloatType()),
                StructField("IDLE_TIME", FloatType()),
                StructField("BUSY_TIME", FloatType())
            ]
        )
    return schema


def run_sparkhandler(engine, awaitTermination=15, clusters=2):
    schema = get_spark_schema(engine)
    streamer = sparkhandler(schema, awaitTermination)
    streamer.run_model(clusters)


def run_rdbmsmanager(engine, stream=15):
    rdbms_mgmt = rdbmsManager(engine)
    rdbms_mgmt.stream_metrics(stream)


def main(engine, streams , specific, setupKafka):
    start_ts = None
    ts_hours = None
    engine_to_run = engine
    stream_seconds = streams
    if setupKafka == 'setupKafka':
        setup_kafka()
    if (specific == 'all') or (specific == 'stream') :
        clusters = 5
        date_format = '%m/%d/%Y %H:%M:%S'
        start_ts = (datetime.today()).strftime(date_format)
        t_clustering = threading.Thread(target=run_sparkhandler,
                                        kwargs=dict(engine=engine_to_run, awaitTermination=stream_seconds,
                                                    clusters=clusters))
        t_rdbms = threading.Thread(target=run_rdbmsmanager, kwargs=dict(engine=engine_to_run, stream=stream_seconds))
        t_rdbms.start()
        t_clustering.start()
        t_rdbms.join()
        t_clustering.join()
    ts_hours = stream_seconds // 3600
    if (ts_hours >= 6) or (specific == 'learn') or (specific == 'all') :
        ts = time_series(ts_hours, start_ts, 'h')   # ts = time_series(24, "05/09/2021 00:00:00", 'h')
        ts.save_predictions_to_db()

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        print("Starting workload forecaster for ",sys.argv[1],"engine for",sys.argv[2],"seconds")
        main(sys.argv[1],int(sys.argv[2]),sys.argv[3],sys.argv[4])
    else:
        main('mysql', 32400, 'all', 'NoSetupKafka')


    '''
    Possible engines
    ================
    rdbms_mgmt = rdbmsManager('postgresql')
    rdbms_mgmt.stream_metrics(5)

    rdbms_mgmt = rdbmsManager('mssql')
    rdbms_mgmt.stream_metrics(5)

    rdbms_mgmt = rdbmsManager('mysql')
    rdbms_mgmt.stream_metrics(5)

    rdbms_mgmt = rdbmsManager('oracle')
    rdbms_mgmt.stream_metrics(5)
    '''
