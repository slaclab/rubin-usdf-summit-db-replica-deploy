-- public schema exposurelog table
CREATE PUBLICATION usdfpub FOR TABLE alembic_version, message;

-- cdb schema
ALTER PUBLICATION usdfpub ADD TABLE cdb.cdb_latiss_version;
ALTER PUBLICATION usdfpub ADD TABLE cdb.cdb_lsstcomcam_version;
ALTER PUBLICATION usdfpub ADD TABLE cdb.cdb_lsstcomcamsim_version;


-- cdb_latiss schema
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdexposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdexposure_camera;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdexposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdexposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdvisit1_quicklook;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.exposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.exposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.exposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.visit1_quicklook;

-- cdb_lsstcam 
-- blank
-- cdb_lsstcamsim
-- blank

-- cdb_lsstcomcam
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.ccdexposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.ccdexposure_camera;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.ccdexposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.ccdexposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.ccdvisit1_quicklook;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.exposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.exposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.exposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.visit1_quicklook;

-- cdb_lsstcomcamsim
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.ccdexposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.ccdexposure_camera;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.ccdexposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.ccdexposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.ccdvisit1_quicklook;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.exposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.exposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.exposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.visit1_quicklook;