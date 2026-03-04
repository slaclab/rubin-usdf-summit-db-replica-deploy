--
-- Name: cdb_latiss_version; Type: TABLE; Schema: cdb; Owner: oods
--

CREATE TABLE cdb.cdb_latiss_version (
    version_num character varying(32) NOT NULL
);
ALTER TABLE cdb.cdb_latiss_version OWNER TO oods;

--
-- Name: cdb_lsstcam_version; Type: TABLE; Schema: cdb; Owner: oods
--

CREATE TABLE cdb.cdb_lsstcam_version (
    version_num character varying(32) NOT NULL
);
ALTER TABLE cdb.cdb_lsstcam_version OWNER TO oods;


--
-- Name: cdb_lsstcomcam_version; Type: TABLE; Schema: cdb; Owner: oods
--

CREATE TABLE cdb.cdb_lsstcomcam_version (
    version_num character varying(32) NOT NULL
);
ALTER TABLE cdb.cdb_lsstcomcam_version OWNER TO oods;

--
-- Name: cdb_lsstcomcamsim_version; Type: TABLE; Schema: cdb; Owner: oods
--

CREATE TABLE cdb.cdb_lsstcomcamsim_version (
    version_num character varying(32) NOT NULL
);
ALTER TABLE cdb.cdb_lsstcomcamsim_version OWNER TO oods;

--
-- Name: cdb_startrackerfast_version; Type: TABLE; Schema: cdb; Owner: oods
--

CREATE TABLE cdb.cdb_startrackerfast_version (
    version_num character varying(32) NOT NULL
);
ALTER TABLE cdb.cdb_startrackerfast_version OWNER TO oods;

--
-- Name: cdb_startrackernarrow_version; Type: TABLE; Schema: cdb; Owner: oods
--

CREATE TABLE cdb.cdb_startrackernarrow_version (
    version_num character varying(32) NOT NULL
);
ALTER TABLE cdb.cdb_startrackernarrow_version OWNER TO oods;

--
-- Name: cdb_startrackerwide_version; Type: TABLE; Schema: cdb; Owner: oods
--

CREATE TABLE cdb.cdb_startrackerwide_version (
    version_num character varying(32) NOT NULL
);
ALTER TABLE cdb.cdb_startrackerwide_version OWNER TO oods;
