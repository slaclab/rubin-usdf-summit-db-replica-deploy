-- DROP CDB Schemas
DROP TABLE IF EXISTS cdb.cdb_latiss_version;
DROP TABLE IF EXISTS cdb.cdb_lsstcomcam_version;
DROP TABLE IF EXISTS cdb.cdb_lsstcomcamsim_version;
DROP TABLE IF EXISTS cdb.cdb_startrackerfast_version;
DROP TABLE IF EXISTS cdb.cdb_startrackernarrow_version;
DROP TABLE IF EXISTS cdb.cdb_startrackerwide_version;

-- DROP existing Views
--
DROP VIEW IF EXISTS cdb_latiss.visit;
DROP VIEW IF EXISTS cdb_latiss.ccdvisit1;
DROP VIEW IF EXISTS cdb_lsstcomcam.ccdvisit1;
DROP VIEW IF EXISTS cdb_lsstcomcam.visit1;
DROP VIEW IF EXISTS cdb_lsstcomcamsim.ccdvisit1;
DROP VIEW IF EXISTS cdb_lsstcomcamsim.visit1;

--
-- Name: cdb_latiss; Type: SCHEMA; Schema: -; Owner: oods
--
DROP SCHEMA cdb_latiss CASCADE;
CREATE SCHEMA cdb_latiss;


ALTER SCHEMA cdb_latiss OWNER TO oods;

--
-- Name: cdb_lsstcam; Type: SCHEMA; Schema: -; Owner: oods
--
DROP SCHEMA cdb_lsstcam CASCADE;
CREATE SCHEMA cdb_lsstcam;
ALTER SCHEMA cdb_lsstcam OWNER TO oods;

--
-- Name: cdb_lsstcamsim; Type: SCHEMA; Schema: -; Owner: oods
--
DROP SCHEMA cdb_lsstcamsim CASCADE;
CREATE SCHEMA cdb_lsstcamsim;
ALTER SCHEMA cdb_lsstcamsim OWNER TO oods;

--
-- Name: cdb_lsstcomcam; Type: SCHEMA; Schema: -; Owner: oods
--
DROP SCHEMA cdb_lsstcomcam CASCADE;
CREATE SCHEMA cdb_lsstcomcam;
ALTER SCHEMA cdb_lsstcomcam OWNER TO oods;

--
-- Name: cdb_lsstcomcamsim; Type: SCHEMA; Schema: -; Owner: oods
--
DROP SCHEMA cdb_lsstcomcamsim CASCADE;
CREATE SCHEMA cdb_lsstcomcamsim;


ALTER SCHEMA cdb_lsstcomcamsim OWNER TO oods;

--
-- Name: cdb_startrackerfast; Type: SCHEMA; Schema: -; Owner: oods
--
DROP SCHEMA cdb_startrackerfast CASCADE;
CREATE SCHEMA cdb_startrackerfast;


ALTER SCHEMA cdb_startrackerfast OWNER TO oods;

--
-- Name: cdb_startrackernarrow; Type: SCHEMA; Schema: -; Owner: oods
--
DROP SCHEMA cdb_startrackernarrow CASCADE;
CREATE SCHEMA cdb_startrackernarrow;
ALTER SCHEMA cdb_startrackernarrow OWNER TO oods;

--
-- Name: cdb_startrackerwide; Type: SCHEMA; Schema: -; Owner: oods
--
DROP SCHEMA cdb_startrackerwide CASCADE;
CREATE SCHEMA cdb_startrackerwide;
ALTER SCHEMA cdb_startrackerwide OWNER TO oods;
