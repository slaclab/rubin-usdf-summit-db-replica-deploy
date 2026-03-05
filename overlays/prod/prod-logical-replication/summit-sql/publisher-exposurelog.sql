-- public schema exposurelog table
CREATE PUBLICATION usdfpub FOR TABLE message, alembic_version;

-- cdb_latiss schema
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdexposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdexposure_camera;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdexposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdexposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.ccdvisit1_quicklook;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.exposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.exposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.exposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.exposure_quicklook;
ALTER PUBLICATION usdfpub ADD TABLE cdb_latiss.visit1_quicklook;

-- cdb_lsstcam
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.ccdexposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.ccdexposure_camera;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.ccdexposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.ccdexposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.ccdexposure_quicklook;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.ccdvisit1_quicklook;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.exposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.exposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.exposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.exposure_quicklook;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcam.visit1_quicklook;

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
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcam.exposure_quicklook;
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
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.exposure_quicklook;
ALTER PUBLICATION usdfpub ADD TABLE cdb_lsstcomcamsim.visit1_quicklook;

--- cdb_startrackerfast
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackerfast.exposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackerfast.exposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackerfast.exposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackerfast.exposure_quicklook

--- cdb_startrackernarrow
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackernarrow.exposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackernarrow.exposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackernarrow.exposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackernarrow.exposure_quicklook

--- cdb_startrackerwide
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackerwide.exposure;
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackerwide.exposure_flexdata;
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackerwide.exposure_flexdata_schema;
ALTER PUBLICATION usdfpub ADD TABLE cdb_startrackerwide.exposure_quicklook