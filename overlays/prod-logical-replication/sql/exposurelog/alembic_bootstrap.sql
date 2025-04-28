--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: exposurelog
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
ALTER TABLE public.alembic_version OWNER TO exposurelog;
