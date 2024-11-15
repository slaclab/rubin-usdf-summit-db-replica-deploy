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
grant all privileges on database exposurelog to rubinadmin;
grant all privileges on database narrativelog to rubinadmin;
grant all privileges on database nightreport to rubinadmin;
grant all privileges on database postgres to rubinadmin;


-- summit_ro_usdf_rw
-- ro
GRANT USAGE ON SCHEMA public TO summit_ro_usdf_rw;
GRANT SELECT ON ALL TABLES in SCHEMA PUBLIC to summit_ro_usdf_rw;
GRANT SELECT ON public.alembic_version TO summit_ro_usdf_rw;
GRANT SELECT ON public. message TO summit_ro_usdf_rw;
GRANT USAGE ON SCHEMA cdb TO summit_ro_usdf_rw;
GRANT USAGE ON SCHEMA cdb_latiss TO summit_ro_usdf_rw;
GRANT USAGE ON SCHEMA cdb_lsstcam TO summit_ro_usdf_rw;
GRANT USAGE ON SCHEMA cdb_lsstcamsim TO summit_ro_usdf_rw;
GRANT USAGE ON SCHEMA cdb_lsstcomcam TO summit_ro_usdf_rw;
GRANT USAGE ON SCHEMA cdb_lsstcomcamsim TO summit_ro_usdf_rw;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_latiss TO summit_ro_usdf_rw;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcam TO summit_ro_usdf_rw;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcamsim TO summit_ro_usdf_rw;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcomcam TO summit_ro_usdf_rw;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcomcamsim TO summit_ro_usdf_rw;
-- rw
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA cdb TO summit_ro_usdf_rw;