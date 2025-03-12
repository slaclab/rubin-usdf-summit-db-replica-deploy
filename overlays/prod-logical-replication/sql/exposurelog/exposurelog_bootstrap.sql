DROP TABLE IF EXISTS public.message;

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