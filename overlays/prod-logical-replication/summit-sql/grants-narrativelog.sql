-- public schema narrativelog table
GRANT USAGE ON SCHEMA public TO replicauser;
GRANT SELECT ON public.alembic_version TO replicauser;
GRANT SELECT ON public.message TO replicauser;
GRANT SELECT ON public.jira_fields TO replicauser;
