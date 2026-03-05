-- rubin
\c exposurelog
GRANT USAGE ON SCHEMA public TO rubin;
GRANT SELECT ON ALL TABLES in SCHEMA PUBLIC to rubin;
GRANT SELECT ON public.alembic_version TO rubin;
GRANT SELECT ON public. message TO rubin;
GRANT USAGE ON SCHEMA cdb TO rubin;
GRANT USAGE ON SCHEMA cdb_latiss TO rubin;
GRANT USAGE ON SCHEMA cdb_lsstcam TO rubin;
GRANT USAGE ON SCHEMA cdb_lsstcamsim TO rubin;
GRANT USAGE ON SCHEMA cdb_lsstcomcam TO rubin;
GRANT USAGE ON SCHEMA cdb_lsstcomcamsim TO rubin;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb TO rubin;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_latiss TO rubin;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcam TO rubin;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcamsim TO rubin;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcomcam TO rubin;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcomcamsim TO rubin;

\c narrativelog
GRANT USAGE ON SCHEMA public TO rubin;
GRANT SELECT ON ALL TABLES in SCHEMA PUBLIC to rubin;

\c nightreport
GRANT USAGE ON SCHEMA public TO rubin;
GRANT SELECT ON ALL TABLES in SCHEMA PUBLIC to rubin;

-- rubinadmin
\c exposurelog
ALTER DEFAULT PRIVILEGES FOR USER rubinadmin in SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES to rubinadmin; 
GRANT all privileges on database exposurelog to rubinadmin;
GRANT all privileges on database narrativelog to rubinadmin;
GRANT all privileges on database nightreport to rubinadmin;
GRANT all privileges on database postgres to rubinadmin;
GRANT pg_create_subscription to rubinadmin;
GRANT pg_read_all_data to rubinadmin;
ALTER USER rubinadmin WITH SUPERUSER;