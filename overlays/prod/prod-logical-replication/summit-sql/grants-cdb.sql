-- cdb schema
GRANT USAGE ON SCHEMA cdb TO replicauser;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb TO replicauser;

-- cdb_latiss schema
GRANT USAGE ON SCHEMA cdb_latiss TO replicauser;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_latiss TO replicauser;

-- cdb_lsstcam
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcam TO replicauser;
GRANT USAGE ON SCHEMA cdb_lsstcam TO replicauser;

-- cdb_lsstcamsim

-- cdb_lsstcomcam
GRANT USAGE ON SCHEMA cdb_lsstcomcam TO replicauser;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcomcam TO replicauser;

-- cdb_lsstcomcamsim
GRANT USAGE ON SCHEMA cdb_lsstcomcamsim TO replicauser;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_lsstcomcamsim TO replicauser;

-- cdb_strackerfast schema
GRANT USAGE ON SCHEMA cdb_startrackerfast TO replicauser;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_startrackerfast TO replicauser;

-- cdb_strackernarrow schema
GRANT USAGE ON SCHEMA cdb_startrackernarrow TO replicauser;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_startrackernarrow TO replicauser;

-- cdb_strackerwide schema
GRANT USAGE ON SCHEMA cdb_startrackerwide TO replicauser;
GRANT SELECT ON ALL TABLES IN SCHEMA cdb_startrackerwide TO replicauser;