--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-2.pgdg110+2)
-- Dumped by pg_dump version 14.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: cdb; Type: SCHEMA; Schema: -; Owner: oods
--

CREATE SCHEMA cdb;


ALTER SCHEMA cdb OWNER TO oods;

--
-- Name: cdb_latiss; Type: SCHEMA; Schema: -; Owner: oods
--

CREATE SCHEMA cdb_latiss;


ALTER SCHEMA cdb_latiss OWNER TO oods;

--
-- Name: cdb_lsstcam; Type: SCHEMA; Schema: -; Owner: oods
--

CREATE SCHEMA cdb_lsstcam;


ALTER SCHEMA cdb_lsstcam OWNER TO oods;

--
-- Name: cdb_lsstcamsim; Type: SCHEMA; Schema: -; Owner: oods
--

CREATE SCHEMA cdb_lsstcamsim;


ALTER SCHEMA cdb_lsstcamsim OWNER TO oods;

--
-- Name: cdb_lsstcomcam; Type: SCHEMA; Schema: -; Owner: oods
--

CREATE SCHEMA cdb_lsstcomcam;


ALTER SCHEMA cdb_lsstcomcam OWNER TO oods;

--
-- Name: cdb_lsstcomcamsim; Type: SCHEMA; Schema: -; Owner: oods
--

CREATE SCHEMA cdb_lsstcomcamsim;


ALTER SCHEMA cdb_lsstcomcamsim OWNER TO oods;

--
-- Name: exposure_flag_enum; Type: TYPE; Schema: public; Owner: exposurelog
--

CREATE TYPE public.exposure_flag_enum AS ENUM (
    'none',
    'junk',
    'questionable'
);


ALTER TYPE public.exposure_flag_enum OWNER TO exposurelog;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cdb_latiss_version; Type: TABLE; Schema: cdb; Owner: oods
--

CREATE TABLE cdb.cdb_latiss_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE cdb.cdb_latiss_version OWNER TO oods;

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
-- Name: ccdexposure; Type: TABLE; Schema: cdb_latiss; Owner: oods
--

CREATE TABLE cdb_latiss.ccdexposure (
    ccdexposure_id bigint NOT NULL,
    exposure_id bigint NOT NULL,
    detector integer NOT NULL,
    s_region character varying(1024),
    day_obs integer NOT NULL,
    seq_num integer NOT NULL
);


ALTER TABLE cdb_latiss.ccdexposure OWNER TO oods;

--
-- Name: COLUMN ccdexposure.ccdexposure_id; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure.ccdexposure_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdexposure.exposure_id; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure.exposure_id IS 'Identifier of the exposure.';


--
-- Name: COLUMN ccdexposure.detector; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure.detector IS 'Number of the detector in the focal plane.';


--
-- Name: COLUMN ccdexposure.s_region; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure.s_region IS 'Sky region in STC-S format (https://www.ivoa.net/documents/STC-S/20130917/index.html).';


--
-- Name: COLUMN ccdexposure.day_obs; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure.day_obs IS 'Day of observation.';


--
-- Name: COLUMN ccdexposure.seq_num; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure.seq_num IS 'Sequence number.';


--
-- Name: ccdexposure_camera; Type: TABLE; Schema: cdb_latiss; Owner: oods
--

CREATE TABLE cdb_latiss.ccdexposure_camera (
    ccdexposure_id bigint NOT NULL,
    temp_set double precision,
    ccd_temp double precision
);


ALTER TABLE cdb_latiss.ccdexposure_camera OWNER TO oods;

--
-- Name: COLUMN ccdexposure_camera.ccdexposure_id; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_camera.ccdexposure_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdexposure_camera.temp_set; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_camera.temp_set IS 'Temperature setpoint of CCD in degC.';


--
-- Name: COLUMN ccdexposure_camera.ccd_temp; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_camera.ccd_temp IS 'Temperature of CCD in degC.';


--
-- Name: ccdexposure_ccdexposure_id_seq; Type: SEQUENCE; Schema: cdb_latiss; Owner: oods
--

CREATE SEQUENCE cdb_latiss.ccdexposure_ccdexposure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cdb_latiss.ccdexposure_ccdexposure_id_seq OWNER TO oods;

--
-- Name: ccdexposure_ccdexposure_id_seq; Type: SEQUENCE OWNED BY; Schema: cdb_latiss; Owner: oods
--

ALTER SEQUENCE cdb_latiss.ccdexposure_ccdexposure_id_seq OWNED BY cdb_latiss.ccdexposure.ccdexposure_id;


--
-- Name: ccdexposure_flexdata; Type: TABLE; Schema: cdb_latiss; Owner: oods
--

CREATE TABLE cdb_latiss.ccdexposure_flexdata (
    obs_id bigint NOT NULL,
    key character varying(128) NOT NULL,
    value text
);


ALTER TABLE cdb_latiss.ccdexposure_flexdata OWNER TO oods;

--
-- Name: COLUMN ccdexposure_flexdata.obs_id; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_flexdata.obs_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdexposure_flexdata.key; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_flexdata.key IS 'Name of key.';


--
-- Name: COLUMN ccdexposure_flexdata.value; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_flexdata.value IS 'Content of value as a string.';


--
-- Name: ccdexposure_flexdata_schema; Type: TABLE; Schema: cdb_latiss; Owner: oods
--

CREATE TABLE cdb_latiss.ccdexposure_flexdata_schema (
    key character varying(128) NOT NULL,
    dtype character varying(64) NOT NULL,
    doc text NOT NULL,
    unit character varying(128),
    ucd character varying(128)
);


ALTER TABLE cdb_latiss.ccdexposure_flexdata_schema OWNER TO oods;

--
-- Name: COLUMN ccdexposure_flexdata_schema.key; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_flexdata_schema.key IS 'Name of key.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.dtype; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_flexdata_schema.dtype IS 'Name of the data type of the value, one of bool, int, float, str.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.doc; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_flexdata_schema.doc IS 'Documentation string.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.unit; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_flexdata_schema.unit IS 'Unit for the value. Should be from the IVOA (https://www.ivoa.net/documents/VOUnits/) or astropy.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.ucd; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdexposure_flexdata_schema.ucd IS 'IVOA Unified Content Descriptor (https://www.ivoa.net/documents/UCD1+/).';


--
-- Name: ccdvisit1; Type: VIEW; Schema: cdb_latiss; Owner: oods
--

CREATE VIEW cdb_latiss.ccdvisit1 AS
 SELECT ccdexposure.ccdexposure_id AS ccdvisit_id,
    ccdexposure.exposure_id,
    ccdexposure.detector,
    ccdexposure.s_region
   FROM cdb_latiss.ccdexposure;


ALTER TABLE cdb_latiss.ccdvisit1 OWNER TO oods;

--
-- Name: ccdvisit1_quicklook; Type: TABLE; Schema: cdb_latiss; Owner: oods
--

CREATE TABLE cdb_latiss.ccdvisit1_quicklook (
    ccdvisit_id bigint NOT NULL,
    s_ra double precision,
    s_dec double precision,
    zenith_distance double precision,
    photometric_calib double precision,
    psf_sigma double precision,
    sky_bg double precision,
    sky_noise double precision,
    zero_point double precision,
    seeing_zenith_500nm double precision,
    astrom_offset_mean double precision,
    astrom_offset_std double precision,
    eff_time double precision,
    eff_time_psf_sigma_scale double precision,
    eff_time_sky_bg_scale double precision,
    eff_time_zero_point_scale double precision,
    mean_var double precision,
    n_psf_star integer,
    psf_area double precision,
    psf_ixx double precision,
    psf_ixy double precision,
    psf_iyy double precision,
    psf_star_delta_e1_median double precision,
    psf_star_delta_e2_median double precision,
    psf_star_delta_e1_scatter double precision,
    psf_star_delta_e2_scatter double precision,
    psf_star_delta_size_median double precision,
    psf_star_delta_size_scatter double precision,
    psf_star_scaled_delta_size_scatter double precision,
    psf_trace_radius_delta double precision,
    max_dist_to_nearest_psf double precision
);


ALTER TABLE cdb_latiss.ccdvisit1_quicklook OWNER TO oods;

--
-- Name: COLUMN ccdvisit1_quicklook.ccdvisit_id; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.ccdvisit_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdvisit1_quicklook.s_ra; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.s_ra IS 'Central Spatial Position in ICRS; Computed right ascension of CCD center.';


--
-- Name: COLUMN ccdvisit1_quicklook.s_dec; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.s_dec IS 'Central Spatial Position in ICRS; Computed declination of CCD center.';


--
-- Name: COLUMN ccdvisit1_quicklook.zenith_distance; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.zenith_distance IS 'Zenith distance at observation mid-point.';


--
-- Name: COLUMN ccdvisit1_quicklook.photometric_calib; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.photometric_calib IS 'Conversion from DN to nanojansky.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_sigma; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_sigma IS 'PSF model second-moments determinant radius (center of chip).';


--
-- Name: COLUMN ccdvisit1_quicklook.sky_bg; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.sky_bg IS 'Average sky background.';


--
-- Name: COLUMN ccdvisit1_quicklook.sky_noise; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.sky_noise IS 'RMS noise of the sky background.';


--
-- Name: COLUMN ccdvisit1_quicklook.zero_point; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.zero_point IS 'Photometric zero point.';


--
-- Name: COLUMN ccdvisit1_quicklook.seeing_zenith_500nm; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.seeing_zenith_500nm IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1.';


--
-- Name: COLUMN ccdvisit1_quicklook.astrom_offset_mean; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.astrom_offset_mean IS 'Mean offset of astrometric calibration matches.';


--
-- Name: COLUMN ccdvisit1_quicklook.astrom_offset_std; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.astrom_offset_std IS 'Standard deviation of offsets of astrometric calibration matches.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.eff_time IS 'Effective exposure time.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time_psf_sigma_scale; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.eff_time_psf_sigma_scale IS 'Scale factor for effective exposure time based on PSF sigma.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time_sky_bg_scale; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.eff_time_sky_bg_scale IS 'Scale factor for effective exposure time based on sky background.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time_zero_point_scale; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.eff_time_zero_point_scale IS 'Scale factor for effective exposure time based on zero point.';


--
-- Name: COLUMN ccdvisit1_quicklook.mean_var; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.mean_var IS 'Mean of the variance plane.';


--
-- Name: COLUMN ccdvisit1_quicklook.n_psf_star; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.n_psf_star IS 'Number of stars used for PSF model.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_area; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_area IS 'PSF area.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_ixx; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_ixx IS 'PSF Ixx moment.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_ixy; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_ixy IS 'PSF Ixy moment.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_iyy; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_iyy IS 'PSF Iyy moment.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e1_median; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_star_delta_e1_median IS 'Median E1 residual (starE1 - psfE1) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e2_median; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_star_delta_e2_median IS 'Median E2 residual (starE2 - psfE2) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e1_scatter; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_star_delta_e1_scatter IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e2_scatter; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_star_delta_e2_scatter IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_size_median; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_star_delta_size_median IS 'Median size residual (starSize - psfSize) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_size_scatter; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_star_delta_size_scatter IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_scaled_delta_size_scatter; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_star_scaled_delta_size_scatter IS 'Scatter (via MAD) of size residual scaled by median size squared.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_trace_radius_delta; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.psf_trace_radius_delta IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels.';


--
-- Name: COLUMN ccdvisit1_quicklook.max_dist_to_nearest_psf; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.ccdvisit1_quicklook.max_dist_to_nearest_psf IS 'Maximum distance of an unmasked pixel to its nearest model PSF star.';


--
-- Name: exposure; Type: TABLE; Schema: cdb_latiss; Owner: oods
--

CREATE TABLE cdb_latiss.exposure (
    exposure_id bigint NOT NULL,
    exposure_name character varying(20) NOT NULL,
    controller character varying(1) NOT NULL,
    day_obs integer NOT NULL,
    seq_num integer NOT NULL,
    physical_filter character varying(32),
    band character varying(32),
    s_ra double precision,
    s_dec double precision,
    sky_rotation double precision,
    azimuth_start double precision,
    azimuth_end double precision,
    azimuth double precision,
    altitude_start double precision,
    altitude_end double precision,
    altitude double precision,
    zenith_distance_start double precision,
    zenith_distance_end double precision,
    zenith_distance double precision,
    airmass double precision,
    exp_midpt timestamp without time zone,
    exp_midpt_mjd double precision,
    obs_start timestamp without time zone,
    obs_start_mjd double precision,
    obs_end timestamp without time zone,
    obs_end_mjd double precision,
    exp_time double precision,
    shut_time double precision,
    dark_time double precision,
    group_id character varying(64),
    cur_index integer,
    max_index integer,
    img_type character varying(64),
    emulated boolean,
    science_program character varying(64),
    observation_reason character varying(68),
    target_name character varying(64),
    air_temp double precision,
    pressure double precision,
    humidity double precision,
    wind_speed double precision,
    wind_dir double precision,
    dimm_seeing double precision,
    shut_lower double precision,
    shut_upper double precision,
    focus_z double precision,
    dome_azimuth double precision,
    simulated boolean,
    s_region character varying(1024),
    vignette character varying(10),
    vignette_min character varying(10)
);


ALTER TABLE cdb_latiss.exposure OWNER TO oods;

--
-- Name: COLUMN exposure.exposure_id; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.exposure_id IS 'Unique identifier.';


--
-- Name: COLUMN exposure.exposure_name; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.exposure_name IS 'Official name of the exposure.';


--
-- Name: COLUMN exposure.controller; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.controller IS 'The abbreviation of the controller used for the observation (O, C).';


--
-- Name: COLUMN exposure.day_obs; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.day_obs IS 'Day of observation.';


--
-- Name: COLUMN exposure.seq_num; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.seq_num IS 'Sequence number.';


--
-- Name: COLUMN exposure.physical_filter; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.physical_filter IS 'ID of physical filter, the filter associated with a particular instrument.';


--
-- Name: COLUMN exposure.band; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.band IS 'Name of the band used to take the exposure.  Abstract filter that is not associated with a particular instrument.';


--
-- Name: COLUMN exposure.s_ra; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.s_ra IS 'Central Spatial Position in ICRS; Right ascension of targeted focal plane center.';


--
-- Name: COLUMN exposure.s_dec; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.s_dec IS 'Central Spatial Position in ICRS; Declination of targeted focal plane center.';


--
-- Name: COLUMN exposure.sky_rotation; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.sky_rotation IS 'Targeted sky rotation angle.';


--
-- Name: COLUMN exposure.azimuth_start; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.azimuth_start IS 'Azimuth of focal plane center at the start of the exposure.';


--
-- Name: COLUMN exposure.azimuth_end; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.azimuth_end IS 'Azimuth of focal plane center at the end of the exposure.';


--
-- Name: COLUMN exposure.azimuth; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.azimuth IS 'Azimuth of focal plane center at the middle of the exposure.';


--
-- Name: COLUMN exposure.altitude_start; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.altitude_start IS 'Altitude of focal plane center at the start of the exposure.';


--
-- Name: COLUMN exposure.altitude_end; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.altitude_end IS 'Altitude of focal plane center at the end of the exposure.';


--
-- Name: COLUMN exposure.altitude; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.altitude IS 'Altitude of focal plane center at the middle of the exposure.';


--
-- Name: COLUMN exposure.zenith_distance_start; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.zenith_distance_start IS 'Zenith distance at the start of the exposure.';


--
-- Name: COLUMN exposure.zenith_distance_end; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.zenith_distance_end IS 'Zenith distance at the end of the exposure.';


--
-- Name: COLUMN exposure.zenith_distance; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.zenith_distance IS 'Zenith distance at the middle of the exposure.';


--
-- Name: COLUMN exposure.airmass; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.airmass IS 'Airmass of the observed line of sight at the middle of the exposure.';


--
-- Name: COLUMN exposure.exp_midpt; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.exp_midpt IS 'Midpoint time for exposure at the fiducial center of the focal plane. array. TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.exp_midpt_mjd; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.exp_midpt_mjd IS 'Midpoint time for exposure at the fiducial center of the focal plane. array in MJD. TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_start; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.obs_start IS 'Start time of the exposure at the fiducial center of the focal plane. array, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_start_mjd; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.obs_start_mjd IS 'Start of the exposure in MJD, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_end; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.obs_end IS 'End time of the exposure at the fiducial center of the focal plane. array, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_end_mjd; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.obs_end_mjd IS 'End of the exposure in MJD, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.exp_time; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.exp_time IS 'Spatially-averaged duration of exposure, accurate to 10ms.';


--
-- Name: COLUMN exposure.shut_time; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.shut_time IS 'Spatially-averaged shutter-open duration, accurate to 10ms.';


--
-- Name: COLUMN exposure.dark_time; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.dark_time IS 'Duration from last clear to readout, accurate to 10ms.';


--
-- Name: COLUMN exposure.group_id; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.group_id IS 'Identifier for the group that this exposure is part of.';


--
-- Name: COLUMN exposure.cur_index; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.cur_index IS 'Number (1-based) of the observation within its group.';


--
-- Name: COLUMN exposure.max_index; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.max_index IS 'Expected number of observations within the group.';


--
-- Name: COLUMN exposure.img_type; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.img_type IS 'Type of exposure taken.';


--
-- Name: COLUMN exposure.emulated; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.emulated IS 'True if the exposure was taken in emulation mode.';


--
-- Name: COLUMN exposure.science_program; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.science_program IS 'Science program.';


--
-- Name: COLUMN exposure.observation_reason; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.observation_reason IS 'Reason for the observation.';


--
-- Name: COLUMN exposure.target_name; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.target_name IS 'Target of the observation.';


--
-- Name: COLUMN exposure.air_temp; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.air_temp IS 'Outside air temperature in degC.';


--
-- Name: COLUMN exposure.pressure; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.pressure IS 'Outside air pressure.';


--
-- Name: COLUMN exposure.humidity; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.humidity IS 'Outside relative humidity.';


--
-- Name: COLUMN exposure.wind_speed; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.wind_speed IS 'Outside wind speed.';


--
-- Name: COLUMN exposure.wind_dir; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.wind_dir IS 'Wind direction.';


--
-- Name: COLUMN exposure.dimm_seeing; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.dimm_seeing IS 'Seeing as measured by external DIMM (FWHM).';


--
-- Name: COLUMN exposure.shut_lower; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.shut_lower IS 'Dome dropout door opening percentage.';


--
-- Name: COLUMN exposure.shut_upper; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.shut_upper IS 'Dome main door opening percentage.';


--
-- Name: COLUMN exposure.focus_z; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.focus_z IS 'Focus Z position.';


--
-- Name: COLUMN exposure.dome_azimuth; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.dome_azimuth IS 'Dome azimuth.';


--
-- Name: COLUMN exposure.simulated; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.simulated IS 'Were any control system components simulated?';


--
-- Name: COLUMN exposure.s_region; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.s_region IS 'Sky region in STC-S format (https://www.ivoa.net/documents/STC-S/20130917/index.html).';


--
-- Name: COLUMN exposure.vignette; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.vignette IS 'Instrument blocked from the sky: UNKNOWN, NO, PARTIALLY, FULLY.';


--
-- Name: COLUMN exposure.vignette_min; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure.vignette_min IS 'Lowest amount of instrument vignetting detected during the exposure: UNKNOWN, NO, PARTIALLY, FULLY.';


--
-- Name: exposure_exposure_id_seq; Type: SEQUENCE; Schema: cdb_latiss; Owner: oods
--

CREATE SEQUENCE cdb_latiss.exposure_exposure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cdb_latiss.exposure_exposure_id_seq OWNER TO oods;

--
-- Name: exposure_exposure_id_seq; Type: SEQUENCE OWNED BY; Schema: cdb_latiss; Owner: oods
--

ALTER SEQUENCE cdb_latiss.exposure_exposure_id_seq OWNED BY cdb_latiss.exposure.exposure_id;


--
-- Name: exposure_flexdata; Type: TABLE; Schema: cdb_latiss; Owner: oods
--

CREATE TABLE cdb_latiss.exposure_flexdata (
    obs_id bigint NOT NULL,
    key character varying(128) NOT NULL,
    value text,
    day_obs integer NOT NULL,
    seq_num integer NOT NULL
);


ALTER TABLE cdb_latiss.exposure_flexdata OWNER TO oods;

--
-- Name: COLUMN exposure_flexdata.obs_id; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata.obs_id IS 'Unique identifier.';


--
-- Name: COLUMN exposure_flexdata.key; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata.key IS 'Name of key.';


--
-- Name: COLUMN exposure_flexdata.value; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata.value IS 'Content of value as a string.';


--
-- Name: COLUMN exposure_flexdata.day_obs; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata.day_obs IS 'Day of observation.';


--
-- Name: COLUMN exposure_flexdata.seq_num; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata.seq_num IS 'Sequence number.';


--
-- Name: exposure_flexdata_schema; Type: TABLE; Schema: cdb_latiss; Owner: oods
--

CREATE TABLE cdb_latiss.exposure_flexdata_schema (
    key character varying(128) NOT NULL,
    dtype character varying(64) NOT NULL,
    doc text NOT NULL,
    unit character varying(128),
    ucd character varying(128)
);


ALTER TABLE cdb_latiss.exposure_flexdata_schema OWNER TO oods;

--
-- Name: COLUMN exposure_flexdata_schema.key; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata_schema.key IS 'Name of key.';


--
-- Name: COLUMN exposure_flexdata_schema.dtype; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata_schema.dtype IS 'Name of the data type of the value, one of bool, int, float, str.';


--
-- Name: COLUMN exposure_flexdata_schema.doc; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata_schema.doc IS 'Documentation string.';


--
-- Name: COLUMN exposure_flexdata_schema.unit; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata_schema.unit IS 'Unit for the value. Should be from the IVOA (https://www.ivoa.net/documents/VOUnits/) or astropy.';


--
-- Name: COLUMN exposure_flexdata_schema.ucd; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.exposure_flexdata_schema.ucd IS 'IVOA Unified Content Descriptor (https://www.ivoa.net/documents/UCD1+/).';


--
-- Name: visit1; Type: VIEW; Schema: cdb_latiss; Owner: oods
--

CREATE VIEW cdb_latiss.visit1 AS
 SELECT exposure.exposure_id AS visit_id,
    exposure.exposure_name,
    exposure.controller,
    exposure.day_obs,
    exposure.seq_num,
    exposure.physical_filter,
    exposure.band,
    exposure.s_ra,
    exposure.s_dec,
    exposure.sky_rotation,
    exposure.azimuth_start,
    exposure.azimuth_end,
    exposure.azimuth,
    exposure.altitude_start,
    exposure.altitude_end,
    exposure.altitude,
    exposure.zenith_distance_start,
    exposure.zenith_distance_end,
    exposure.zenith_distance,
    exposure.airmass,
    exposure.exp_midpt,
    exposure.exp_midpt_mjd,
    exposure.obs_start,
    exposure.obs_start_mjd,
    exposure.obs_end,
    exposure.obs_end_mjd,
    exposure.exp_time,
    exposure.shut_time,
    exposure.dark_time,
    exposure.group_id,
    exposure.cur_index,
    exposure.max_index,
    exposure.img_type,
    exposure.emulated,
    exposure.science_program,
    exposure.observation_reason,
    exposure.target_name,
    exposure.air_temp,
    exposure.pressure,
    exposure.humidity,
    exposure.wind_speed,
    exposure.wind_dir,
    exposure.dimm_seeing,
    exposure.shut_lower,
    exposure.shut_upper,
    exposure.focus_z,
    exposure.dome_azimuth,
    exposure.simulated,
    exposure.s_region
   FROM cdb_latiss.exposure;


ALTER TABLE cdb_latiss.visit1 OWNER TO oods;

--
-- Name: visit1_quicklook; Type: TABLE; Schema: cdb_latiss; Owner: oods
--

CREATE TABLE cdb_latiss.visit1_quicklook (
    visit_id bigint NOT NULL,
    n_inputs integer,
    astrom_offset_mean double precision,
    astrom_offset_std double precision,
    eff_time double precision,
    eff_time_psf_sigma_scale double precision,
    eff_time_sky_bg_scale double precision,
    eff_time_zero_point_scale double precision,
    max_dist_to_nearest_psf double precision,
    mean_var double precision,
    n_psf_star integer,
    psf_area double precision,
    psf_ixx double precision,
    psf_ixy double precision,
    psf_iyy double precision,
    psf_sigma double precision,
    psf_star_delta_e1_median double precision,
    psf_star_delta_e1_scatter double precision,
    psf_star_delta_e2_median double precision,
    psf_star_delta_e2_scatter double precision,
    psf_star_delta_size_median double precision,
    psf_star_delta_size_scatter double precision,
    psf_star_scaled_delta_size_scatter double precision,
    psf_trace_radius_delta double precision,
    sky_bg double precision,
    sky_noise double precision,
    seeing_zenith_500nm double precision,
    zero_point double precision,
    low_snr_source_count integer,
    high_snr_source_count integer,
    day_obs integer NOT NULL,
    seq_num integer NOT NULL,
    postisr_pixel_median double precision
);


ALTER TABLE cdb_latiss.visit1_quicklook OWNER TO oods;

--
-- Name: COLUMN visit1_quicklook.visit_id; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.visit_id IS 'Unique identifier.';


--
-- Name: COLUMN visit1_quicklook.n_inputs; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.n_inputs IS 'Number of CCDs used to compute the visit aggregates.';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_mean; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.astrom_offset_mean IS 'Mean offset of astrometric calibration matches.';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_std; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.astrom_offset_std IS 'Standard deviation of offsets of astrometric calibration matches.';


--
-- Name: COLUMN visit1_quicklook.eff_time; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.eff_time IS 'Effective exposure time calculated from PSF sigma, sky background, and zero point.';


--
-- Name: COLUMN visit1_quicklook.eff_time_psf_sigma_scale; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.eff_time_psf_sigma_scale IS 'Scale factor for effective exposure time based on PSF sigma.';


--
-- Name: COLUMN visit1_quicklook.eff_time_sky_bg_scale; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.eff_time_sky_bg_scale IS 'Scale factor for effective exposure time based on sky background.';


--
-- Name: COLUMN visit1_quicklook.eff_time_zero_point_scale; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.eff_time_zero_point_scale IS 'Scale factor for effective exposure time based on zero point.';


--
-- Name: COLUMN visit1_quicklook.max_dist_to_nearest_psf; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.max_dist_to_nearest_psf IS 'Maximum distance of an unmasked pixel to its nearest model PSF star.';


--
-- Name: COLUMN visit1_quicklook.mean_var; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.mean_var IS 'Mean of the variance plane.';


--
-- Name: COLUMN visit1_quicklook.n_psf_star; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.n_psf_star IS 'Number of stars used for PSF model.';


--
-- Name: COLUMN visit1_quicklook.psf_area; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_area IS 'PSF area.';


--
-- Name: COLUMN visit1_quicklook.psf_ixx; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_ixx IS 'PSF Ixx moment.';


--
-- Name: COLUMN visit1_quicklook.psf_ixy; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_ixy IS 'PSF Ixy moment.';


--
-- Name: COLUMN visit1_quicklook.psf_iyy; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_iyy IS 'PSF Iyy moment';


--
-- Name: COLUMN visit1_quicklook.psf_sigma; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_sigma IS 'PSF sigma.';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_median; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_star_delta_e1_median IS 'Median E1 residual (starE1 - psfE1) for PSF stars.';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_scatter; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_star_delta_e1_scatter IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars.';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_median; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_star_delta_e2_median IS 'Median E2 residual (starE2 - psfE2) for PSF stars.';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_scatter; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_star_delta_e2_scatter IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars.';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_median; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_star_delta_size_median IS 'Median size residual (starSize - psfSize) for PSF stars.';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_scatter; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_star_delta_size_scatter IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars.';


--
-- Name: COLUMN visit1_quicklook.psf_star_scaled_delta_size_scatter; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_star_scaled_delta_size_scatter IS 'Scatter (via MAD) of size residual scaled by median size squared.';


--
-- Name: COLUMN visit1_quicklook.psf_trace_radius_delta; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.psf_trace_radius_delta IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels.';


--
-- Name: COLUMN visit1_quicklook.sky_bg; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.sky_bg IS 'Average sky background.';


--
-- Name: COLUMN visit1_quicklook.sky_noise; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.sky_noise IS 'RMS noise of the sky background.';


--
-- Name: COLUMN visit1_quicklook.seeing_zenith_500nm; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.seeing_zenith_500nm IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1.';


--
-- Name: COLUMN visit1_quicklook.zero_point; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.zero_point IS 'Photometric zero point.';


--
-- Name: COLUMN visit1_quicklook.low_snr_source_count; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.low_snr_source_count IS 'Count of low signal-to-noise-ratio sources.';


--
-- Name: COLUMN visit1_quicklook.high_snr_source_count; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.high_snr_source_count IS 'Count of high signal-to-noise-ratio sources.';


--
-- Name: COLUMN visit1_quicklook.day_obs; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.day_obs IS 'Day of observation.';


--
-- Name: COLUMN visit1_quicklook.seq_num; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.seq_num IS 'Sequence number.';


--
-- Name: COLUMN visit1_quicklook.postisr_pixel_median; Type: COMMENT; Schema: cdb_latiss; Owner: oods
--

COMMENT ON COLUMN cdb_latiss.visit1_quicklook.postisr_pixel_median IS 'Median postISR pixel value.';


--
-- Name: ccdexposure; Type: TABLE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE TABLE cdb_lsstcomcam.ccdexposure (
    ccdexposure_id bigint NOT NULL,
    exposure_id bigint NOT NULL,
    detector integer NOT NULL,
    s_region character varying(1024),
    day_obs integer NOT NULL,
    seq_num integer NOT NULL
);


ALTER TABLE cdb_lsstcomcam.ccdexposure OWNER TO oods;

--
-- Name: COLUMN ccdexposure.ccdexposure_id; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure.ccdexposure_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdexposure.exposure_id; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure.exposure_id IS 'Identifier of the exposure.';


--
-- Name: COLUMN ccdexposure.detector; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure.detector IS 'Number of the detector in the focal plane.';


--
-- Name: COLUMN ccdexposure.s_region; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure.s_region IS 'Sky region in STC-S format (https://www.ivoa.net/documents/STC-S/20130917/index.html).';


--
-- Name: COLUMN ccdexposure.day_obs; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure.day_obs IS 'Day of observation.';


--
-- Name: COLUMN ccdexposure.seq_num; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure.seq_num IS 'Sequence number.';


--
-- Name: ccdexposure_camera; Type: TABLE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE TABLE cdb_lsstcomcam.ccdexposure_camera (
    ccdexposure_id bigint NOT NULL,
    temp_set double precision,
    ccd_temp double precision
);


ALTER TABLE cdb_lsstcomcam.ccdexposure_camera OWNER TO oods;

--
-- Name: COLUMN ccdexposure_camera.ccdexposure_id; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_camera.ccdexposure_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdexposure_camera.temp_set; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_camera.temp_set IS 'Temperature setpoint of CCD in degC.';


--
-- Name: COLUMN ccdexposure_camera.ccd_temp; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_camera.ccd_temp IS 'Temperature of CCD in degC.';


--
-- Name: ccdexposure_ccdexposure_id_seq; Type: SEQUENCE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE SEQUENCE cdb_lsstcomcam.ccdexposure_ccdexposure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cdb_lsstcomcam.ccdexposure_ccdexposure_id_seq OWNER TO oods;

--
-- Name: ccdexposure_ccdexposure_id_seq; Type: SEQUENCE OWNED BY; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER SEQUENCE cdb_lsstcomcam.ccdexposure_ccdexposure_id_seq OWNED BY cdb_lsstcomcam.ccdexposure.ccdexposure_id;


--
-- Name: ccdexposure_flexdata; Type: TABLE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE TABLE cdb_lsstcomcam.ccdexposure_flexdata (
    obs_id bigint NOT NULL,
    key character varying(128) NOT NULL,
    value text
);


ALTER TABLE cdb_lsstcomcam.ccdexposure_flexdata OWNER TO oods;

--
-- Name: COLUMN ccdexposure_flexdata.obs_id; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_flexdata.obs_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdexposure_flexdata.key; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_flexdata.key IS 'Name of key.';


--
-- Name: COLUMN ccdexposure_flexdata.value; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_flexdata.value IS 'Content of value as a string.';


--
-- Name: ccdexposure_flexdata_schema; Type: TABLE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE TABLE cdb_lsstcomcam.ccdexposure_flexdata_schema (
    key character varying(128) NOT NULL,
    dtype character varying(64) NOT NULL,
    doc text NOT NULL,
    unit character varying(128),
    ucd character varying(128)
);


ALTER TABLE cdb_lsstcomcam.ccdexposure_flexdata_schema OWNER TO oods;

--
-- Name: COLUMN ccdexposure_flexdata_schema.key; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_flexdata_schema.key IS 'Name of key.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.dtype; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_flexdata_schema.dtype IS 'Name of the data type of the value, one of bool, int, float, str.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.doc; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_flexdata_schema.doc IS 'Documentation string.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.unit; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_flexdata_schema.unit IS 'Unit for the value. Should be from the IVOA (https://www.ivoa.net/documents/VOUnits/) or astropy.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.ucd; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdexposure_flexdata_schema.ucd IS 'IVOA Unified Content Descriptor (https://www.ivoa.net/documents/UCD1+/).';


--
-- Name: ccdvisit1; Type: VIEW; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE VIEW cdb_lsstcomcam.ccdvisit1 AS
 SELECT ccdexposure.ccdexposure_id AS ccdvisit_id,
    ccdexposure.exposure_id,
    ccdexposure.detector,
    ccdexposure.s_region
   FROM cdb_lsstcomcam.ccdexposure;


ALTER TABLE cdb_lsstcomcam.ccdvisit1 OWNER TO oods;

--
-- Name: ccdvisit1_quicklook; Type: TABLE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE TABLE cdb_lsstcomcam.ccdvisit1_quicklook (
    ccdvisit_id bigint NOT NULL,
    s_ra double precision,
    s_dec double precision,
    zenith_distance double precision,
    photometric_calib double precision,
    psf_sigma double precision,
    sky_bg double precision,
    sky_noise double precision,
    zero_point double precision,
    seeing_zenith_500nm double precision,
    astrom_offset_mean double precision,
    astrom_offset_std double precision,
    eff_time double precision,
    eff_time_psf_sigma_scale double precision,
    eff_time_sky_bg_scale double precision,
    eff_time_zero_point_scale double precision,
    mean_var double precision,
    n_psf_star integer,
    psf_area double precision,
    psf_ixx double precision,
    psf_ixy double precision,
    psf_iyy double precision,
    psf_star_delta_e1_median double precision,
    psf_star_delta_e2_median double precision,
    psf_star_delta_e1_scatter double precision,
    psf_star_delta_e2_scatter double precision,
    psf_star_delta_size_median double precision,
    psf_star_delta_size_scatter double precision,
    psf_star_scaled_delta_size_scatter double precision,
    psf_trace_radius_delta double precision,
    max_dist_to_nearest_psf double precision,
    postisr_pixel_median double precision
);


ALTER TABLE cdb_lsstcomcam.ccdvisit1_quicklook OWNER TO oods;

--
-- Name: COLUMN ccdvisit1_quicklook.ccdvisit_id; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.ccdvisit_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdvisit1_quicklook.s_ra; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.s_ra IS 'Central Spatial Position in ICRS; Computed right ascension of CCD center.';


--
-- Name: COLUMN ccdvisit1_quicklook.s_dec; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.s_dec IS 'Central Spatial Position in ICRS; Computed declination of CCD center.';


--
-- Name: COLUMN ccdvisit1_quicklook.zenith_distance; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.zenith_distance IS 'Zenith distance at observation mid-point.';


--
-- Name: COLUMN ccdvisit1_quicklook.photometric_calib; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.photometric_calib IS 'Conversion from DN to nanojansky.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_sigma; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_sigma IS 'PSF model second-moments determinant radius (center of chip).';


--
-- Name: COLUMN ccdvisit1_quicklook.sky_bg; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.sky_bg IS 'Average sky background.';


--
-- Name: COLUMN ccdvisit1_quicklook.sky_noise; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.sky_noise IS 'RMS noise of the sky background.';


--
-- Name: COLUMN ccdvisit1_quicklook.zero_point; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.zero_point IS 'Photometric zero point.';


--
-- Name: COLUMN ccdvisit1_quicklook.seeing_zenith_500nm; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.seeing_zenith_500nm IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1.';


--
-- Name: COLUMN ccdvisit1_quicklook.astrom_offset_mean; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.astrom_offset_mean IS 'Mean offset of astrometric calibration matches.';


--
-- Name: COLUMN ccdvisit1_quicklook.astrom_offset_std; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.astrom_offset_std IS 'Standard deviation of offsets of astrometric calibration matches.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.eff_time IS 'Effective exposure time calculated from PSF sigma, sky background, and zero point.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time_psf_sigma_scale; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.eff_time_psf_sigma_scale IS 'Scale factor for effective exposure time based on PSF sigma.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time_sky_bg_scale; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.eff_time_sky_bg_scale IS 'Scale factor for effective exposure time based on sky background.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time_zero_point_scale; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.eff_time_zero_point_scale IS 'Scale factor for effective exposure time based on zero point.';


--
-- Name: COLUMN ccdvisit1_quicklook.mean_var; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.mean_var IS 'Mean of the variance plane.';


--
-- Name: COLUMN ccdvisit1_quicklook.n_psf_star; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.n_psf_star IS 'Number of stars used for PSF model.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_area; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_area IS 'PSF area.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_ixx; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_ixx IS 'PSF Ixx moment.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_ixy; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_ixy IS 'PSF Ixy moment.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_iyy; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_iyy IS 'PSF Iyy moment.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e1_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_star_delta_e1_median IS 'Median E1 residual (starE1 - psfE1) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e2_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_star_delta_e2_median IS 'Median E2 residual (starE2 - psfE2) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e1_scatter; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_star_delta_e1_scatter IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e2_scatter; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_star_delta_e2_scatter IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_size_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_star_delta_size_median IS 'Median size residual (starSize - psfSize) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_size_scatter; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_star_delta_size_scatter IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_scaled_delta_size_scatter; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_star_scaled_delta_size_scatter IS 'Scatter (via MAD) of size residual scaled by median size squared.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_trace_radius_delta; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.psf_trace_radius_delta IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels.';


--
-- Name: COLUMN ccdvisit1_quicklook.max_dist_to_nearest_psf; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.max_dist_to_nearest_psf IS 'Maximum distance of an unmasked pixel to its nearest model PSF star.';


--
-- Name: COLUMN ccdvisit1_quicklook.postisr_pixel_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.ccdvisit1_quicklook.postisr_pixel_median IS 'Median postISR pixel value.';


--
-- Name: exposure; Type: TABLE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE TABLE cdb_lsstcomcam.exposure (
    exposure_id bigint NOT NULL,
    exposure_name character varying(20) NOT NULL,
    controller character varying(1) NOT NULL,
    day_obs integer NOT NULL,
    seq_num integer NOT NULL,
    physical_filter character varying(32),
    band character varying(32),
    s_ra double precision,
    s_dec double precision,
    sky_rotation double precision,
    azimuth_start double precision,
    azimuth_end double precision,
    azimuth double precision,
    altitude_start double precision,
    altitude_end double precision,
    altitude double precision,
    zenith_distance_start double precision,
    zenith_distance_end double precision,
    zenith_distance double precision,
    airmass double precision,
    exp_midpt timestamp without time zone,
    exp_midpt_mjd double precision,
    obs_start timestamp without time zone,
    obs_start_mjd double precision,
    obs_end timestamp without time zone,
    obs_end_mjd double precision,
    exp_time double precision,
    shut_time double precision,
    dark_time double precision,
    group_id character varying(64),
    cur_index integer,
    max_index integer,
    img_type character varying(64),
    emulated boolean,
    science_program character varying(64),
    observation_reason character varying(68),
    target_name character varying(64),
    air_temp double precision,
    pressure double precision,
    humidity double precision,
    wind_speed double precision,
    wind_dir double precision,
    dimm_seeing double precision,
    focus_z double precision,
    simulated boolean,
    s_region character varying(1024),
    vignette character varying(10),
    vignette_min character varying(10)
);


ALTER TABLE cdb_lsstcomcam.exposure OWNER TO oods;

--
-- Name: COLUMN exposure.exposure_id; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.exposure_id IS 'Unique identifier.';


--
-- Name: COLUMN exposure.exposure_name; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.exposure_name IS 'Official name of the exposure.';


--
-- Name: COLUMN exposure.controller; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.controller IS 'The abbreviation of the controller used for the observation (O, C).';


--
-- Name: COLUMN exposure.day_obs; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.day_obs IS 'Day of observation.';


--
-- Name: COLUMN exposure.seq_num; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.seq_num IS 'Sequence number.';


--
-- Name: COLUMN exposure.physical_filter; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.physical_filter IS 'ID of physical filter, the filter associated with a particular instrument.';


--
-- Name: COLUMN exposure.band; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.band IS 'Name of the band used to take the exposure.  Abstract filter that is not associated with a particular instrument.';


--
-- Name: COLUMN exposure.s_ra; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.s_ra IS 'Central Spatial Position in ICRS; Right ascension of targeted focal plane center.';


--
-- Name: COLUMN exposure.s_dec; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.s_dec IS 'Central Spatial Position in ICRS; Declination of targeted focal plane center.';


--
-- Name: COLUMN exposure.sky_rotation; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.sky_rotation IS 'Targeted sky rotation angle.';


--
-- Name: COLUMN exposure.azimuth_start; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.azimuth_start IS 'Azimuth of focal plane center at the start of the exposure.';


--
-- Name: COLUMN exposure.azimuth_end; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.azimuth_end IS 'Azimuth of focal plane center at the end of the exposure.';


--
-- Name: COLUMN exposure.azimuth; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.azimuth IS 'Azimuth of focal plane center at the middle of the exposure.';


--
-- Name: COLUMN exposure.altitude_start; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.altitude_start IS 'Altitude of focal plane center at the start of the exposure.';


--
-- Name: COLUMN exposure.altitude_end; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.altitude_end IS 'Altitude of focal plane center at the end of the exposure.';


--
-- Name: COLUMN exposure.altitude; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.altitude IS 'Altitude of focal plane center at the middle of the exposure.';


--
-- Name: COLUMN exposure.zenith_distance_start; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.zenith_distance_start IS 'Zenith distance at the start of the exposure.';


--
-- Name: COLUMN exposure.zenith_distance_end; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.zenith_distance_end IS 'Zenith distance at the end of the exposure.';


--
-- Name: COLUMN exposure.zenith_distance; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.zenith_distance IS 'Zenith distance at the middle of the exposure.';


--
-- Name: COLUMN exposure.airmass; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.airmass IS 'Airmass of the observed line of sight at the middle of the exposure.';


--
-- Name: COLUMN exposure.exp_midpt; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.exp_midpt IS 'Midpoint time for exposure at the fiducial center of the focal plane. array. TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.exp_midpt_mjd; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.exp_midpt_mjd IS 'Midpoint time for exposure at the fiducial center of the focal plane. array in MJD. TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_start; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.obs_start IS 'Start time of the exposure at the fiducial center of the focal plane. array, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_start_mjd; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.obs_start_mjd IS 'Start of the exposure in MJD, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_end; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.obs_end IS 'End time of the exposure at the fiducial center of the focal plane. array, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_end_mjd; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.obs_end_mjd IS 'End of the exposure in MJD, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.exp_time; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.exp_time IS 'Spatially-averaged duration of exposure, accurate to 10ms.';


--
-- Name: COLUMN exposure.shut_time; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.shut_time IS 'Spatially-averaged shutter-open duration, accurate to 10ms.';


--
-- Name: COLUMN exposure.dark_time; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.dark_time IS 'Duration from last clear to readout, accurate to 10ms.';


--
-- Name: COLUMN exposure.group_id; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.group_id IS 'Identifier for the group that this exposure is part of.';


--
-- Name: COLUMN exposure.cur_index; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.cur_index IS 'Number (1-based) of the observation within its group.';


--
-- Name: COLUMN exposure.max_index; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.max_index IS 'Expected number of observations within the group.';


--
-- Name: COLUMN exposure.img_type; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.img_type IS 'Type of exposure taken.';


--
-- Name: COLUMN exposure.emulated; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.emulated IS 'True if the exposure was taken in emulation mode.';


--
-- Name: COLUMN exposure.science_program; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.science_program IS 'Science program.';


--
-- Name: COLUMN exposure.observation_reason; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.observation_reason IS 'Reason for the observation.';


--
-- Name: COLUMN exposure.target_name; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.target_name IS 'Target of the observation.';


--
-- Name: COLUMN exposure.air_temp; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.air_temp IS 'Outside air temperature in degC.';


--
-- Name: COLUMN exposure.pressure; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.pressure IS 'Outside air pressure.';


--
-- Name: COLUMN exposure.humidity; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.humidity IS 'Outside relative humidity.';


--
-- Name: COLUMN exposure.wind_speed; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.wind_speed IS 'Outside wind speed.';


--
-- Name: COLUMN exposure.wind_dir; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.wind_dir IS 'Wind direction.';


--
-- Name: COLUMN exposure.dimm_seeing; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.dimm_seeing IS 'Seeing as measured by external DIMM (FWHM).';


--
-- Name: COLUMN exposure.focus_z; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.focus_z IS 'Focus Z position.';


--
-- Name: COLUMN exposure.simulated; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.simulated IS 'Were any control system components simulated?';


--
-- Name: COLUMN exposure.s_region; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.s_region IS 'Sky region in STC-S format (https://www.ivoa.net/documents/STC-S/20130917/index.html).';


--
-- Name: COLUMN exposure.vignette; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.vignette IS 'Instrument blocked from the sky: UNKNOWN, NO, PARTIALLY, FULLY.';


--
-- Name: COLUMN exposure.vignette_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure.vignette_min IS 'Lowest amount of instrument vignetting detected during the exposure: UNKNOWN, NO, PARTIALLY, FULLY.';


--
-- Name: exposure_exposure_id_seq; Type: SEQUENCE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE SEQUENCE cdb_lsstcomcam.exposure_exposure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cdb_lsstcomcam.exposure_exposure_id_seq OWNER TO oods;

--
-- Name: exposure_exposure_id_seq; Type: SEQUENCE OWNED BY; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER SEQUENCE cdb_lsstcomcam.exposure_exposure_id_seq OWNED BY cdb_lsstcomcam.exposure.exposure_id;


--
-- Name: exposure_flexdata; Type: TABLE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE TABLE cdb_lsstcomcam.exposure_flexdata (
    obs_id bigint NOT NULL,
    key character varying(128) NOT NULL,
    value text,
    day_obs integer NOT NULL,
    seq_num integer NOT NULL
);


ALTER TABLE cdb_lsstcomcam.exposure_flexdata OWNER TO oods;

--
-- Name: COLUMN exposure_flexdata.obs_id; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata.obs_id IS 'Unique identifier.';


--
-- Name: COLUMN exposure_flexdata.key; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata.key IS 'Name of key.';


--
-- Name: COLUMN exposure_flexdata.value; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata.value IS 'Content of value as a string.';


--
-- Name: COLUMN exposure_flexdata.day_obs; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata.day_obs IS 'Day of observation.';


--
-- Name: COLUMN exposure_flexdata.seq_num; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata.seq_num IS 'Sequence number.';


--
-- Name: exposure_flexdata_schema; Type: TABLE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE TABLE cdb_lsstcomcam.exposure_flexdata_schema (
    key character varying(128) NOT NULL,
    dtype character varying(64) NOT NULL,
    doc text NOT NULL,
    unit character varying(128),
    ucd character varying(128)
);


ALTER TABLE cdb_lsstcomcam.exposure_flexdata_schema OWNER TO oods;

--
-- Name: COLUMN exposure_flexdata_schema.key; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata_schema.key IS 'Name of key.';


--
-- Name: COLUMN exposure_flexdata_schema.dtype; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata_schema.dtype IS 'Name of the data type of the value, one of bool, int, float, str.';


--
-- Name: COLUMN exposure_flexdata_schema.doc; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata_schema.doc IS 'Documentation string.';


--
-- Name: COLUMN exposure_flexdata_schema.unit; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata_schema.unit IS 'Unit for the value. Should be from the IVOA (https://www.ivoa.net/documents/VOUnits/) or astropy.';


--
-- Name: COLUMN exposure_flexdata_schema.ucd; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.exposure_flexdata_schema.ucd IS 'IVOA Unified Content Descriptor (https://www.ivoa.net/documents/UCD1+/).';


--
-- Name: visit1; Type: VIEW; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE VIEW cdb_lsstcomcam.visit1 AS
 SELECT exposure.exposure_id AS visit_id,
    exposure.exposure_name,
    exposure.controller,
    exposure.day_obs,
    exposure.seq_num,
    exposure.physical_filter,
    exposure.band,
    exposure.s_ra,
    exposure.s_dec,
    exposure.sky_rotation,
    exposure.azimuth_start,
    exposure.azimuth_end,
    exposure.azimuth,
    exposure.altitude_start,
    exposure.altitude_end,
    exposure.altitude,
    exposure.zenith_distance_start,
    exposure.zenith_distance_end,
    exposure.zenith_distance,
    exposure.airmass,
    exposure.exp_midpt,
    exposure.exp_midpt_mjd,
    exposure.obs_start,
    exposure.obs_start_mjd,
    exposure.obs_end,
    exposure.obs_end_mjd,
    exposure.exp_time,
    exposure.shut_time,
    exposure.dark_time,
    exposure.group_id,
    exposure.cur_index,
    exposure.max_index,
    exposure.img_type,
    exposure.emulated,
    exposure.science_program,
    exposure.observation_reason,
    exposure.target_name,
    exposure.air_temp,
    exposure.pressure,
    exposure.humidity,
    exposure.wind_speed,
    exposure.wind_dir,
    exposure.dimm_seeing,
    exposure.focus_z,
    exposure.simulated,
    exposure.s_region
   FROM cdb_lsstcomcam.exposure;


ALTER TABLE cdb_lsstcomcam.visit1 OWNER TO oods;

--
-- Name: visit1_quicklook; Type: TABLE; Schema: cdb_lsstcomcam; Owner: oods
--

CREATE TABLE cdb_lsstcomcam.visit1_quicklook (
    visit_id bigint NOT NULL,
    n_inputs integer,
    astrom_offset_mean_min double precision,
    astrom_offset_mean_max double precision,
    astrom_offset_mean_median double precision,
    astrom_offset_std_min double precision,
    astrom_offset_std_max double precision,
    astrom_offset_std_median double precision,
    eff_time_min double precision,
    eff_time_max double precision,
    eff_time_median double precision,
    eff_time_psf_sigma_scale_min double precision,
    eff_time_psf_sigma_scale_max double precision,
    eff_time_psf_sigma_scale_median double precision,
    eff_time_sky_bg_scale_min double precision,
    eff_time_sky_bg_scale_max double precision,
    eff_time_sky_bg_scale_median double precision,
    eff_time_zero_point_scale_min double precision,
    eff_time_zero_point_scale_max double precision,
    eff_time_zero_point_scale_median double precision,
    max_dist_to_nearest_psf_min double precision,
    max_dist_to_nearest_psf_max double precision,
    max_dist_to_nearest_psf_median double precision,
    mean_var_min double precision,
    mean_var_max double precision,
    mean_var_median double precision,
    n_psf_star_min integer,
    n_psf_star_max integer,
    n_psf_star_median integer,
    n_psf_star_total integer,
    psf_area_min double precision,
    psf_area_max double precision,
    psf_area_median double precision,
    psf_ixx_min double precision,
    psf_ixx_max double precision,
    psf_ixx_median double precision,
    psf_ixy_min double precision,
    psf_ixy_max double precision,
    psf_ixy_median double precision,
    psf_iyy_min double precision,
    psf_iyy_max double precision,
    psf_iyy_median double precision,
    psf_sigma_min double precision,
    psf_sigma_max double precision,
    psf_sigma_median double precision,
    psf_star_delta_e1_median_min double precision,
    psf_star_delta_e1_median_max double precision,
    psf_star_delta_e1_median_median double precision,
    psf_star_delta_e1_scatter_min double precision,
    psf_star_delta_e1_scatter_max double precision,
    psf_star_delta_e1_scatter_median double precision,
    psf_star_delta_e2_median_min double precision,
    psf_star_delta_e2_median_max double precision,
    psf_star_delta_e2_median_median double precision,
    psf_star_delta_e2_scatter_min double precision,
    psf_star_delta_e2_scatter_max double precision,
    psf_star_delta_e2_scatter_median double precision,
    psf_star_delta_size_median_min double precision,
    psf_star_delta_size_median_max double precision,
    psf_star_delta_size_median_median double precision,
    psf_star_delta_size_scatter_min double precision,
    psf_star_delta_size_scatter_max double precision,
    psf_star_delta_size_scatter_median double precision,
    psf_star_scaled_delta_size_scatter_min double precision,
    psf_star_scaled_delta_size_scatter_max double precision,
    psf_star_scaled_delta_size_scatter_median double precision,
    psf_trace_radius_delta_min double precision,
    psf_trace_radius_delta_max double precision,
    psf_trace_radius_delta_median double precision,
    sky_bg_min double precision,
    sky_bg_max double precision,
    sky_bg_median double precision,
    sky_noise_min double precision,
    sky_noise_max double precision,
    sky_noise_median double precision,
    seeing_zenith_500nm_min double precision,
    seeing_zenith_500nm_max double precision,
    seeing_zenith_500nm_median double precision,
    zero_point_min double precision,
    zero_point_max double precision,
    zero_point_median double precision,
    low_snr_source_count_min integer,
    low_snr_source_count_max integer,
    low_snr_source_count_median integer,
    low_snr_source_count_total integer,
    high_snr_source_count_min integer,
    high_snr_source_count_max integer,
    high_snr_source_count_median integer,
    high_snr_source_count_total integer,
    day_obs integer NOT NULL,
    seq_num integer NOT NULL,
    postisr_pixel_median_median double precision,
    postisr_pixel_median_mean double precision,
    postisr_pixel_median_max double precision
);


ALTER TABLE cdb_lsstcomcam.visit1_quicklook OWNER TO oods;

--
-- Name: COLUMN visit1_quicklook.visit_id; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.visit_id IS 'Unique identifier.';


--
-- Name: COLUMN visit1_quicklook.n_inputs; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.n_inputs IS 'Number of CCDs used to compute the visit aggregates.';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_mean_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.astrom_offset_mean_min IS 'Mean offset of astrometric calibration matches (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_mean_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.astrom_offset_mean_max IS 'Mean offset of astrometric calibration matches (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_mean_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.astrom_offset_mean_median IS 'Mean offset of astrometric calibration matches (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_std_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.astrom_offset_std_min IS 'Standard deviation of offsets of astrometric calibration matches (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_std_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.astrom_offset_std_max IS 'Standard deviation of offsets of astrometric calibration matches (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_std_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.astrom_offset_std_median IS 'Standard deviation of offsets of astrometric calibration matches (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_min IS 'Effective exposure time (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_max IS 'Effective exposure time (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_median IS 'Effective exposure time (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_psf_sigma_scale_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_psf_sigma_scale_min IS 'Scale factor for effective exposure time based on PSF sigma (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_psf_sigma_scale_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_psf_sigma_scale_max IS 'Scale factor for effective exposure time based on PSF sigma (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_psf_sigma_scale_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_psf_sigma_scale_median IS 'Scale factor for effective exposure time based on PSF sigma (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_sky_bg_scale_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_sky_bg_scale_min IS 'Scale factor for effective exposure time based on sky background (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_sky_bg_scale_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_sky_bg_scale_max IS 'Scale factor for effective exposure time based on sky background (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_sky_bg_scale_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_sky_bg_scale_median IS 'Scale factor for effective exposure time based on sky background (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_zero_point_scale_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_zero_point_scale_min IS 'Scale factor for effective exposure time based on zero point (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_zero_point_scale_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_zero_point_scale_max IS 'Scale factor for effective exposure time based on zero point (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_zero_point_scale_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.eff_time_zero_point_scale_median IS 'Scale factor for effective exposure time based on zero point (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.max_dist_to_nearest_psf_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.max_dist_to_nearest_psf_min IS 'Maximum distance of an unmasked pixel to its nearest model PSF star (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.max_dist_to_nearest_psf_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.max_dist_to_nearest_psf_max IS 'Maximum distance of an unmasked pixel to its nearest model PSF star (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.max_dist_to_nearest_psf_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.max_dist_to_nearest_psf_median IS 'Maximum distance of an unmasked pixel to its nearest model PSF star (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.mean_var_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.mean_var_min IS 'Mean of the variance plane (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.mean_var_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.mean_var_max IS 'Mean of the variance plane (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.mean_var_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.mean_var_median IS 'Mean of the variance plane (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.n_psf_star_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.n_psf_star_min IS 'Number of stars used for PSF model (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.n_psf_star_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.n_psf_star_max IS 'Number of stars used for PSF model (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.n_psf_star_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.n_psf_star_median IS 'Number of stars used for PSF model (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.n_psf_star_total; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.n_psf_star_total IS 'Number of stars used for PSF model (total across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_area_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_area_min IS 'PSF area (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_area_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_area_max IS 'PSF area (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_area_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_area_median IS 'PSF area (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixx_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_ixx_min IS 'PSF Ixx moment (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixx_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_ixx_max IS 'PSF Ixx moment (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixx_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_ixx_median IS 'PSF Ixx moment (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixy_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_ixy_min IS 'PSF Ixy moment (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixy_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_ixy_max IS 'PSF Ixy moment (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixy_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_ixy_median IS 'PSF Ixy moment (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_iyy_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_iyy_min IS 'PSF Iyy moment (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_iyy_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_iyy_max IS 'PSF Iyy moment (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_iyy_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_iyy_median IS 'PSF Iyy moment (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_sigma_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_sigma_min IS 'PSF sigma (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_sigma_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_sigma_max IS 'PSF sigma (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_sigma_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_sigma_median IS 'PSF sigma (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_median_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e1_median_min IS 'Median E1 residual (starE1 - psfE1) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_median_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e1_median_max IS 'Median E1 residual (starE1 - psfE1) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_median_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e1_median_median IS 'Median E1 residual (starE1 - psfE1) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_scatter_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e1_scatter_min IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_scatter_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e1_scatter_max IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_scatter_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e1_scatter_median IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_median_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e2_median_min IS 'Median E2 residual (starE2 - psfE2) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_median_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e2_median_max IS 'Median E2 residual (starE2 - psfE2) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_median_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e2_median_median IS 'Median E2 residual (starE2 - psfE2) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_scatter_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e2_scatter_min IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_scatter_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e2_scatter_max IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_scatter_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_e2_scatter_median IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_median_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_size_median_min IS 'Median size residual (starSize - psfSize) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_median_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_size_median_max IS 'Median size residual (starSize - psfSize) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_median_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_size_median_median IS 'Median size residual (starSize - psfSize) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_scatter_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_size_scatter_min IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_scatter_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_size_scatter_max IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_scatter_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_delta_size_scatter_median IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_scaled_delta_size_scatter_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_scaled_delta_size_scatter_min IS 'Scatter (via MAD) of size residual scaled by median size squared (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_scaled_delta_size_scatter_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_scaled_delta_size_scatter_max IS 'Scatter (via MAD) of size residual scaled by median size squared (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_scaled_delta_size_scatter_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_star_scaled_delta_size_scatter_median IS 'Scatter (via MAD) of size residual scaled by median size squared (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_trace_radius_delta_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_trace_radius_delta_min IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_trace_radius_delta_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_trace_radius_delta_max IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_trace_radius_delta_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.psf_trace_radius_delta_median IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_bg_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.sky_bg_min IS 'Average sky background (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_bg_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.sky_bg_max IS 'Average sky background (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_bg_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.sky_bg_median IS 'Average sky background (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_noise_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.sky_noise_min IS 'RMS noise of the sky background (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_noise_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.sky_noise_max IS 'RMS noise of the sky background (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_noise_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.sky_noise_median IS 'RMS noise of the sky background (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.seeing_zenith_500nm_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.seeing_zenith_500nm_min IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1 (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.seeing_zenith_500nm_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.seeing_zenith_500nm_max IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1 (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.seeing_zenith_500nm_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.seeing_zenith_500nm_median IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1 (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.zero_point_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.zero_point_min IS 'Photometric zero point (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.zero_point_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.zero_point_max IS 'Photometric zero point (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.zero_point_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.zero_point_median IS 'Photometric zero point (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.low_snr_source_count_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.low_snr_source_count_min IS 'Count of low signal-to-noise-ratio sources (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.low_snr_source_count_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.low_snr_source_count_max IS 'Count of low signal-to-noise-ratio sources (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.low_snr_source_count_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.low_snr_source_count_median IS 'Count of low signal-to-noise-ratio sources (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.low_snr_source_count_total; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.low_snr_source_count_total IS 'Count of low signal-to-noise-ratio sources (total across all detectors).';


--
-- Name: COLUMN visit1_quicklook.high_snr_source_count_min; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.high_snr_source_count_min IS 'Count of high signal-to-noise-ratio sources (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.high_snr_source_count_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.high_snr_source_count_max IS 'Count of high signal-to-noise-ratio sources (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.high_snr_source_count_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.high_snr_source_count_median IS 'Count of high signal-to-noise-ratio sources (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.high_snr_source_count_total; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.high_snr_source_count_total IS 'Count of high signal-to-noise-ratio sources (total across all detectors).';


--
-- Name: COLUMN visit1_quicklook.day_obs; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.day_obs IS 'Day of observation.';


--
-- Name: COLUMN visit1_quicklook.seq_num; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.seq_num IS 'Sequence number.';


--
-- Name: COLUMN visit1_quicklook.postisr_pixel_median_median; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.postisr_pixel_median_median IS 'Median postISR pixel value (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.postisr_pixel_median_mean; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.postisr_pixel_median_mean IS 'Median postISR pixel value (mean across all detectors).';


--
-- Name: COLUMN visit1_quicklook.postisr_pixel_median_max; Type: COMMENT; Schema: cdb_lsstcomcam; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcam.visit1_quicklook.postisr_pixel_median_max IS 'Median postISR pixel value (max across all detectors).';


--
-- Name: ccdexposure; Type: TABLE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE TABLE cdb_lsstcomcamsim.ccdexposure (
    ccdexposure_id bigint NOT NULL,
    exposure_id bigint NOT NULL,
    detector integer NOT NULL,
    s_region character varying(1024),
    day_obs integer NOT NULL,
    seq_num integer NOT NULL
);


ALTER TABLE cdb_lsstcomcamsim.ccdexposure OWNER TO oods;

--
-- Name: COLUMN ccdexposure.ccdexposure_id; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure.ccdexposure_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdexposure.exposure_id; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure.exposure_id IS 'Identifier of the exposure.';


--
-- Name: COLUMN ccdexposure.detector; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure.detector IS 'Number of the detector in the focal plane.';


--
-- Name: COLUMN ccdexposure.s_region; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure.s_region IS 'Sky region in STC-S format (https://www.ivoa.net/documents/STC-S/20130917/index.html).';


--
-- Name: COLUMN ccdexposure.day_obs; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure.day_obs IS 'Day of observation.';


--
-- Name: COLUMN ccdexposure.seq_num; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure.seq_num IS 'Sequence number.';


--
-- Name: ccdexposure_camera; Type: TABLE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE TABLE cdb_lsstcomcamsim.ccdexposure_camera (
    ccdexposure_id bigint NOT NULL,
    temp_set double precision,
    ccd_temp double precision
);


ALTER TABLE cdb_lsstcomcamsim.ccdexposure_camera OWNER TO oods;

--
-- Name: COLUMN ccdexposure_camera.ccdexposure_id; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_camera.ccdexposure_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdexposure_camera.temp_set; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_camera.temp_set IS 'Temperature setpoint of CCD in degC.';


--
-- Name: COLUMN ccdexposure_camera.ccd_temp; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_camera.ccd_temp IS 'Temperature of CCD in degC.';


--
-- Name: ccdexposure_ccdexposure_id_seq; Type: SEQUENCE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE SEQUENCE cdb_lsstcomcamsim.ccdexposure_ccdexposure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cdb_lsstcomcamsim.ccdexposure_ccdexposure_id_seq OWNER TO oods;

--
-- Name: ccdexposure_ccdexposure_id_seq; Type: SEQUENCE OWNED BY; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER SEQUENCE cdb_lsstcomcamsim.ccdexposure_ccdexposure_id_seq OWNED BY cdb_lsstcomcamsim.ccdexposure.ccdexposure_id;


--
-- Name: ccdexposure_flexdata; Type: TABLE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE TABLE cdb_lsstcomcamsim.ccdexposure_flexdata (
    obs_id bigint NOT NULL,
    key character varying(128) NOT NULL,
    value text
);


ALTER TABLE cdb_lsstcomcamsim.ccdexposure_flexdata OWNER TO oods;

--
-- Name: COLUMN ccdexposure_flexdata.obs_id; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_flexdata.obs_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdexposure_flexdata.key; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_flexdata.key IS 'Name of key.';


--
-- Name: COLUMN ccdexposure_flexdata.value; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_flexdata.value IS 'Content of value as a string.';


--
-- Name: ccdexposure_flexdata_schema; Type: TABLE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE TABLE cdb_lsstcomcamsim.ccdexposure_flexdata_schema (
    key character varying(128) NOT NULL,
    dtype character varying(64) NOT NULL,
    doc text NOT NULL,
    unit character varying(128),
    ucd character varying(128)
);


ALTER TABLE cdb_lsstcomcamsim.ccdexposure_flexdata_schema OWNER TO oods;

--
-- Name: COLUMN ccdexposure_flexdata_schema.key; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_flexdata_schema.key IS 'Name of key.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.dtype; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_flexdata_schema.dtype IS 'Name of the data type of the value, one of bool, int, float, str.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.doc; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_flexdata_schema.doc IS 'Documentation string.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.unit; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_flexdata_schema.unit IS 'Unit for the value. Should be from the IVOA (https://www.ivoa.net/documents/VOUnits/) or astropy.';


--
-- Name: COLUMN ccdexposure_flexdata_schema.ucd; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdexposure_flexdata_schema.ucd IS 'IVOA Unified Content Descriptor (https://www.ivoa.net/documents/UCD1+/).';


--
-- Name: ccdvisit1; Type: VIEW; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE VIEW cdb_lsstcomcamsim.ccdvisit1 AS
 SELECT ccdexposure.ccdexposure_id AS ccdvisit_id,
    ccdexposure.exposure_id,
    ccdexposure.detector,
    ccdexposure.s_region
   FROM cdb_lsstcomcamsim.ccdexposure;


ALTER TABLE cdb_lsstcomcamsim.ccdvisit1 OWNER TO oods;

--
-- Name: ccdvisit1_quicklook; Type: TABLE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE TABLE cdb_lsstcomcamsim.ccdvisit1_quicklook (
    ccdvisit_id bigint NOT NULL,
    s_ra double precision,
    s_dec double precision,
    zenith_distance double precision,
    photometric_calib double precision,
    psf_sigma double precision,
    sky_bg double precision,
    sky_noise double precision,
    astrom_offset_mean double precision,
    astrom_offset_std double precision,
    n_psf_star integer,
    psf_star_delta_e1_median double precision,
    psf_star_delta_e2_median double precision,
    psf_star_delta_e1_scatter double precision,
    psf_star_delta_e2_scatter double precision,
    psf_star_delta_size_median double precision,
    psf_star_delta_size_scatter double precision,
    psf_star_scaled_delta_size_scatter double precision,
    psf_trace_radius_delta double precision,
    max_dist_to_nearest_psf double precision,
    zero_point double precision,
    seeing_zenith_500nm double precision,
    mean_var double precision,
    eff_time double precision,
    eff_time_psf_sigma_scale double precision,
    eff_time_sky_bg_scale double precision,
    eff_time_zero_point_scale double precision,
    psf_area double precision,
    psf_ixx double precision,
    psf_ixy double precision,
    psf_iyy double precision,
    postisr_pixel_median double precision
);


ALTER TABLE cdb_lsstcomcamsim.ccdvisit1_quicklook OWNER TO oods;

--
-- Name: COLUMN ccdvisit1_quicklook.ccdvisit_id; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.ccdvisit_id IS 'Unique identifier.';


--
-- Name: COLUMN ccdvisit1_quicklook.s_ra; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.s_ra IS 'Central Spatial Position in ICRS; Computed right ascension of CCD center.';


--
-- Name: COLUMN ccdvisit1_quicklook.s_dec; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.s_dec IS 'Central Spatial Position in ICRS; Computed declination of CCD center.';


--
-- Name: COLUMN ccdvisit1_quicklook.zenith_distance; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.zenith_distance IS 'Zenith distance at observation mid-point.';


--
-- Name: COLUMN ccdvisit1_quicklook.photometric_calib; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.photometric_calib IS 'Conversion from DN to nanojansky.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_sigma; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_sigma IS 'PSF model second-moments determinant radius (center of chip).';


--
-- Name: COLUMN ccdvisit1_quicklook.sky_bg; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.sky_bg IS 'Average sky background.';


--
-- Name: COLUMN ccdvisit1_quicklook.sky_noise; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.sky_noise IS 'RMS noise of the sky background.';


--
-- Name: COLUMN ccdvisit1_quicklook.astrom_offset_mean; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.astrom_offset_mean IS 'Mean offset of astrometric calibration matches.';


--
-- Name: COLUMN ccdvisit1_quicklook.astrom_offset_std; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.astrom_offset_std IS 'Standard deviation of offsets of astrometric calibration matches.';


--
-- Name: COLUMN ccdvisit1_quicklook.n_psf_star; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.n_psf_star IS 'Number of stars used for PSF model.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e1_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_star_delta_e1_median IS 'Median E1 residual (starE1 - psfE1) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e2_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_star_delta_e2_median IS 'Median E2 residual (starE2 - psfE2) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e1_scatter; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_star_delta_e1_scatter IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_e2_scatter; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_star_delta_e2_scatter IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_size_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_star_delta_size_median IS 'Median size residual (starSize - psfSize) for PSF stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_delta_size_scatter; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_star_delta_size_scatter IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_star_scaled_delta_size_scatter; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_star_scaled_delta_size_scatter IS 'Scatter (via MAD) of size residual scaled by median size squared.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_trace_radius_delta; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_trace_radius_delta IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels.';


--
-- Name: COLUMN ccdvisit1_quicklook.max_dist_to_nearest_psf; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.max_dist_to_nearest_psf IS 'Maximum distance of an unmasked pixel to its nearest model PSF star.';


--
-- Name: COLUMN ccdvisit1_quicklook.zero_point; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.zero_point IS 'Photometric zero point.';


--
-- Name: COLUMN ccdvisit1_quicklook.seeing_zenith_500nm; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.seeing_zenith_500nm IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1.';


--
-- Name: COLUMN ccdvisit1_quicklook.mean_var; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.mean_var IS 'Mean of the variance plane.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.eff_time IS 'Effective exposure time calculated from PSF sigma, sky background, and zero point.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time_psf_sigma_scale; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.eff_time_psf_sigma_scale IS 'Scale factor for effective exposure time based on PSF sigma.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time_sky_bg_scale; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.eff_time_sky_bg_scale IS 'Scale factor for effective exposure time based on sky background.';


--
-- Name: COLUMN ccdvisit1_quicklook.eff_time_zero_point_scale; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.eff_time_zero_point_scale IS 'Scale factor for effective exposure time based on zero point.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_area; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_area IS 'PSF area.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_ixx; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_ixx IS 'PSF Ixx moment.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_ixy; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_ixy IS 'PSF Ixy moment.';


--
-- Name: COLUMN ccdvisit1_quicklook.psf_iyy; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.psf_iyy IS 'PSF Iyy moment.';


--
-- Name: COLUMN ccdvisit1_quicklook.postisr_pixel_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.ccdvisit1_quicklook.postisr_pixel_median IS 'Median postISR pixel value.';


--
-- Name: exposure; Type: TABLE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE TABLE cdb_lsstcomcamsim.exposure (
    exposure_id bigint NOT NULL,
    exposure_name character varying(20) NOT NULL,
    controller character varying(1) NOT NULL,
    day_obs integer NOT NULL,
    seq_num integer NOT NULL,
    physical_filter character varying(32),
    band character varying(32),
    s_ra double precision,
    s_dec double precision,
    sky_rotation double precision,
    azimuth_start double precision,
    azimuth_end double precision,
    azimuth double precision,
    altitude_start double precision,
    altitude_end double precision,
    altitude double precision,
    zenith_distance_start double precision,
    zenith_distance_end double precision,
    zenith_distance double precision,
    airmass double precision,
    exp_midpt timestamp without time zone,
    exp_midpt_mjd double precision,
    obs_start timestamp without time zone,
    obs_start_mjd double precision,
    obs_end timestamp without time zone,
    obs_end_mjd double precision,
    exp_time double precision,
    shut_time double precision,
    dark_time double precision,
    group_id character varying(64),
    cur_index integer,
    max_index integer,
    img_type character varying(64),
    emulated boolean,
    science_program character varying(64),
    observation_reason character varying(68),
    target_name character varying(64),
    air_temp double precision,
    pressure double precision,
    humidity double precision,
    wind_speed double precision,
    wind_dir double precision,
    dimm_seeing double precision,
    focus_z double precision,
    simulated boolean,
    s_region character varying(1024),
    vignette character varying(10),
    vignette_min character varying(10)
);


ALTER TABLE cdb_lsstcomcamsim.exposure OWNER TO oods;

--
-- Name: COLUMN exposure.exposure_id; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.exposure_id IS 'Unique identifier.';


--
-- Name: COLUMN exposure.exposure_name; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.exposure_name IS 'Official name of the exposure.';


--
-- Name: COLUMN exposure.controller; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.controller IS 'The abbreviation of the controller used for the observation (O, C).';


--
-- Name: COLUMN exposure.day_obs; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.day_obs IS 'Day of observation.';


--
-- Name: COLUMN exposure.seq_num; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.seq_num IS 'Sequence number.';


--
-- Name: COLUMN exposure.physical_filter; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.physical_filter IS 'ID of physical filter, the filter associated with a particular instrument.';


--
-- Name: COLUMN exposure.band; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.band IS 'Name of the band used to take the exposure.  Abstract filter that is not associated with a particular instrument.';


--
-- Name: COLUMN exposure.s_ra; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.s_ra IS 'Central Spatial Position in ICRS; Right ascension of targeted focal plane center.';


--
-- Name: COLUMN exposure.s_dec; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.s_dec IS 'Central Spatial Position in ICRS; Declination of targeted focal plane center.';


--
-- Name: COLUMN exposure.sky_rotation; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.sky_rotation IS 'Targeted sky rotation angle.';


--
-- Name: COLUMN exposure.azimuth_start; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.azimuth_start IS 'Azimuth of focal plane center at the start of the exposure.';


--
-- Name: COLUMN exposure.azimuth_end; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.azimuth_end IS 'Azimuth of focal plane center at the end of the exposure.';


--
-- Name: COLUMN exposure.azimuth; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.azimuth IS 'Azimuth of focal plane center at the middle of the exposure.';


--
-- Name: COLUMN exposure.altitude_start; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.altitude_start IS 'Altitude of focal plane center at the start of the exposure.';


--
-- Name: COLUMN exposure.altitude_end; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.altitude_end IS 'Altitude of focal plane center at the end of the exposure.';


--
-- Name: COLUMN exposure.altitude; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.altitude IS 'Altitude of focal plane center at the middle of the exposure.';


--
-- Name: COLUMN exposure.zenith_distance_start; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.zenith_distance_start IS 'Zenith distance at the start of the exposure.';


--
-- Name: COLUMN exposure.zenith_distance_end; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.zenith_distance_end IS 'Zenith distance at the end of the exposure.';


--
-- Name: COLUMN exposure.zenith_distance; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.zenith_distance IS 'Zenith distance at the middle of the exposure.';


--
-- Name: COLUMN exposure.airmass; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.airmass IS 'Airmass of the observed line of sight at the middle of the exposure.';


--
-- Name: COLUMN exposure.exp_midpt; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.exp_midpt IS 'Midpoint time for exposure at the fiducial center of the focal plane. array. TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.exp_midpt_mjd; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.exp_midpt_mjd IS 'Midpoint time for exposure at the fiducial center of the focal plane. array in MJD. TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_start; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.obs_start IS 'Start time of the exposure at the fiducial center of the focal plane. array, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_start_mjd; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.obs_start_mjd IS 'Start of the exposure in MJD, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_end; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.obs_end IS 'End time of the exposure at the fiducial center of the focal plane. array, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.obs_end_mjd; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.obs_end_mjd IS 'End of the exposure in MJD, TAI, accurate to 10ms.';


--
-- Name: COLUMN exposure.exp_time; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.exp_time IS 'Spatially-averaged duration of exposure, accurate to 10ms.';


--
-- Name: COLUMN exposure.shut_time; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.shut_time IS 'Spatially-averaged shutter-open duration, accurate to 10ms.';


--
-- Name: COLUMN exposure.dark_time; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.dark_time IS 'Duration from last clear to readout, accurate to 10ms.';


--
-- Name: COLUMN exposure.group_id; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.group_id IS 'Identifier for the group that this exposure is part of.';


--
-- Name: COLUMN exposure.cur_index; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.cur_index IS 'Number (1-based) of the observation within its group.';


--
-- Name: COLUMN exposure.max_index; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.max_index IS 'Expected number of observations within the group.';


--
-- Name: COLUMN exposure.img_type; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.img_type IS 'Type of exposure taken.';


--
-- Name: COLUMN exposure.emulated; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.emulated IS 'True if the exposure was taken in emulation mode.';


--
-- Name: COLUMN exposure.science_program; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.science_program IS 'Science program.';


--
-- Name: COLUMN exposure.observation_reason; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.observation_reason IS 'Reason for the observation.';


--
-- Name: COLUMN exposure.target_name; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.target_name IS 'Target of the observation.';


--
-- Name: COLUMN exposure.air_temp; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.air_temp IS 'Outside air temperature in degC.';


--
-- Name: COLUMN exposure.pressure; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.pressure IS 'Outside air pressure.';


--
-- Name: COLUMN exposure.humidity; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.humidity IS 'Outside relative humidity.';


--
-- Name: COLUMN exposure.wind_speed; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.wind_speed IS 'Outside wind speed.';


--
-- Name: COLUMN exposure.wind_dir; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.wind_dir IS 'Wind direction.';


--
-- Name: COLUMN exposure.dimm_seeing; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.dimm_seeing IS 'Seeing as measured by external DIMM (FWHM).';


--
-- Name: COLUMN exposure.focus_z; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.focus_z IS 'Focus Z position.';


--
-- Name: COLUMN exposure.simulated; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.simulated IS 'Were any control system components simulated?';


--
-- Name: COLUMN exposure.s_region; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.s_region IS 'Sky region in STC-S format (https://www.ivoa.net/documents/STC-S/20130917/index.html).';


--
-- Name: COLUMN exposure.vignette; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.vignette IS 'Instrument blocked from the sky: UNKNOWN, NO, PARTIALLY, FULLY.';


--
-- Name: COLUMN exposure.vignette_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure.vignette_min IS 'Lowest amount of instrument vignetting detected during the exposure: UNKNOWN, NO, PARTIALLY, FULLY.';


--
-- Name: exposure_exposure_id_seq; Type: SEQUENCE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE SEQUENCE cdb_lsstcomcamsim.exposure_exposure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cdb_lsstcomcamsim.exposure_exposure_id_seq OWNER TO oods;

--
-- Name: exposure_exposure_id_seq; Type: SEQUENCE OWNED BY; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER SEQUENCE cdb_lsstcomcamsim.exposure_exposure_id_seq OWNED BY cdb_lsstcomcamsim.exposure.exposure_id;


--
-- Name: exposure_flexdata; Type: TABLE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE TABLE cdb_lsstcomcamsim.exposure_flexdata (
    obs_id bigint NOT NULL,
    key character varying(128) NOT NULL,
    value text,
    day_obs integer NOT NULL,
    seq_num integer NOT NULL
);


ALTER TABLE cdb_lsstcomcamsim.exposure_flexdata OWNER TO oods;

--
-- Name: COLUMN exposure_flexdata.obs_id; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata.obs_id IS 'Unique identifier.';


--
-- Name: COLUMN exposure_flexdata.key; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata.key IS 'Name of key.';


--
-- Name: COLUMN exposure_flexdata.value; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata.value IS 'Content of value as a string.';


--
-- Name: COLUMN exposure_flexdata.day_obs; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata.day_obs IS 'Day of observation.';


--
-- Name: COLUMN exposure_flexdata.seq_num; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata.seq_num IS 'Sequence number.';


--
-- Name: exposure_flexdata_schema; Type: TABLE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE TABLE cdb_lsstcomcamsim.exposure_flexdata_schema (
    key character varying(128) NOT NULL,
    dtype character varying(64) NOT NULL,
    doc text NOT NULL,
    unit character varying(128),
    ucd character varying(128)
);


ALTER TABLE cdb_lsstcomcamsim.exposure_flexdata_schema OWNER TO oods;

--
-- Name: COLUMN exposure_flexdata_schema.key; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata_schema.key IS 'Name of key.';


--
-- Name: COLUMN exposure_flexdata_schema.dtype; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata_schema.dtype IS 'Name of the data type of the value, one of bool, int, float, str.';


--
-- Name: COLUMN exposure_flexdata_schema.doc; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata_schema.doc IS 'Documentation string.';


--
-- Name: COLUMN exposure_flexdata_schema.unit; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata_schema.unit IS 'Unit for the value. Should be from the IVOA (https://www.ivoa.net/documents/VOUnits/) or astropy.';


--
-- Name: COLUMN exposure_flexdata_schema.ucd; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.exposure_flexdata_schema.ucd IS 'IVOA Unified Content Descriptor (https://www.ivoa.net/documents/UCD1+/).';


--
-- Name: visit1; Type: VIEW; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE VIEW cdb_lsstcomcamsim.visit1 AS
 SELECT exposure.exposure_id AS visit_id,
    exposure.exposure_name,
    exposure.controller,
    exposure.day_obs,
    exposure.seq_num,
    exposure.physical_filter,
    exposure.band,
    exposure.s_ra,
    exposure.s_dec,
    exposure.sky_rotation,
    exposure.azimuth_start,
    exposure.azimuth_end,
    exposure.azimuth,
    exposure.altitude_start,
    exposure.altitude_end,
    exposure.altitude,
    exposure.zenith_distance_start,
    exposure.zenith_distance_end,
    exposure.zenith_distance,
    exposure.airmass,
    exposure.exp_midpt,
    exposure.exp_midpt_mjd,
    exposure.obs_start,
    exposure.obs_start_mjd,
    exposure.obs_end,
    exposure.obs_end_mjd,
    exposure.exp_time,
    exposure.shut_time,
    exposure.dark_time,
    exposure.group_id,
    exposure.cur_index,
    exposure.max_index,
    exposure.img_type,
    exposure.emulated,
    exposure.science_program,
    exposure.observation_reason,
    exposure.target_name,
    exposure.air_temp,
    exposure.pressure,
    exposure.humidity,
    exposure.wind_speed,
    exposure.wind_dir,
    exposure.dimm_seeing,
    exposure.focus_z,
    exposure.simulated,
    exposure.s_region
   FROM cdb_lsstcomcamsim.exposure;


ALTER TABLE cdb_lsstcomcamsim.visit1 OWNER TO oods;

--
-- Name: visit1_quicklook; Type: TABLE; Schema: cdb_lsstcomcamsim; Owner: oods
--

CREATE TABLE cdb_lsstcomcamsim.visit1_quicklook (
    visit_id bigint NOT NULL,
    astrom_offset_mean_min double precision,
    astrom_offset_mean_max double precision,
    astrom_offset_mean_median double precision,
    astrom_offset_std_min double precision,
    astrom_offset_std_max double precision,
    astrom_offset_std_median double precision,
    eff_time_min double precision,
    eff_time_max double precision,
    eff_time_median double precision,
    eff_time_psf_sigma_scale_min double precision,
    eff_time_psf_sigma_scale_max double precision,
    eff_time_psf_sigma_scale_median double precision,
    eff_time_sky_bg_scale_min double precision,
    eff_time_sky_bg_scale_max double precision,
    eff_time_sky_bg_scale_median double precision,
    eff_time_zero_point_scale_min double precision,
    eff_time_zero_point_scale_max double precision,
    eff_time_zero_point_scale_median double precision,
    max_dist_to_nearest_psf_min double precision,
    max_dist_to_nearest_psf_max double precision,
    max_dist_to_nearest_psf_median double precision,
    mean_var_min double precision,
    mean_var_max double precision,
    mean_var_median double precision,
    n_psf_star_min integer,
    n_psf_star_max integer,
    n_psf_star_median integer,
    n_psf_star_total integer,
    psf_area_min double precision,
    psf_area_max double precision,
    psf_area_median double precision,
    psf_ixx_min double precision,
    psf_ixx_max double precision,
    psf_ixx_median double precision,
    psf_ixy_min double precision,
    psf_ixy_max double precision,
    psf_ixy_median double precision,
    psf_iyy_min double precision,
    psf_iyy_max double precision,
    psf_iyy_median double precision,
    psf_sigma_min double precision,
    psf_sigma_max double precision,
    psf_sigma_median double precision,
    psf_star_delta_e1_median_min double precision,
    psf_star_delta_e1_median_max double precision,
    psf_star_delta_e1_median_median double precision,
    psf_star_delta_e1_scatter_min double precision,
    psf_star_delta_e1_scatter_max double precision,
    psf_star_delta_e1_scatter_median double precision,
    psf_star_delta_e2_median_min double precision,
    psf_star_delta_e2_median_max double precision,
    psf_star_delta_e2_median_median double precision,
    psf_star_delta_e2_scatter_min double precision,
    psf_star_delta_e2_scatter_max double precision,
    psf_star_delta_e2_scatter_median double precision,
    psf_star_delta_size_median_min double precision,
    psf_star_delta_size_median_max double precision,
    psf_star_delta_size_median_median double precision,
    psf_star_delta_size_scatter_min double precision,
    psf_star_delta_size_scatter_max double precision,
    psf_star_delta_size_scatter_median double precision,
    psf_star_scaled_delta_size_scatter_min double precision,
    psf_star_scaled_delta_size_scatter_max double precision,
    psf_star_scaled_delta_size_scatter_median double precision,
    psf_trace_radius_delta_min double precision,
    psf_trace_radius_delta_max double precision,
    psf_trace_radius_delta_median double precision,
    sky_bg_min double precision,
    sky_bg_max double precision,
    sky_bg_median double precision,
    sky_noise_min double precision,
    sky_noise_max double precision,
    sky_noise_median double precision,
    zero_point_min double precision,
    zero_point_max double precision,
    zero_point_median double precision,
    low_snr_source_count_min integer,
    low_snr_source_count_max integer,
    low_snr_source_count_median integer,
    low_snr_source_count_total integer,
    high_snr_source_count_min integer,
    high_snr_source_count_max integer,
    high_snr_source_count_median integer,
    high_snr_source_count_total integer,
    seeing_zenith_500nm_min double precision,
    seeing_zenith_500nm_max double precision,
    seeing_zenith_500nm_median double precision,
    n_inputs integer,
    day_obs integer NOT NULL,
    seq_num integer NOT NULL,
    postisr_pixel_median_median double precision,
    postisr_pixel_median_mean double precision,
    postisr_pixel_median_max double precision
);


ALTER TABLE cdb_lsstcomcamsim.visit1_quicklook OWNER TO oods;

--
-- Name: COLUMN visit1_quicklook.visit_id; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.visit_id IS 'Unique identifier.';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_mean_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.astrom_offset_mean_min IS 'Mean offset of astrometric calibration matches (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_mean_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.astrom_offset_mean_max IS 'Mean offset of astrometric calibration matches (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_mean_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.astrom_offset_mean_median IS 'Mean offset of astrometric calibration matches (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_std_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.astrom_offset_std_min IS 'Standard deviation of offsets of astrometric calibration matches (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_std_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.astrom_offset_std_max IS 'Standard deviation of offsets of astrometric calibration matches (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.astrom_offset_std_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.astrom_offset_std_median IS 'Standard deviation of offsets of astrometric calibration matches (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_min IS 'Effective exposure time (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_max IS 'Effective exposure time (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_median IS 'Effective exposure time (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_psf_sigma_scale_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_psf_sigma_scale_min IS 'Scale factor for effective exposure time based on PSF sigma (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_psf_sigma_scale_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_psf_sigma_scale_max IS 'Scale factor for effective exposure time based on PSF sigma (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_psf_sigma_scale_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_psf_sigma_scale_median IS 'Scale factor for effective exposure time based on PSF sigma (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_sky_bg_scale_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_sky_bg_scale_min IS 'Scale factor for effective exposure time based on sky background (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_sky_bg_scale_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_sky_bg_scale_max IS 'Scale factor for effective exposure time based on sky background (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_sky_bg_scale_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_sky_bg_scale_median IS 'Scale factor for effective exposure time based on sky background (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_zero_point_scale_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_zero_point_scale_min IS 'Scale factor for effective exposure time based on zero point (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_zero_point_scale_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_zero_point_scale_max IS 'Scale factor for effective exposure time based on zero point (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.eff_time_zero_point_scale_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.eff_time_zero_point_scale_median IS 'Scale factor for effective exposure time based on zero point (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.max_dist_to_nearest_psf_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.max_dist_to_nearest_psf_min IS 'Maximum distance of an unmasked pixel to its nearest model PSF star (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.max_dist_to_nearest_psf_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.max_dist_to_nearest_psf_max IS 'Maximum distance of an unmasked pixel to its nearest model PSF star (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.max_dist_to_nearest_psf_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.max_dist_to_nearest_psf_median IS 'Maximum distance of an unmasked pixel to its nearest model PSF star (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.mean_var_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.mean_var_min IS 'Mean of the variance plane (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.mean_var_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.mean_var_max IS 'Mean of the variance plane (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.mean_var_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.mean_var_median IS 'Mean of the variance plane (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.n_psf_star_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.n_psf_star_min IS 'Number of stars used for PSF model (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.n_psf_star_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.n_psf_star_max IS 'Number of stars used for PSF model (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.n_psf_star_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.n_psf_star_median IS 'Number of stars used for PSF model (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.n_psf_star_total; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.n_psf_star_total IS 'Number of stars used for PSF model (total across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_area_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_area_min IS 'PSF area (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_area_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_area_max IS 'PSF area (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_area_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_area_median IS 'PSF area (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixx_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_ixx_min IS 'PSF Ixx moment (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixx_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_ixx_max IS 'PSF Ixx moment (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixx_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_ixx_median IS 'PSF Ixx moment (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixy_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_ixy_min IS 'PSF Ixy moment (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixy_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_ixy_max IS 'PSF Ixy moment (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_ixy_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_ixy_median IS 'PSF Ixy moment (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_iyy_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_iyy_min IS 'PSF Iyy moment (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_iyy_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_iyy_max IS 'PSF Iyy moment (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_iyy_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_iyy_median IS 'PSF Iyy moment (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_sigma_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_sigma_min IS 'PSF sigma (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_sigma_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_sigma_max IS 'PSF sigma (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_sigma_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_sigma_median IS 'PSF sigma (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_median_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e1_median_min IS 'Median E1 residual (starE1 - psfE1) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_median_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e1_median_max IS 'Median E1 residual (starE1 - psfE1) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_median_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e1_median_median IS 'Median E1 residual (starE1 - psfE1) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_scatter_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e1_scatter_min IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_scatter_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e1_scatter_max IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e1_scatter_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e1_scatter_median IS 'Scatter (via MAD) of E1 residual (starE1 - psfE1) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_median_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e2_median_min IS 'Median E2 residual (starE2 - psfE2) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_median_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e2_median_max IS 'Median E2 residual (starE2 - psfE2) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_median_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e2_median_median IS 'Median E2 residual (starE2 - psfE2) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_scatter_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e2_scatter_min IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_scatter_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e2_scatter_max IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_e2_scatter_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_e2_scatter_median IS 'Scatter (via MAD) of E2 residual (starE2 - psfE2) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_median_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_size_median_min IS 'Median size residual (starSize - psfSize) for PSF stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_median_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_size_median_max IS 'Median size residual (starSize - psfSize) for PSF stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_median_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_size_median_median IS 'Median size residual (starSize - psfSize) for PSF stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_scatter_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_size_scatter_min IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_scatter_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_size_scatter_max IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_delta_size_scatter_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_delta_size_scatter_median IS 'Scatter (via MAD) of size residual (starSize - psfSize) for stars (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_scaled_delta_size_scatter_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_scaled_delta_size_scatter_min IS 'Scatter (via MAD) of size residual scaled by median size squared (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_scaled_delta_size_scatter_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_scaled_delta_size_scatter_max IS 'Scatter (via MAD) of size residual scaled by median size squared (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_star_scaled_delta_size_scatter_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_star_scaled_delta_size_scatter_median IS 'Scatter (via MAD) of size residual scaled by median size squared (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_trace_radius_delta_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_trace_radius_delta_min IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_trace_radius_delta_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_trace_radius_delta_max IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.psf_trace_radius_delta_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.psf_trace_radius_delta_median IS 'Delta (max - min) of model PSF trace radius values evaluated on a grid of unmasked pixels (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_bg_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.sky_bg_min IS 'Average sky background (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_bg_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.sky_bg_max IS 'Average sky background (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_bg_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.sky_bg_median IS 'Average sky background (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_noise_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.sky_noise_min IS 'RMS noise of the sky background (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_noise_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.sky_noise_max IS 'RMS noise of the sky background (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.sky_noise_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.sky_noise_median IS 'RMS noise of the sky background (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.zero_point_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.zero_point_min IS 'Photometric zero point (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.zero_point_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.zero_point_max IS 'Photometric zero point (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.zero_point_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.zero_point_median IS 'Photometric zero point (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.low_snr_source_count_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.low_snr_source_count_min IS 'Count of low signal-to-noise-ratio sources (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.low_snr_source_count_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.low_snr_source_count_max IS 'Count of low signal-to-noise-ratio sources (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.low_snr_source_count_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.low_snr_source_count_median IS 'Count of low signal-to-noise-ratio sources (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.low_snr_source_count_total; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.low_snr_source_count_total IS 'Count of low signal-to-noise-ratio sources (total across all detectors).';


--
-- Name: COLUMN visit1_quicklook.high_snr_source_count_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.high_snr_source_count_min IS 'Count of high signal-to-noise-ratio sources (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.high_snr_source_count_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.high_snr_source_count_max IS 'Count of high signal-to-noise-ratio sources (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.high_snr_source_count_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.high_snr_source_count_median IS 'Count of high signal-to-noise-ratio sources (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.high_snr_source_count_total; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.high_snr_source_count_total IS 'Count of high signal-to-noise-ratio sources (total across all detectors).';


--
-- Name: COLUMN visit1_quicklook.seeing_zenith_500nm_min; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.seeing_zenith_500nm_min IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1 (minimum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.seeing_zenith_500nm_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.seeing_zenith_500nm_max IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1 (maximum across all detectors).';


--
-- Name: COLUMN visit1_quicklook.seeing_zenith_500nm_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.seeing_zenith_500nm_median IS 'Measured PSF sigma, corrected to 500nm and an airmass of 1 (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.n_inputs; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.n_inputs IS 'Number of CCDs used to compute the visit aggregates.';


--
-- Name: COLUMN visit1_quicklook.day_obs; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.day_obs IS 'Day of observation.';


--
-- Name: COLUMN visit1_quicklook.seq_num; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.seq_num IS 'Sequence number.';


--
-- Name: COLUMN visit1_quicklook.postisr_pixel_median_median; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.postisr_pixel_median_median IS 'Median postISR pixel value (median across all detectors).';


--
-- Name: COLUMN visit1_quicklook.postisr_pixel_median_mean; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.postisr_pixel_median_mean IS 'Median postISR pixel value (mean across all detectors).';


--
-- Name: COLUMN visit1_quicklook.postisr_pixel_median_max; Type: COMMENT; Schema: cdb_lsstcomcamsim; Owner: oods
--

COMMENT ON COLUMN cdb_lsstcomcamsim.visit1_quicklook.postisr_pixel_median_max IS 'Median postISR pixel value (max across all detectors).';


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: exposurelog
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO exposurelog;

--
-- Name: message; Type: TABLE; Schema: public; Owner: exposurelog
--

CREATE TABLE public.message (
    id uuid NOT NULL,
    site_id character varying(16),
    obs_id character varying NOT NULL,
    instrument character varying NOT NULL,
    day_obs integer NOT NULL,
    message_text text NOT NULL,
    tags text[] NOT NULL,
    user_id character varying NOT NULL,
    user_agent character varying NOT NULL,
    is_human boolean NOT NULL,
    is_valid boolean GENERATED ALWAYS AS ((date_invalidated IS NULL)) STORED NOT NULL,
    exposure_flag public.exposure_flag_enum NOT NULL,
    date_added timestamp without time zone NOT NULL,
    date_invalidated timestamp without time zone,
    parent_id uuid,
    level integer NOT NULL,
    urls text[] NOT NULL,
    seq_num integer NOT NULL
);


ALTER TABLE public.message OWNER TO exposurelog;

--
-- Name: ccdexposure ccdexposure_id; Type: DEFAULT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure ALTER COLUMN ccdexposure_id SET DEFAULT nextval('cdb_latiss.ccdexposure_ccdexposure_id_seq'::regclass);


--
-- Name: exposure exposure_id; Type: DEFAULT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure ALTER COLUMN exposure_id SET DEFAULT nextval('cdb_latiss.exposure_exposure_id_seq'::regclass);


--
-- Name: ccdexposure ccdexposure_id; Type: DEFAULT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure ALTER COLUMN ccdexposure_id SET DEFAULT nextval('cdb_lsstcomcam.ccdexposure_ccdexposure_id_seq'::regclass);


--
-- Name: exposure exposure_id; Type: DEFAULT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure ALTER COLUMN exposure_id SET DEFAULT nextval('cdb_lsstcomcam.exposure_exposure_id_seq'::regclass);


--
-- Name: ccdexposure ccdexposure_id; Type: DEFAULT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure ALTER COLUMN ccdexposure_id SET DEFAULT nextval('cdb_lsstcomcamsim.ccdexposure_ccdexposure_id_seq'::regclass);


--
-- Name: exposure exposure_id; Type: DEFAULT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure ALTER COLUMN exposure_id SET DEFAULT nextval('cdb_lsstcomcamsim.exposure_exposure_id_seq'::regclass);


--
-- Name: cdb_latiss_version cdb_latiss_version_pkc; Type: CONSTRAINT; Schema: cdb; Owner: oods
--

ALTER TABLE ONLY cdb.cdb_latiss_version
    ADD CONSTRAINT cdb_latiss_version_pkc PRIMARY KEY (version_num);


--
-- Name: cdb_lsstcomcam_version cdb_lsstcomcam_version_pkc; Type: CONSTRAINT; Schema: cdb; Owner: oods
--

ALTER TABLE ONLY cdb.cdb_lsstcomcam_version
    ADD CONSTRAINT cdb_lsstcomcam_version_pkc PRIMARY KEY (version_num);


--
-- Name: cdb_lsstcomcamsim_version cdb_lsstcomcamsim_version_pkc; Type: CONSTRAINT; Schema: cdb; Owner: oods
--

ALTER TABLE ONLY cdb.cdb_lsstcomcamsim_version
    ADD CONSTRAINT cdb_lsstcomcamsim_version_pkc PRIMARY KEY (version_num);


--
-- Name: ccdexposure_camera ccdexposure_camera_pkey; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure_camera
    ADD CONSTRAINT ccdexposure_camera_pkey PRIMARY KEY (ccdexposure_id);


--
-- Name: ccdexposure_flexdata ccdexposure_flexdata_pkey; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure_flexdata
    ADD CONSTRAINT ccdexposure_flexdata_pkey PRIMARY KEY (obs_id, key);


--
-- Name: ccdexposure_flexdata_schema ccdexposure_flexdata_schema_pkey; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure_flexdata_schema
    ADD CONSTRAINT ccdexposure_flexdata_schema_pkey PRIMARY KEY (key);


--
-- Name: ccdexposure ccdexposure_pkey; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure
    ADD CONSTRAINT ccdexposure_pkey PRIMARY KEY (ccdexposure_id);


--
-- Name: ccdvisit1_quicklook ccdvisit1_quicklook_pkey; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdvisit1_quicklook
    ADD CONSTRAINT ccdvisit1_quicklook_pkey PRIMARY KEY (ccdvisit_id);


--
-- Name: exposure_flexdata exposure_flexdata_pkey; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure_flexdata
    ADD CONSTRAINT exposure_flexdata_pkey PRIMARY KEY (obs_id, key);


--
-- Name: exposure_flexdata_schema exposure_flexdata_schema_pkey; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure_flexdata_schema
    ADD CONSTRAINT exposure_flexdata_schema_pkey PRIMARY KEY (key);


--
-- Name: exposure exposure_pkey1; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure
    ADD CONSTRAINT exposure_pkey1 PRIMARY KEY (exposure_id);


--
-- Name: ccdexposure un_ccdexposure_ccdexposure_id; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure
    ADD CONSTRAINT un_ccdexposure_ccdexposure_id UNIQUE (ccdexposure_id);


--
-- Name: ccdexposure un_ccdexposure_day_obs_seq_num_detector; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure
    ADD CONSTRAINT un_ccdexposure_day_obs_seq_num_detector UNIQUE (day_obs, seq_num, detector);


--
-- Name: ccdexposure un_ccdexposure_exposure_id_detector; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure
    ADD CONSTRAINT un_ccdexposure_exposure_id_detector UNIQUE (exposure_id, detector);


--
-- Name: exposure un_exposure_day_obs_seq_num; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure
    ADD CONSTRAINT un_exposure_day_obs_seq_num UNIQUE (day_obs, seq_num);


--
-- Name: exposure un_exposure_exposure_id; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure
    ADD CONSTRAINT un_exposure_exposure_id UNIQUE (exposure_id);


--
-- Name: exposure_flexdata un_exposure_flexdata_day_obs_seq_num_key; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure_flexdata
    ADD CONSTRAINT un_exposure_flexdata_day_obs_seq_num_key UNIQUE (day_obs, seq_num, key);


--
-- Name: visit1_quicklook visit1_quicklook_pkey; Type: CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.visit1_quicklook
    ADD CONSTRAINT visit1_quicklook_pkey PRIMARY KEY (visit_id);


--
-- Name: ccdexposure_camera ccdexposure_camera_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure_camera
    ADD CONSTRAINT ccdexposure_camera_pkey PRIMARY KEY (ccdexposure_id);


--
-- Name: ccdexposure_flexdata ccdexposure_flexdata_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure_flexdata
    ADD CONSTRAINT ccdexposure_flexdata_pkey PRIMARY KEY (obs_id, key);


--
-- Name: ccdexposure_flexdata_schema ccdexposure_flexdata_schema_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure_flexdata_schema
    ADD CONSTRAINT ccdexposure_flexdata_schema_pkey PRIMARY KEY (key);


--
-- Name: ccdexposure ccdexposure_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure
    ADD CONSTRAINT ccdexposure_pkey PRIMARY KEY (ccdexposure_id);


--
-- Name: ccdvisit1_quicklook ccdvisit1_quicklook_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdvisit1_quicklook
    ADD CONSTRAINT ccdvisit1_quicklook_pkey PRIMARY KEY (ccdvisit_id);


--
-- Name: exposure_flexdata exposure_flexdata_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure_flexdata
    ADD CONSTRAINT exposure_flexdata_pkey PRIMARY KEY (obs_id, key);


--
-- Name: exposure_flexdata_schema exposure_flexdata_schema_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure_flexdata_schema
    ADD CONSTRAINT exposure_flexdata_schema_pkey PRIMARY KEY (key);


--
-- Name: exposure exposure_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure
    ADD CONSTRAINT exposure_pkey PRIMARY KEY (exposure_id);


--
-- Name: ccdexposure un_ccdexposure_ccdexposure_id; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure
    ADD CONSTRAINT un_ccdexposure_ccdexposure_id UNIQUE (ccdexposure_id);


--
-- Name: ccdexposure un_ccdexposure_day_obs_seq_num_detector; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure
    ADD CONSTRAINT un_ccdexposure_day_obs_seq_num_detector UNIQUE (day_obs, seq_num, detector);


--
-- Name: ccdexposure un_ccdexposure_exposure_id_detector; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure
    ADD CONSTRAINT un_ccdexposure_exposure_id_detector UNIQUE (exposure_id, detector);


--
-- Name: exposure un_exposure_day_obs_seq_num; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure
    ADD CONSTRAINT un_exposure_day_obs_seq_num UNIQUE (day_obs, seq_num);


--
-- Name: exposure un_exposure_exposure_id; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure
    ADD CONSTRAINT un_exposure_exposure_id UNIQUE (exposure_id);


--
-- Name: exposure_flexdata un_exposure_flexdata_day_obs_seq_num_key; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure_flexdata
    ADD CONSTRAINT un_exposure_flexdata_day_obs_seq_num_key UNIQUE (day_obs, seq_num, key);


--
-- Name: visit1_quicklook visit1_quicklook_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.visit1_quicklook
    ADD CONSTRAINT visit1_quicklook_pkey PRIMARY KEY (visit_id);


--
-- Name: ccdexposure_camera ccdexposure_camera_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure_camera
    ADD CONSTRAINT ccdexposure_camera_pkey PRIMARY KEY (ccdexposure_id);


--
-- Name: ccdexposure_flexdata ccdexposure_flexdata_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure_flexdata
    ADD CONSTRAINT ccdexposure_flexdata_pkey PRIMARY KEY (obs_id, key);


--
-- Name: ccdexposure_flexdata_schema ccdexposure_flexdata_schema_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure_flexdata_schema
    ADD CONSTRAINT ccdexposure_flexdata_schema_pkey PRIMARY KEY (key);


--
-- Name: ccdexposure ccdexposure_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure
    ADD CONSTRAINT ccdexposure_pkey PRIMARY KEY (ccdexposure_id);


--
-- Name: ccdvisit1_quicklook ccdvisit1_quicklook_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdvisit1_quicklook
    ADD CONSTRAINT ccdvisit1_quicklook_pkey PRIMARY KEY (ccdvisit_id);


--
-- Name: exposure_flexdata exposure_flexdata_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure_flexdata
    ADD CONSTRAINT exposure_flexdata_pkey PRIMARY KEY (obs_id, key);


--
-- Name: exposure_flexdata_schema exposure_flexdata_schema_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure_flexdata_schema
    ADD CONSTRAINT exposure_flexdata_schema_pkey PRIMARY KEY (key);


--
-- Name: exposure exposure_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure
    ADD CONSTRAINT exposure_pkey PRIMARY KEY (exposure_id);


--
-- Name: ccdexposure un_ccdexposure_ccdexposure_id; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure
    ADD CONSTRAINT un_ccdexposure_ccdexposure_id UNIQUE (ccdexposure_id);


--
-- Name: ccdexposure un_ccdexposure_day_obs_seq_num_detector; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure
    ADD CONSTRAINT un_ccdexposure_day_obs_seq_num_detector UNIQUE (day_obs, seq_num, detector);


--
-- Name: ccdexposure un_ccdexposure_exposure_id_detector; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure
    ADD CONSTRAINT un_ccdexposure_exposure_id_detector UNIQUE (exposure_id, detector);


--
-- Name: exposure un_exposure_day_obs_seq_num; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure
    ADD CONSTRAINT un_exposure_day_obs_seq_num UNIQUE (day_obs, seq_num);


--
-- Name: exposure un_exposure_exposure_id; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure
    ADD CONSTRAINT un_exposure_exposure_id UNIQUE (exposure_id);


--
-- Name: exposure_flexdata un_exposure_flexdata_day_obs_seq_num_key; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure_flexdata
    ADD CONSTRAINT un_exposure_flexdata_day_obs_seq_num_key UNIQUE (day_obs, seq_num, key);


--
-- Name: visit1_quicklook visit1_quicklook_pkey; Type: CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.visit1_quicklook
    ADD CONSTRAINT visit1_quicklook_pkey PRIMARY KEY (visit_id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: exposurelog
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: exposurelog
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: idx_date_added; Type: INDEX; Schema: public; Owner: exposurelog
--

CREATE INDEX idx_date_added ON public.message USING btree (date_added);


--
-- Name: idx_day_obs; Type: INDEX; Schema: public; Owner: exposurelog
--

CREATE INDEX idx_day_obs ON public.message USING btree (day_obs);


--
-- Name: idx_exposure_flag; Type: INDEX; Schema: public; Owner: exposurelog
--

CREATE INDEX idx_exposure_flag ON public.message USING btree (exposure_flag);


--
-- Name: idx_instrument; Type: INDEX; Schema: public; Owner: exposurelog
--

CREATE INDEX idx_instrument ON public.message USING btree (instrument);


--
-- Name: idx_is_valid; Type: INDEX; Schema: public; Owner: exposurelog
--

CREATE INDEX idx_is_valid ON public.message USING btree (is_valid);


--
-- Name: idx_obs_id; Type: INDEX; Schema: public; Owner: exposurelog
--

CREATE INDEX idx_obs_id ON public.message USING btree (obs_id);


--
-- Name: idx_tags; Type: INDEX; Schema: public; Owner: exposurelog
--

CREATE INDEX idx_tags ON public.message USING btree (tags);


--
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: exposurelog
--

CREATE INDEX idx_user_id ON public.message USING btree (user_id);


--
-- Name: ccdexposure fk_ccdexposure_day_obs_seq_num; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure
    ADD CONSTRAINT fk_ccdexposure_day_obs_seq_num FOREIGN KEY (day_obs, seq_num) REFERENCES cdb_latiss.exposure(day_obs, seq_num);


--
-- Name: ccdexposure fk_ccdexposure_exposure_id; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure
    ADD CONSTRAINT fk_ccdexposure_exposure_id FOREIGN KEY (exposure_id) REFERENCES cdb_latiss.exposure(exposure_id);


--
-- Name: ccdexposure_camera fk_ccdexposure_id; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure_camera
    ADD CONSTRAINT fk_ccdexposure_id FOREIGN KEY (ccdexposure_id) REFERENCES cdb_latiss.ccdexposure(ccdexposure_id);


--
-- Name: exposure_flexdata fk_exposure_flexdata_day_obs_seq_num; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure_flexdata
    ADD CONSTRAINT fk_exposure_flexdata_day_obs_seq_num FOREIGN KEY (day_obs, seq_num) REFERENCES cdb_latiss.exposure(day_obs, seq_num);


--
-- Name: exposure_flexdata fk_exposure_flexdata_obs_id; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure_flexdata
    ADD CONSTRAINT fk_exposure_flexdata_obs_id FOREIGN KEY (obs_id) REFERENCES cdb_latiss.exposure(exposure_id);


--
-- Name: exposure_flexdata fk_key; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.exposure_flexdata
    ADD CONSTRAINT fk_key FOREIGN KEY (key) REFERENCES cdb_latiss.exposure_flexdata_schema(key);


--
-- Name: ccdexposure_flexdata fk_key; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure_flexdata
    ADD CONSTRAINT fk_key FOREIGN KEY (key) REFERENCES cdb_latiss.ccdexposure_flexdata_schema(key);


--
-- Name: ccdexposure_flexdata fk_obs_id; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdexposure_flexdata
    ADD CONSTRAINT fk_obs_id FOREIGN KEY (obs_id) REFERENCES cdb_latiss.ccdexposure(ccdexposure_id);


--
-- Name: visit1_quicklook fk_obs_id; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.visit1_quicklook
    ADD CONSTRAINT fk_obs_id FOREIGN KEY (visit_id) REFERENCES cdb_latiss.exposure(exposure_id);


--
-- Name: ccdvisit1_quicklook fk_obs_id; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.ccdvisit1_quicklook
    ADD CONSTRAINT fk_obs_id FOREIGN KEY (ccdvisit_id) REFERENCES cdb_latiss.ccdexposure(ccdexposure_id);


--
-- Name: visit1_quicklook fk_visit1_quicklook_day_obs_seq_num; Type: FK CONSTRAINT; Schema: cdb_latiss; Owner: oods
--

ALTER TABLE ONLY cdb_latiss.visit1_quicklook
    ADD CONSTRAINT fk_visit1_quicklook_day_obs_seq_num FOREIGN KEY (day_obs, seq_num) REFERENCES cdb_latiss.exposure(day_obs, seq_num);


--
-- Name: ccdexposure fk_ccdexposure_day_obs_seq_num; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure
    ADD CONSTRAINT fk_ccdexposure_day_obs_seq_num FOREIGN KEY (day_obs, seq_num) REFERENCES cdb_lsstcomcam.exposure(day_obs, seq_num);


--
-- Name: ccdexposure fk_ccdexposure_exposure_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure
    ADD CONSTRAINT fk_ccdexposure_exposure_id FOREIGN KEY (exposure_id) REFERENCES cdb_lsstcomcam.exposure(exposure_id);


--
-- Name: ccdexposure_camera fk_ccdexposure_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure_camera
    ADD CONSTRAINT fk_ccdexposure_id FOREIGN KEY (ccdexposure_id) REFERENCES cdb_lsstcomcam.ccdexposure(ccdexposure_id);


--
-- Name: exposure_flexdata fk_exposure_flexdata_day_obs_seq_num; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure_flexdata
    ADD CONSTRAINT fk_exposure_flexdata_day_obs_seq_num FOREIGN KEY (day_obs, seq_num) REFERENCES cdb_lsstcomcam.exposure(day_obs, seq_num);


--
-- Name: exposure_flexdata fk_exposure_flexdata_obs_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure_flexdata
    ADD CONSTRAINT fk_exposure_flexdata_obs_id FOREIGN KEY (obs_id) REFERENCES cdb_lsstcomcam.exposure(exposure_id);


--
-- Name: exposure_flexdata fk_key; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.exposure_flexdata
    ADD CONSTRAINT fk_key FOREIGN KEY (key) REFERENCES cdb_lsstcomcam.exposure_flexdata_schema(key);


--
-- Name: ccdexposure_flexdata fk_key; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure_flexdata
    ADD CONSTRAINT fk_key FOREIGN KEY (key) REFERENCES cdb_lsstcomcam.ccdexposure_flexdata_schema(key);


--
-- Name: visit1_quicklook fk_obs_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.visit1_quicklook
    ADD CONSTRAINT fk_obs_id FOREIGN KEY (visit_id) REFERENCES cdb_lsstcomcam.exposure(exposure_id);


--
-- Name: ccdexposure_flexdata fk_obs_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdexposure_flexdata
    ADD CONSTRAINT fk_obs_id FOREIGN KEY (obs_id) REFERENCES cdb_lsstcomcam.ccdexposure(ccdexposure_id);


--
-- Name: ccdvisit1_quicklook fk_obs_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.ccdvisit1_quicklook
    ADD CONSTRAINT fk_obs_id FOREIGN KEY (ccdvisit_id) REFERENCES cdb_lsstcomcam.ccdexposure(ccdexposure_id);


--
-- Name: visit1_quicklook fk_visit1_quicklook_day_obs_seq_num; Type: FK CONSTRAINT; Schema: cdb_lsstcomcam; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcam.visit1_quicklook
    ADD CONSTRAINT fk_visit1_quicklook_day_obs_seq_num FOREIGN KEY (day_obs, seq_num) REFERENCES cdb_lsstcomcam.exposure(day_obs, seq_num);


--
-- Name: ccdexposure fk_ccdexposure_day_obs_seq_num; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure
    ADD CONSTRAINT fk_ccdexposure_day_obs_seq_num FOREIGN KEY (day_obs, seq_num) REFERENCES cdb_lsstcomcamsim.exposure(day_obs, seq_num);


--
-- Name: ccdexposure fk_ccdexposure_exposure_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure
    ADD CONSTRAINT fk_ccdexposure_exposure_id FOREIGN KEY (exposure_id) REFERENCES cdb_lsstcomcamsim.exposure(exposure_id);


--
-- Name: ccdexposure_camera fk_ccdexposure_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure_camera
    ADD CONSTRAINT fk_ccdexposure_id FOREIGN KEY (ccdexposure_id) REFERENCES cdb_lsstcomcamsim.ccdexposure(ccdexposure_id);


--
-- Name: exposure_flexdata fk_exposure_flexdata_day_obs_seq_num; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure_flexdata
    ADD CONSTRAINT fk_exposure_flexdata_day_obs_seq_num FOREIGN KEY (day_obs, seq_num) REFERENCES cdb_lsstcomcamsim.exposure(day_obs, seq_num);


--
-- Name: exposure_flexdata fk_exposure_flexdata_obs_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure_flexdata
    ADD CONSTRAINT fk_exposure_flexdata_obs_id FOREIGN KEY (obs_id) REFERENCES cdb_lsstcomcamsim.exposure(exposure_id);


--
-- Name: exposure_flexdata fk_key; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.exposure_flexdata
    ADD CONSTRAINT fk_key FOREIGN KEY (key) REFERENCES cdb_lsstcomcamsim.exposure_flexdata_schema(key);


--
-- Name: ccdexposure_flexdata fk_key; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure_flexdata
    ADD CONSTRAINT fk_key FOREIGN KEY (key) REFERENCES cdb_lsstcomcamsim.ccdexposure_flexdata_schema(key);


--
-- Name: ccdexposure_flexdata fk_obs_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdexposure_flexdata
    ADD CONSTRAINT fk_obs_id FOREIGN KEY (obs_id) REFERENCES cdb_lsstcomcamsim.ccdexposure(ccdexposure_id);


--
-- Name: visit1_quicklook fk_obs_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.visit1_quicklook
    ADD CONSTRAINT fk_obs_id FOREIGN KEY (visit_id) REFERENCES cdb_lsstcomcamsim.exposure(exposure_id);


--
-- Name: ccdvisit1_quicklook fk_obs_id; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.ccdvisit1_quicklook
    ADD CONSTRAINT fk_obs_id FOREIGN KEY (ccdvisit_id) REFERENCES cdb_lsstcomcamsim.ccdexposure(ccdexposure_id);


--
-- Name: visit1_quicklook fk_visit1_quicklook_day_obs_seq_num; Type: FK CONSTRAINT; Schema: cdb_lsstcomcamsim; Owner: oods
--

ALTER TABLE ONLY cdb_lsstcomcamsim.visit1_quicklook
    ADD CONSTRAINT fk_visit1_quicklook_day_obs_seq_num FOREIGN KEY (day_obs, seq_num) REFERENCES cdb_lsstcomcamsim.exposure(day_obs, seq_num);


--
-- Name: message message_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: exposurelog
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.message(id);


--
-- Name: usdf; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION usdf WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION usdf OWNER TO postgres;

--
-- Name: usdfpub; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION usdfpub WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION usdfpub OWNER TO postgres;

--
-- Name: usdfpub cdb_latiss_version; Type: PUBLICATION TABLE; Schema: cdb; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb.cdb_latiss_version;


--
-- Name: usdfpub cdb_lsstcomcam_version; Type: PUBLICATION TABLE; Schema: cdb; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb.cdb_lsstcomcam_version;


--
-- Name: usdfpub cdb_lsstcomcamsim_version; Type: PUBLICATION TABLE; Schema: cdb; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb.cdb_lsstcomcamsim_version;


--
-- Name: usdfpub ccdexposure; Type: PUBLICATION TABLE; Schema: cdb_latiss; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_latiss.ccdexposure;


--
-- Name: usdfpub ccdexposure_camera; Type: PUBLICATION TABLE; Schema: cdb_latiss; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_latiss.ccdexposure_camera;


--
-- Name: usdfpub ccdexposure_flexdata; Type: PUBLICATION TABLE; Schema: cdb_latiss; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_latiss.ccdexposure_flexdata;


--
-- Name: usdfpub ccdexposure_flexdata_schema; Type: PUBLICATION TABLE; Schema: cdb_latiss; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_latiss.ccdexposure_flexdata_schema;


--
-- Name: usdfpub ccdvisit1_quicklook; Type: PUBLICATION TABLE; Schema: cdb_latiss; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_latiss.ccdvisit1_quicklook;


--
-- Name: usdfpub exposure; Type: PUBLICATION TABLE; Schema: cdb_latiss; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_latiss.exposure;


--
-- Name: usdfpub exposure_flexdata; Type: PUBLICATION TABLE; Schema: cdb_latiss; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_latiss.exposure_flexdata;


--
-- Name: usdfpub exposure_flexdata_schema; Type: PUBLICATION TABLE; Schema: cdb_latiss; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_latiss.exposure_flexdata_schema;


--
-- Name: usdfpub visit1_quicklook; Type: PUBLICATION TABLE; Schema: cdb_latiss; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_latiss.visit1_quicklook;


--
-- Name: usdfpub ccdexposure; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcam; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcam.ccdexposure;


--
-- Name: usdfpub ccdexposure_camera; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcam; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcam.ccdexposure_camera;


--
-- Name: usdfpub ccdexposure_flexdata; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcam; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcam.ccdexposure_flexdata;


--
-- Name: usdfpub ccdexposure_flexdata_schema; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcam; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcam.ccdexposure_flexdata_schema;


--
-- Name: usdfpub ccdvisit1_quicklook; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcam; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcam.ccdvisit1_quicklook;


--
-- Name: usdfpub exposure; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcam; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcam.exposure;


--
-- Name: usdfpub exposure_flexdata; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcam; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcam.exposure_flexdata;


--
-- Name: usdfpub exposure_flexdata_schema; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcam; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcam.exposure_flexdata_schema;


--
-- Name: usdfpub visit1_quicklook; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcam; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcam.visit1_quicklook;


--
-- Name: usdfpub ccdexposure; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcamsim; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcamsim.ccdexposure;


--
-- Name: usdfpub ccdexposure_camera; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcamsim; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcamsim.ccdexposure_camera;


--
-- Name: usdfpub ccdexposure_flexdata; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcamsim; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcamsim.ccdexposure_flexdata;


--
-- Name: usdfpub ccdexposure_flexdata_schema; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcamsim; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcamsim.ccdexposure_flexdata_schema;


--
-- Name: usdfpub ccdvisit1_quicklook; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcamsim; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcamsim.ccdvisit1_quicklook;


--
-- Name: usdfpub exposure; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcamsim; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcamsim.exposure;


--
-- Name: usdfpub exposure_flexdata; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcamsim; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcamsim.exposure_flexdata;


--
-- Name: usdfpub exposure_flexdata_schema; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcamsim; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcamsim.exposure_flexdata_schema;


--
-- Name: usdfpub visit1_quicklook; Type: PUBLICATION TABLE; Schema: cdb_lsstcomcamsim; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY cdb_lsstcomcamsim.visit1_quicklook;


--
-- Name: usdfpub alembic_version; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY public.alembic_version;


--
-- Name: usdf message; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION usdf ADD TABLE ONLY public.message;


--
-- Name: usdfpub message; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION usdfpub ADD TABLE ONLY public.message;


--
-- Name: SCHEMA cdb; Type: ACL; Schema: -; Owner: oods
--

GRANT USAGE ON SCHEMA cdb TO usdf;
GRANT USAGE ON SCHEMA cdb TO replicauser;


--
-- Name: SCHEMA cdb_latiss; Type: ACL; Schema: -; Owner: oods
--

GRANT USAGE ON SCHEMA cdb_latiss TO usdf;
GRANT USAGE ON SCHEMA cdb_latiss TO replicauser;


--
-- Name: SCHEMA cdb_lsstcomcam; Type: ACL; Schema: -; Owner: oods
--

GRANT USAGE ON SCHEMA cdb_lsstcomcam TO usdf;
GRANT USAGE ON SCHEMA cdb_lsstcomcam TO replicauser;


--
-- Name: SCHEMA cdb_lsstcomcamsim; Type: ACL; Schema: -; Owner: oods
--

GRANT USAGE ON SCHEMA cdb_lsstcomcamsim TO usdf;
GRANT USAGE ON SCHEMA cdb_lsstcomcamsim TO replicauser;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO usdf;


--
-- Name: TABLE cdb_latiss_version; Type: ACL; Schema: cdb; Owner: oods
--

GRANT SELECT ON TABLE cdb.cdb_latiss_version TO usdf;
GRANT SELECT ON TABLE cdb.cdb_latiss_version TO replicauser;


--
-- Name: TABLE cdb_lsstcomcam_version; Type: ACL; Schema: cdb; Owner: oods
--

GRANT SELECT ON TABLE cdb.cdb_lsstcomcam_version TO usdf;
GRANT SELECT ON TABLE cdb.cdb_lsstcomcam_version TO replicauser;


--
-- Name: TABLE cdb_lsstcomcamsim_version; Type: ACL; Schema: cdb; Owner: oods
--

GRANT SELECT ON TABLE cdb.cdb_lsstcomcamsim_version TO usdf;
GRANT SELECT ON TABLE cdb.cdb_lsstcomcamsim_version TO replicauser;


--
-- Name: TABLE ccdexposure; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.ccdexposure TO usdf;
GRANT SELECT ON TABLE cdb_latiss.ccdexposure TO replicauser;


--
-- Name: TABLE ccdexposure_camera; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.ccdexposure_camera TO usdf;
GRANT SELECT ON TABLE cdb_latiss.ccdexposure_camera TO replicauser;


--
-- Name: TABLE ccdexposure_flexdata; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.ccdexposure_flexdata TO usdf;
GRANT SELECT ON TABLE cdb_latiss.ccdexposure_flexdata TO replicauser;


--
-- Name: TABLE ccdexposure_flexdata_schema; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.ccdexposure_flexdata_schema TO usdf;
GRANT SELECT ON TABLE cdb_latiss.ccdexposure_flexdata_schema TO replicauser;


--
-- Name: TABLE ccdvisit1; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.ccdvisit1 TO usdf;


--
-- Name: TABLE ccdvisit1_quicklook; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.ccdvisit1_quicklook TO usdf;
GRANT SELECT ON TABLE cdb_latiss.ccdvisit1_quicklook TO replicauser;


--
-- Name: TABLE exposure; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.exposure TO usdf;
GRANT SELECT ON TABLE cdb_latiss.exposure TO replicauser;


--
-- Name: TABLE exposure_flexdata; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.exposure_flexdata TO usdf;
GRANT SELECT ON TABLE cdb_latiss.exposure_flexdata TO replicauser;


--
-- Name: TABLE exposure_flexdata_schema; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.exposure_flexdata_schema TO usdf;
GRANT SELECT ON TABLE cdb_latiss.exposure_flexdata_schema TO replicauser;


--
-- Name: TABLE visit1; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.visit1 TO usdf;


--
-- Name: TABLE visit1_quicklook; Type: ACL; Schema: cdb_latiss; Owner: oods
--

GRANT SELECT ON TABLE cdb_latiss.visit1_quicklook TO usdf;
GRANT SELECT ON TABLE cdb_latiss.visit1_quicklook TO replicauser;


--
-- Name: TABLE ccdexposure; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.ccdexposure TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcam.ccdexposure TO replicauser;


--
-- Name: TABLE ccdexposure_camera; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.ccdexposure_camera TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcam.ccdexposure_camera TO replicauser;


--
-- Name: TABLE ccdexposure_flexdata; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.ccdexposure_flexdata TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcam.ccdexposure_flexdata TO replicauser;


--
-- Name: TABLE ccdexposure_flexdata_schema; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.ccdexposure_flexdata_schema TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcam.ccdexposure_flexdata_schema TO replicauser;


--
-- Name: TABLE ccdvisit1; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.ccdvisit1 TO usdf;


--
-- Name: TABLE ccdvisit1_quicklook; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.ccdvisit1_quicklook TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcam.ccdvisit1_quicklook TO replicauser;


--
-- Name: TABLE exposure; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.exposure TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcam.exposure TO replicauser;


--
-- Name: TABLE exposure_flexdata; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.exposure_flexdata TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcam.exposure_flexdata TO replicauser;


--
-- Name: TABLE exposure_flexdata_schema; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.exposure_flexdata_schema TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcam.exposure_flexdata_schema TO replicauser;


--
-- Name: TABLE visit1; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.visit1 TO usdf;


--
-- Name: TABLE visit1_quicklook; Type: ACL; Schema: cdb_lsstcomcam; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcam.visit1_quicklook TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcam.visit1_quicklook TO replicauser;


--
-- Name: TABLE ccdexposure; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdexposure TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdexposure TO replicauser;


--
-- Name: TABLE ccdexposure_camera; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdexposure_camera TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdexposure_camera TO replicauser;


--
-- Name: TABLE ccdexposure_flexdata; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdexposure_flexdata TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdexposure_flexdata TO replicauser;


--
-- Name: TABLE ccdexposure_flexdata_schema; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdexposure_flexdata_schema TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdexposure_flexdata_schema TO replicauser;


--
-- Name: TABLE ccdvisit1; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdvisit1 TO usdf;


--
-- Name: TABLE ccdvisit1_quicklook; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdvisit1_quicklook TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcamsim.ccdvisit1_quicklook TO replicauser;


--
-- Name: TABLE exposure; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.exposure TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcamsim.exposure TO replicauser;


--
-- Name: TABLE exposure_flexdata; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.exposure_flexdata TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcamsim.exposure_flexdata TO replicauser;


--
-- Name: TABLE exposure_flexdata_schema; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.exposure_flexdata_schema TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcamsim.exposure_flexdata_schema TO replicauser;


--
-- Name: TABLE visit1; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.visit1 TO usdf;


--
-- Name: TABLE visit1_quicklook; Type: ACL; Schema: cdb_lsstcomcamsim; Owner: oods
--

GRANT SELECT ON TABLE cdb_lsstcomcamsim.visit1_quicklook TO usdf;
GRANT SELECT ON TABLE cdb_lsstcomcamsim.visit1_quicklook TO replicauser;


--
-- Name: TABLE alembic_version; Type: ACL; Schema: public; Owner: exposurelog
--

GRANT SELECT ON TABLE public.alembic_version TO usdf;
GRANT SELECT ON TABLE public.alembic_version TO replicauser;


--
-- Name: TABLE message; Type: ACL; Schema: public; Owner: exposurelog
--

GRANT SELECT ON TABLE public.message TO usdf;
GRANT SELECT ON TABLE public.message TO replicauser;


--
-- PostgreSQL database dump complete
--

