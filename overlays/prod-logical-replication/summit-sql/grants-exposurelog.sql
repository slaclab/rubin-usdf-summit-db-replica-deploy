-- public schema exposurelog table
GRANT USAGE ON SCHEMA public TO replicauser;
GRANT SELECT ON public.alembic_version TO replicauser;
GRANT SELECT ON public.message TO replicauser;

-- cdb schema
GRANT USAGE ON SCHEMA cdb TO replicauser;
GRANT SELECT ON cdb.cdb_latiss_version TO replicauser;
GRANT SELECT ON cdb.cdb_lsstcomcam_version TO replicauser;
GRANT SELECT ON cdb.cdb_lsstcomcamsim_version TO replicauser;


-- cdb_latiss schema
GRANT USAGE ON SCHEMA cdb_latiss TO replicauser;
GRANT SELECT ON cdb_latiss.ccdexposure TO replicauser;
GRANT SELECT ON cdb_latiss.ccdexposure_camera TO replicauser;
GRANT SELECT ON cdb_latiss.ccdexposure_flexdata TO replicauser;
GRANT SELECT ON cdb_latiss.ccdexposure_flexdata_schema TO replicauser;
GRANT SELECT ON cdb_latiss.ccdvisit1_quicklook TO replicauser;
GRANT SELECT ON cdb_latiss.exposure TO replicauser;
GRANT SELECT ON cdb_latiss.exposure_flexdata TO replicauser;
GRANT SELECT ON cdb_latiss.exposure_flexdata_schema TO replicauser;
GRANT SELECT ON cdb_latiss.visit1_quicklook TO replicauser;

-- cdb_lsstcam 
-- blank
-- cdb_lsstcamsim
-- blank

-- cdb_lsstcomcam
GRANT USAGE ON SCHEMA cdb_lsstcomcam TO replicauser;
GRANT SELECT ON cdb_lsstcomcam.ccdexposure TO replicauser;
GRANT SELECT ON cdb_lsstcomcam.ccdexposure_camera TO replicauser;
GRANT SELECT ON cdb_lsstcomcam.ccdexposure_flexdata TO replicauser;
GRANT SELECT ON cdb_lsstcomcam.ccdexposure_flexdata_schema TO replicauser;
GRANT SELECT ON cdb_lsstcomcam.ccdvisit1_quicklook TO replicauser;
GRANT SELECT ON cdb_lsstcomcam.exposure TO replicauser;
GRANT SELECT ON cdb_lsstcomcam.exposure_flexdata TO replicauser;
GRANT SELECT ON cdb_lsstcomcam.exposure_flexdata_schema TO replicauser;
GRANT SELECT ON cdb_lsstcomcam.visit1_quicklook TO replicauser;

-- cdb_lsstcomcamsim
GRANT USAGE ON SCHEMA cdb_lsstcomcamsim TO replicauser;
GRANT SELECT ON cdb_lsstcomcamsim.ccdexposure TO replicauser;
GRANT SELECT ON cdb_lsstcomcamsim.ccdexposure_camera TO replicauser;
GRANT SELECT ON cdb_lsstcomcamsim.ccdexposure_flexdata TO replicauser;
GRANT SELECT ON cdb_lsstcomcamsim.ccdexposure_flexdata_schema TO replicauser;
GRANT SELECT ON cdb_lsstcomcamsim.ccdvisit1_quicklook TO replicauser;
GRANT SELECT ON cdb_lsstcomcamsim.exposure TO replicauser;
GRANT SELECT ON cdb_lsstcomcamsim.exposure_flexdata TO replicauser;
GRANT SELECT ON cdb_lsstcomcamsim.exposure_flexdata_schema TO replicauser;
GRANT SELECT ON cdb_lsstcomcamsim.visit1_quicklook TO replicauser;