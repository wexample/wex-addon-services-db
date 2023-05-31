BEGIN;
REVOKE CONNECT ON DATABASE :db_name FROM public;
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = :db_name_escaped;
COMMIT;
DROP DATABASE IF EXISTS :db_name;

