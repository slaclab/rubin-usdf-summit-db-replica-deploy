-- public schema nightreport table
GRANT USAGE ON SCHEMA public TO replicauser;
GRANT SELECT ON public.alembic_version TO replicauser;
GRANT SELECT ON public.nightreport TO replicauser;
