--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: narrativelog
--

DROP TABLE IF EXISTS public.alembic_version;
CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO narrativelog;

--
-- Name: jira_fields; Type: TABLE; Schema: public; Owner: narrativelog
--
DROP TABLE IF EXISTS public.jira_fields;
CREATE TABLE public.jira_fields (
    id uuid NOT NULL,
    components text[],
    primary_software_components text[],
    primary_hardware_components text[],
    message_id uuid NOT NULL
);


ALTER TABLE public.jira_fields OWNER TO narrativelog;

--
-- Name: message; Type: TABLE; Schema: public; Owner: narrativelog
--

DROP TABLE IF EXISTS public.message;
CREATE TABLE public.message (
    id uuid NOT NULL,
    site_id character varying(16),
    message_text text NOT NULL,
    level integer NOT NULL,
    tags text[] NOT NULL,
    urls text[] NOT NULL,
    time_lost interval NOT NULL,
    date_begin timestamp without time zone,
    user_id character varying NOT NULL,
    user_agent character varying NOT NULL,
    is_human boolean NOT NULL,
    is_valid boolean GENERATED ALWAYS AS ((date_invalidated IS NULL)) STORED NOT NULL,
    date_added timestamp without time zone NOT NULL,
    date_invalidated timestamp without time zone,
    parent_id uuid,
    systems text[],
    subsystems text[],
    cscs text[],
    date_end timestamp without time zone,
    category character varying(50),
    time_lost_type character varying(50)
);


ALTER TABLE public.message OWNER TO narrativelog;

--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: narrativelog
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: jira_fields jira_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: narrativelog
--

ALTER TABLE ONLY public.jira_fields
    ADD CONSTRAINT jira_fields_pkey PRIMARY KEY (id);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: narrativelog
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: idx_date_added; Type: INDEX; Schema: public; Owner: narrativelog
--

CREATE INDEX idx_date_added ON public.message USING btree (date_added);


--
-- Name: idx_is_valid; Type: INDEX; Schema: public; Owner: narrativelog
--

CREATE INDEX idx_is_valid ON public.message USING btree (is_valid);


--
-- Name: idx_level; Type: INDEX; Schema: public; Owner: narrativelog
--

CREATE INDEX idx_level ON public.message USING btree (level);


--
-- Name: idx_tags; Type: INDEX; Schema: public; Owner: narrativelog
--

CREATE INDEX idx_tags ON public.message USING btree (tags);


--
-- Name: idx_time_lost; Type: INDEX; Schema: public; Owner: narrativelog
--

CREATE INDEX idx_time_lost ON public.message USING btree (time_lost);


--
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: narrativelog
--

CREATE INDEX idx_user_id ON public.message USING btree (user_id);


--
-- Name: jira_fields jira_fields_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: narrativelog
--

ALTER TABLE ONLY public.jira_fields
    ADD CONSTRAINT jira_fields_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.message(id);


--
-- Name: message message_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: narrativelog
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.message(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT USAGE ON SCHEMA public TO usdf;


--
-- Name: TABLE alembic_version; Type: ACL; Schema: public; Owner: narrativelog
--

GRANT SELECT ON TABLE public.alembic_version TO usdf;


--
-- Name: TABLE jira_fields; Type: ACL; Schema: public; Owner: narrativelog
--

GRANT SELECT ON TABLE public.jira_fields TO usdf;


--
-- Name: TABLE message; Type: ACL; Schema: public; Owner: narrativelog
--

GRANT SELECT ON TABLE public.message TO usdf;


--
-- PostgreSQL database dump complete
--