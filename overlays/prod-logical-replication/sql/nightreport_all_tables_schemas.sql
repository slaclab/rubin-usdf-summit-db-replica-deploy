--
-- Name: telescope_enum; Type: TYPE; Schema: public; Owner: nightreport
--

CREATE TYPE public.telescope_enum AS ENUM (
    'AuxTel',
    'Simonyi'
);


ALTER TYPE public.telescope_enum OWNER TO nightreport;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: nightreport
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO nightreport;

--
-- Name: nightreport; Type: TABLE; Schema: public; Owner: nightreport
--

CREATE TABLE public.nightreport (
    id uuid NOT NULL,
    site_id character varying(16),
    telescope public.telescope_enum NOT NULL,
    summary text NOT NULL,
    telescope_status text NOT NULL,
    confluence_url character varying(200) NOT NULL,
    day_obs integer NOT NULL,
    user_id character varying NOT NULL,
    user_agent character varying NOT NULL,
    date_added timestamp without time zone NOT NULL,
    date_sent timestamp without time zone,
    is_valid boolean GENERATED ALWAYS AS ((date_invalidated IS NULL)) STORED NOT NULL,
    date_invalidated timestamp without time zone,
    parent_id uuid,
    observers_crew text[] NOT NULL
);


ALTER TABLE public.nightreport OWNER TO nightreport;

--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: nightreport
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: nightreport nightreport_pkey; Type: CONSTRAINT; Schema: public; Owner: nightreport
--

ALTER TABLE ONLY public.nightreport
    ADD CONSTRAINT nightreport_pkey PRIMARY KEY (id);


--
-- Name: idx_date_added; Type: INDEX; Schema: public; Owner: nightreport
--

CREATE INDEX idx_date_added ON public.nightreport USING btree (date_added);


--
-- Name: idx_date_sent; Type: INDEX; Schema: public; Owner: nightreport
--

CREATE INDEX idx_date_sent ON public.nightreport USING btree (date_sent);


--
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: nightreport
--

CREATE INDEX idx_user_id ON public.nightreport USING btree (user_id);


--
-- Name: nightreport nightreport_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nightreport
--

ALTER TABLE ONLY public.nightreport
    ADD CONSTRAINT nightreport_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.nightreport(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: TABLE alembic_version; Type: ACL; Schema: public; Owner: nightreport
--

GRANT SELECT ON TABLE public.alembic_version TO usdf;


--
-- Name: TABLE nightreport; Type: ACL; Schema: public; Owner: nightreport
--

GRANT SELECT ON TABLE public.nightreport TO usdf;


--
-- PostgreSQL database dump complete
--

