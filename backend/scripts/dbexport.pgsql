--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: app; Type: SCHEMA; Schema: -; Owner: okcapplicant
--

CREATE SCHEMA app;


ALTER SCHEMA app OWNER TO okcapplicant;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: box_score; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.box_score (
    id integer NOT NULL,
    date date NOT NULL,
    "isStarter" boolean NOT NULL,
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    minutes integer NOT NULL,
    points integer NOT NULL,
    assists integer NOT NULL,
    "offensiveRebounds" integer NOT NULL,
    "defensiveRebounds" integer NOT NULL,
    steals integer NOT NULL,
    blocks integer NOT NULL,
    turnovers integer NOT NULL,
    "defensiveFouls" integer NOT NULL,
    "offensiveFouls" integer NOT NULL,
    "freeThrowsMade" integer NOT NULL,
    "freeThrowsAttempted" integer NOT NULL,
    "twoPointersMade" integer NOT NULL,
    "twoPointersAttempted" integer NOT NULL,
    "threePointersMade" integer NOT NULL,
    "threePointersAttempted" integer NOT NULL,
    player_name text
);


ALTER TABLE app.box_score OWNER TO okcapplicant;

--
-- Name: app_player; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.app_player (
    poster text
)
INHERITS (app.box_score);


ALTER TABLE app.app_player OWNER TO okcapplicant;

--
-- Name: shots; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.shots (
    id integer NOT NULL,
    player_id integer NOT NULL,
    game_id integer NOT NULL,
    "isMake" boolean NOT NULL,
    "locationX" numeric NOT NULL,
    "locationY" numeric NOT NULL,
    date date NOT NULL
);


ALTER TABLE app.shots OWNER TO okcapplicant;

--
-- Name: app_shots; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.app_shots (
)
INHERITS (app.shots);


ALTER TABLE app.app_shots OWNER TO okcapplicant;

--
-- Name: auth_group; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE app.auth_group OWNER TO okcapplicant;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: app; Owner: okcapplicant
--

CREATE SEQUENCE app.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.auth_group_id_seq OWNER TO okcapplicant;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: okcapplicant
--

ALTER SEQUENCE app.auth_group_id_seq OWNED BY app.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE app.auth_group_permissions OWNER TO okcapplicant;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: app; Owner: okcapplicant
--

CREATE SEQUENCE app.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.auth_group_permissions_id_seq OWNER TO okcapplicant;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: okcapplicant
--

ALTER SEQUENCE app.auth_group_permissions_id_seq OWNED BY app.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE app.auth_permission OWNER TO okcapplicant;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: app; Owner: okcapplicant
--

CREATE SEQUENCE app.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.auth_permission_id_seq OWNER TO okcapplicant;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: okcapplicant
--

ALTER SEQUENCE app.auth_permission_id_seq OWNED BY app.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE app.auth_user OWNER TO okcapplicant;

--
-- Name: auth_user_groups; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE app.auth_user_groups OWNER TO okcapplicant;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: app; Owner: okcapplicant
--

CREATE SEQUENCE app.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.auth_user_groups_id_seq OWNER TO okcapplicant;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: okcapplicant
--

ALTER SEQUENCE app.auth_user_groups_id_seq OWNED BY app.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: app; Owner: okcapplicant
--

CREATE SEQUENCE app.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.auth_user_id_seq OWNER TO okcapplicant;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: okcapplicant
--

ALTER SEQUENCE app.auth_user_id_seq OWNED BY app.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE app.auth_user_user_permissions OWNER TO okcapplicant;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: app; Owner: okcapplicant
--

CREATE SEQUENCE app.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.auth_user_user_permissions_id_seq OWNER TO okcapplicant;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: okcapplicant
--

ALTER SEQUENCE app.auth_user_user_permissions_id_seq OWNED BY app.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE app.django_admin_log OWNER TO okcapplicant;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: app; Owner: okcapplicant
--

CREATE SEQUENCE app.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.django_admin_log_id_seq OWNER TO okcapplicant;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: okcapplicant
--

ALTER SEQUENCE app.django_admin_log_id_seq OWNED BY app.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE app.django_content_type OWNER TO okcapplicant;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: app; Owner: okcapplicant
--

CREATE SEQUENCE app.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.django_content_type_id_seq OWNER TO okcapplicant;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: okcapplicant
--

ALTER SEQUENCE app.django_content_type_id_seq OWNED BY app.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE app.django_migrations OWNER TO okcapplicant;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: app; Owner: okcapplicant
--

CREATE SEQUENCE app.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app.django_migrations_id_seq OWNER TO okcapplicant;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: okcapplicant
--

ALTER SEQUENCE app.django_migrations_id_seq OWNED BY app.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE app.django_session OWNER TO okcapplicant;

--
-- Name: games; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.games (
    id integer NOT NULL,
    date date NOT NULL,
    "homeTeam" integer NOT NULL,
    "awayTeam" integer NOT NULL
);


ALTER TABLE app.games OWNER TO okcapplicant;

--
-- Name: players; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.players (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE app.players OWNER TO okcapplicant;

--
-- Name: teams; Type: TABLE; Schema: app; Owner: okcapplicant
--

CREATE TABLE app.teams (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE app.teams OWNER TO okcapplicant;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO okcapplicant;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: okcapplicant
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO okcapplicant;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: okcapplicant
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO okcapplicant;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: okcapplicant
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO okcapplicant;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: okcapplicant
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO okcapplicant;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: okcapplicant
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO okcapplicant;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: okcapplicant
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO okcapplicant;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO okcapplicant;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: okcapplicant
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO okcapplicant;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: okcapplicant
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: okcapplicant
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO okcapplicant;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: okcapplicant
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO okcapplicant;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: okcapplicant
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO okcapplicant;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: okcapplicant
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO okcapplicant;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: okcapplicant
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO okcapplicant;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: okcapplicant
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO okcapplicant;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: okcapplicant
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO okcapplicant;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: okcapplicant
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO okcapplicant;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: okcapplicant
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO okcapplicant;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: okcapplicant
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: okcapplicant
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO okcapplicant;

--
-- Name: auth_group id; Type: DEFAULT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_group ALTER COLUMN id SET DEFAULT nextval('app.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('app.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_permission ALTER COLUMN id SET DEFAULT nextval('app.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user ALTER COLUMN id SET DEFAULT nextval('app.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('app.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('app.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_admin_log ALTER COLUMN id SET DEFAULT nextval('app.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_content_type ALTER COLUMN id SET DEFAULT nextval('app.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_migrations ALTER COLUMN id SET DEFAULT nextval('app.django_migrations_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: app_player; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.app_player (id, date, "isStarter", game_id, player_id, minutes, points, assists, "offensiveRebounds", "defensiveRebounds", steals, blocks, turnovers, "defensiveFouls", "offensiveFouls", "freeThrowsMade", "freeThrowsAttempted", "twoPointersMade", "twoPointersAttempted", "threePointersMade", "threePointersAttempted", player_name, poster) FROM stdin;
4	2022-12-19	t	1	20	31	13	0	2	1	1	0	2	4	1	7	8	3	6	0	2	Monstar 4	assets/posters/monstars.jpg
56	2022-12-21	t	2	8	29	12	4	0	1	1	1	3	3	2	0	0	0	2	4	9	Porky Pig	assets/posters/porky-pig.jpg
52	2022-12-21	t	2	1	36	16	8	0	2	2	0	4	2	0	2	2	4	8	2	11	Michael Jordan	assets/posters/m-jordan.png
30	2023-02-10	t	3	8	36	11	6	1	2	1	0	2	2	0	4	4	2	6	1	8	Porky Pig	assets/posters/porky-pig.jpg
47	2022-12-19	t	1	8	34	19	1	0	4	1	0	2	5	0	0	0	2	6	5	10	Porky Pig	assets/posters/porky-pig.jpg
25	2023-02-10	t	3	1	35	38	9	1	1	1	0	6	2	1	12	13	4	5	6	13	Michael Jordan	assets/posters/m-jordan.png
43	2022-12-19	t	1	1	38	28	6	0	3	1	0	4	4	0	4	4	3	5	6	12	Michael Jordan	assets/posters/m-jordan.png
19	2022-12-21	t	2	20	38	14	3	0	3	1	1	3	2	0	2	2	3	5	2	6	Monstar 4	assets/posters/monstars.jpg
70	2023-02-10	f	3	20	20	18	1	1	0	1	1	0	5	0	3	5	3	3	3	3	Monstar 4	assets/posters/monstars.jpg
5	2022-12-19	t	1	21	23	8	3	3	3	0	1	2	2	0	2	4	3	5	0	4	Monstar 5	assets/posters/monstars.jpg
81	2023-03-26	t	4	20	28	6	1	3	3	2	0	2	4	0	2	2	2	8	0	6	Monstar 4	assets/posters/monstars.jpg
77	2023-03-26	t	4	18	35	31	3	2	0	4	0	3	1	0	13	15	9	16	0	1	Monstar 2	assets/posters/monstars.jpg
73	2023-03-26	f	4	24	13	5	0	0	1	1	0	0	2	0	0	0	1	3	1	1	Monstar 8	assets/posters/monstars.jpg
32	2023-03-26	t	4	14	10	6	0	0	2	0	0	2	0	0	0	1	3	3	0	1	Tasmanian Devil	assets/posters/tasmania-devil.jpg
50	2022-12-19	f	1	14	14	3	4	0	2	0	0	4	2	3	1	2	1	2	0	1	Tasmanian Devil	assets/posters/tasmania-devil.jpg
51	2022-12-21	f	2	14	18	8	1	2	5	1	0	1	2	1	0	0	4	5	0	0	Tasmanian Devil	assets/posters/tasmania-devil.jpg
59	2022-12-21	f	2	15	19	8	0	0	1	0	0	0	0	0	0	0	1	2	2	3	Foghorn Leghorn	assets/posters/leghorn.png
22	2023-02-10	f	3	14	16	4	3	1	1	0	0	0	5	0	0	0	2	2	0	0	Tasmanian Devil	assets/posters/tasmania-devil.jpg
74	2023-03-26	f	4	25	14	5	2	1	1	0	0	0	3	0	0	0	1	2	1	4	Monstar 9	assets/posters/monstars.jpg
78	2023-03-26	t	4	26	35	17	6	1	10	1	2	2	0	0	0	1	4	7	3	5	Monstar 10	assets/posters/monstars.jpg
20	2022-12-21	t	2	21	19	6	2	1	2	2	0	1	1	0	2	2	2	5	0	2	Monstar 5	assets/posters/monstars.jpg
27	2023-02-10	f	3	15	28	13	3	1	2	1	2	0	0	0	0	0	2	4	3	4	Foghorn Leghorn	assets/posters/leghorn.png
40	2023-03-26	t	4	15	35	29	3	0	5	0	0	5	3	0	8	11	6	8	3	5	Foghorn Leghorn	assets/posters/leghorn.png
42	2022-12-19	f	1	15	10	6	0	1	2	0	0	0	0	0	2	2	2	3	0	1	Foghorn Leghorn	assets/posters/leghorn.png
60	2022-12-21	t	2	2	35	17	4	0	5	0	1	2	2	0	1	3	5	10	2	4	Tweety	assets/posters/tweety.png
28	2023-02-10	t	3	2	36	23	2	0	4	0	1	4	5	0	5	5	6	8	2	5	Tweety	assets/posters/tweety.png
44	2022-12-19	t	1	2	41	26	3	3	5	2	0	4	0	2	5	7	9	13	1	5	Tweety	assets/posters/tweety.png
34	2023-03-26	f	4	11	31	28	0	2	4	0	0	2	4	1	3	3	8	15	3	6	Wile E. Coyote	assets/posters/will-coyote.jpg
11	2022-12-21	f	2	22	17	6	1	0	2	1	0	0	2	0	0	0	0	1	2	4	Monstar 6	assets/posters/monstars.jpg
6	2022-12-19	f	1	22	23	11	1	0	3	1	0	0	1	0	0	0	1	1	3	6	Monstar 6	assets/posters/monstars.jpg
61	2023-02-10	f	3	22	23	12	3	0	3	0	0	1	1	0	0	0	0	1	4	4	Monstar 6	assets/posters/monstars.jpg
24	2023-02-10	f	3	11	24	8	1	2	3	0	1	3	2	1	2	2	0	0	2	4	Wile E. Coyote	assets/posters/will-coyote.jpg
76	2023-03-26	f	4	22	28	20	5	2	5	2	0	0	2	0	5	5	0	2	5	10	Monstar 6	assets/posters/monstars.jpg
63	2023-02-10	f	3	25	20	9	3	1	0	1	1	2	0	0	1	1	1	4	2	4	Monstar 9	assets/posters/monstars.jpg
13	2022-12-21	t	2	26	30	13	6	2	4	1	0	3	0	0	1	2	6	8	0	0	Monstar 10	assets/posters/monstars.jpg
68	2023-02-10	t	3	26	28	19	7	3	3	0	0	0	4	0	3	3	5	12	2	3	Monstar 10	assets/posters/monstars.jpg
14	2022-12-21	f	2	27	9	0	0	1	2	0	0	1	0	1	0	0	0	4	0	0	Monstar 11	assets/posters/monstars.jpg
79	2023-03-26	t	4	29	37	23	4	1	4	2	0	1	1	0	3	3	7	12	2	2	Monstar 13	assets/posters/monstars.jpg
10	2022-12-19	t	1	29	33	13	4	2	5	1	1	1	2	0	2	3	4	10	1	2	Monstar 13	assets/posters/monstars.jpg
9	2022-12-19	f	1	28	12	6	1	1	5	0	0	1	2	0	2	3	2	2	0	2	Monstar 12	assets/posters/monstars.jpg
7	2022-12-19	f	1	23	10	1	1	0	1	0	0	0	1	0	1	1	0	0	0	3	Monstar 7	assets/posters/monstars.jpg
12	2022-12-21	f	2	23	6	3	1	1	0	0	0	0	0	0	0	0	0	0	1	1	Monstar 7	assets/posters/monstars.jpg
65	2023-02-10	f	3	23	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	Monstar 7	assets/posters/monstars.jpg
69	2023-02-10	t	3	29	32	13	6	1	3	3	0	1	2	1	5	5	4	9	0	1	Monstar 13	assets/posters/monstars.jpg
62	2023-02-10	f	3	30	18	11	1	1	1	0	0	0	3	0	2	2	3	3	1	2	Monstar 14	assets/posters/monstars.jpg
75	2023-03-26	f	4	27	7	0	0	0	1	0	0	1	1	1	0	0	0	1	0	1	Monstar 11	assets/posters/monstars.jpg
8	2022-12-19	t	1	27	25	12	1	2	2	1	0	0	2	0	4	4	4	6	0	3	Monstar 11	assets/posters/monstars.jpg
64	2023-02-10	t	3	27	20	2	1	2	2	0	0	1	4	1	0	0	1	4	0	1	Monstar 11	assets/posters/monstars.jpg
21	2022-12-21	f	2	28	3	2	0	0	1	0	0	1	0	0	0	0	1	1	0	1	Monstar 12	assets/posters/monstars.jpg
67	2023-02-10	f	3	28	7	2	0	1	1	0	0	1	1	1	0	0	1	2	0	0	Monstar 12	assets/posters/monstars.jpg
15	2022-12-21	t	2	29	30	15	1	0	4	0	0	3	2	0	4	4	4	5	1	3	Monstar 13	assets/posters/monstars.jpg
80	2023-03-26	t	4	30	26	7	2	2	4	0	0	1	3	0	1	2	3	5	0	3	Monstar 14	assets/posters/monstars.jpg
72	2023-03-26	f	4	31	12	4	0	1	0	1	0	1	1	0	0	0	2	3	0	2	Monstar 15	assets/posters/monstars.jpg
53	2022-12-21	t	2	3	22	12	4	1	5	1	0	1	1	0	1	2	4	5	1	2	Bugs Bunny	assets/posters/bugs-bunny.jfif
45	2022-12-19	f	1	4	22	8	2	4	2	1	0	2	4	1	0	0	4	6	0	1	Daffy Duck	assets/posters/daffy.webp
54	2022-12-21	f	2	4	15	3	2	1	1	0	1	0	0	0	0	0	0	2	1	3	Daffy Duck	assets/posters/daffy.webp
46	2022-12-19	t	1	6	32	13	6	2	6	0	0	0	2	0	4	4	3	6	1	2	Yosemite Sam	assets/posters/yosemite-sam.png
55	2022-12-21	t	2	6	34	13	2	1	4	1	0	5	3	2	2	2	4	4	1	3	Yosemite Sam	assets/posters/yosemite-sam.png
26	2023-02-10	f	3	16	13	10	1	1	2	0	0	1	1	1	0	0	5	6	0	1	Elmer Fudd	assets/posters/elmer-fudd.jpg
41	2023-03-26	t	4	12	32	8	1	0	4	2	0	1	2	1	0	0	1	4	2	4	Bill Murray	assets/posters/bill-murray.png
3	2022-12-19	f	1	19	28	12	2	1	3	2	0	2	2	1	0	0	3	4	2	3	Monstar 3	assets/posters/monstars.jpg
2	2022-12-19	t	1	18	35	35	6	0	2	1	2	2	2	0	14	14	9	23	1	1	Monstar 2	assets/posters/monstars.jpg
36	2023-03-26	f	4	7	15	11	0	1	4	0	0	0	3	0	0	0	1	3	3	6	Road Runner	assets/posters/road-runner.jpg
17	2022-12-21	t	2	18	35	27	3	0	6	2	1	5	1	2	11	13	8	16	0	3	Monstar 2	assets/posters/monstars.jpg
66	2023-02-10	t	3	18	39	44	7	0	3	2	1	4	1	0	18	19	13	15	0	1	Monstar 2	assets/posters/monstars.jpg
31	2023-02-10	f	3	13	1	2	0	0	0	0	0	0	1	0	0	0	1	1	0	0	Barnyard Dawg	assets/posters/barnyard-dawg.jpg
37	2023-03-26	t	4	5	26	3	5	0	2	0	0	1	2	0	0	0	0	1	1	5	Sniffles	assets/posters/sniffles.png
23	2023-02-10	t	3	10	17	11	2	0	2	0	0	0	3	0	1	1	2	2	2	5	Lola Bunny	assets/posters/lola-bunny.webp
39	2023-03-26	f	4	10	19	4	0	0	0	1	0	1	1	0	2	2	1	4	0	0	Lola Bunny	assets/posters/lola-bunny.webp
16	2022-12-21	f	2	17	20	6	0	0	1	0	1	0	5	0	0	0	0	2	2	3	Monstar 1	assets/posters/monstars.jpg
1	2022-12-19	f	1	17	16	12	1	0	3	0	1	0	1	0	0	0	0	0	4	5	Monstar 1	assets/posters/monstars.jpg
18	2022-12-21	f	2	19	26	9	2	4	3	2	0	1	0	0	1	2	4	6	0	1	Monstar 3	assets/posters/monstars.jpg
71	2023-02-10	t	3	19	26	8	0	0	3	2	0	0	2	0	0	0	4	6	0	3	Monstar 3	assets/posters/monstars.jpg
35	2023-03-26	f	4	13	21	14	5	1	0	0	0	3	1	0	4	6	2	5	2	4	Barnyard Dawg	assets/posters/barnyard-dawg.jpg
49	2022-12-19	f	1	13	13	9	1	2	2	0	0	0	1	0	0	0	0	6	3	5	Barnyard Dawg	assets/posters/barnyard-dawg.jpg
58	2022-12-21	f	2	13	7	3	1	0	0	0	1	1	2	0	0	0	0	0	1	1	Barnyard Dawg	assets/posters/barnyard-dawg.jpg
29	2023-02-10	t	3	9	28	9	2	2	6	0	1	2	2	1	5	6	2	2	0	0	Sylvester	assets/posters/sylvester.jpg
38	2023-03-26	t	4	9	32	7	4	2	8	1	6	3	1	1	1	2	3	6	0	0	Sylvester	assets/posters/sylvester.jpg
48	2022-12-19	t	1	9	31	9	3	2	5	0	2	0	4	0	1	2	4	4	0	0	Sylvester	assets/posters/sylvester.jpg
57	2022-12-21	f	2	9	19	6	3	4	3	3	1	1	2	0	0	0	3	5	0	0	Sylvester	assets/posters/sylvester.jpg
33	2023-03-26	f	4	16	14	2	0	2	0	1	1	0	2	0	2	2	0	1	0	1	Elmer Fudd	assets/posters/elmer-fudd.jpg
\.


--
-- Data for Name: app_shots; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.app_shots (id, player_id, game_id, "isMake", "locationX", "locationY", date) FROM stdin;
5	17	1	t	16.3	23.8	2022-12-19
1	17	1	t	0.2	25.1	2022-12-19
6	18	1	f	-0.2	-0.9	2022-12-19
2	17	1	t	-7.7	26.1	2022-12-19
4	17	1	t	-7.8	23.5	2022-12-19
3	17	1	f	15.8	24.5	2022-12-19
7	18	1	f	-0.6	0.5	2022-12-19
11	18	1	t	-7	13.8	2022-12-19
12	18	1	t	-6.2	5.9	2022-12-19
13	18	1	f	0.9	2	2022-12-19
14	18	1	f	-2	1.1	2022-12-19
15	18	1	t	0.7	12.7	2022-12-19
16	18	1	t	-18.1	18	2022-12-19
17	18	1	f	-1.3	0.8	2022-12-19
18	18	1	f	-6.6	2	2022-12-19
19	18	1	t	1.2	10.3	2022-12-19
20	18	1	t	-1	13.6	2022-12-19
21	18	1	t	0.1	2.2	2022-12-19
22	18	1	f	0.2	0.8	2022-12-19
23	18	1	f	-6.2	13	2022-12-19
24	18	1	f	-14.1	10.3	2022-12-19
25	18	1	f	-6.5	13.8	2022-12-19
26	18	1	t	0.1	2.4	2022-12-19
27	18	1	t	1	-0.3	2022-12-19
8	18	1	t	-14.3	0.4	2022-12-19
9	18	1	f	-5.9	13.8	2022-12-19
28	18	1	f	8.7	14	2022-12-19
29	18	1	f	7.1	4	2022-12-19
30	19	1	f	-14.3	25.3	2022-12-19
31	19	1	t	0	0	2022-12-19
32	19	1	t	0.4	4.7	2022-12-19
33	19	1	t	13.5	22.5	2022-12-19
34	19	1	f	0.6	0.4	2022-12-19
35	19	1	t	6.9	13.5	2022-12-19
36	19	1	t	23.2	0.8	2022-12-19
37	20	1	f	1.8	24.6	2022-12-19
38	20	1	t	-1	0.2	2022-12-19
39	20	1	t	0.7	-0.7	2022-12-19
40	20	1	f	-2.7	1.1	2022-12-19
41	20	1	t	0.6	5.4	2022-12-19
42	20	1	f	23.5	9.7	2022-12-19
43	20	1	f	3.4	0.9	2022-12-19
44	20	1	f	0	-0.9	2022-12-19
45	21	1	t	-1.6	0.7	2022-12-19
46	21	1	f	13.5	25	2022-12-19
47	21	1	t	0.1	1.2	2022-12-19
48	21	1	t	0	0	2022-12-19
49	21	1	f	0	0	2022-12-19
50	21	1	f	-23	-1	2022-12-19
51	21	1	f	-23.3	4.6	2022-12-19
52	21	1	f	4	1.8	2022-12-19
53	21	1	f	-11.9	22	2022-12-19
54	22	1	f	-18.3	20	2022-12-19
55	22	1	t	-22.8	-1.2	2022-12-19
56	22	1	f	14.5	21	2022-12-19
57	22	1	f	-14.1	21	2022-12-19
58	22	1	t	-20.5	17	2022-12-19
59	22	1	t	-0.7	0.3	2022-12-19
60	22	1	t	1.6	24.6	2022-12-19
61	23	1	f	-22.8	-1.7	2022-12-19
62	23	1	f	22.7	3.3	2022-12-19
63	23	1	f	16.7	24.3	2022-12-19
64	27	1	t	0	1.9	2022-12-19
65	27	1	t	1.5	0.9	2022-12-19
66	27	1	f	-22.9	-1.6	2022-12-19
67	27	1	t	-1.6	0.8	2022-12-19
68	27	1	f	-1.3	3.3	2022-12-19
69	27	1	f	-22.5	12	2022-12-19
70	27	1	f	23.3	1.4	2022-12-19
71	27	1	t	1.5	-0.7	2022-12-19
72	27	1	f	-7	0.9	2022-12-19
73	28	1	f	-22.5	3.2	2022-12-19
74	28	1	f	18.5	19.2	2022-12-19
75	28	1	t	1.5	-0.3	2022-12-19
76	28	1	t	-0.6	2.5	2022-12-19
77	29	1	t	0.5	1.4	2022-12-19
78	29	1	f	-0.9	0.9	2022-12-19
79	29	1	f	-6.7	14.7	2022-12-19
80	29	1	f	-1.6	5.6	2022-12-19
81	29	1	f	8.1	20.9	2022-12-19
82	29	1	t	0	0	2022-12-19
83	29	1	f	0	0	2022-12-19
84	29	1	t	1	1.9	2022-12-19
85	29	1	f	-18.9	16.6	2022-12-19
86	29	1	t	0	0	2022-12-19
87	29	1	f	-1.6	0.8	2022-12-19
88	29	1	t	7.7	23.8	2022-12-19
89	22	2	f	-17	22	2022-12-21
90	22	2	f	2.2	1.5	2022-12-21
91	22	2	f	-17	22.4	2022-12-21
92	22	2	t	-8.1	26	2022-12-21
93	22	2	t	-8.5	25.5	2022-12-21
94	23	2	t	21	13.1	2022-12-21
95	26	2	f	-2.8	11.9	2022-12-21
96	26	2	t	-6.1	4.3	2022-12-21
97	26	2	t	-0.6	6.2	2022-12-21
98	26	2	f	3.6	5	2022-12-21
99	26	2	t	1	6	2022-12-21
100	26	2	t	-6.9	1.3	2022-12-21
101	26	2	t	-1.3	0.9	2022-12-21
102	26	2	t	-2.1	0.7	2022-12-21
103	27	2	f	4.5	0.8	2022-12-21
104	27	2	f	4.5	11	2022-12-21
105	27	2	f	-6	0.3	2022-12-21
106	27	2	f	-3.2	0.2	2022-12-21
107	29	2	f	-23.9	0.9	2022-12-21
108	29	2	t	-1.3	2	2022-12-21
109	29	2	t	-2.3	1.5	2022-12-21
110	29	2	f	-4.2	2.4	2022-12-21
111	29	2	t	-3.8	5.8	2022-12-21
112	29	2	t	-19.5	17.6	2022-12-21
113	29	2	t	3.6	3.3	2022-12-21
114	29	2	f	16.1	20.3	2022-12-21
115	17	2	f	-17.6	0.1	2022-12-21
116	17	2	t	5.6	25.8	2022-12-21
117	17	2	f	23.7	-0.4	2022-12-21
118	17	2	f	-18.4	12	2022-12-21
119	17	2	t	-22.5	-3.3	2022-12-21
120	18	2	f	4.8	27.1	2022-12-21
121	18	2	t	-1.8	2.6	2022-12-21
122	18	2	f	3.9	9.3	2022-12-21
123	18	2	f	-5.5	4.3	2022-12-21
124	18	2	f	3.4	7.1	2022-12-21
125	18	2	f	5.8	7.5	2022-12-21
126	18	2	f	3.4	2	2022-12-21
127	18	2	t	0.1	6.1	2022-12-21
128	18	2	f	2.7	3.6	2022-12-21
129	18	2	t	-3.7	16.8	2022-12-21
130	18	2	f	-4.3	1.1	2022-12-21
131	18	2	f	2	3.1	2022-12-21
132	18	2	t	7.5	12.3	2022-12-21
133	18	2	t	1.8	0.9	2022-12-21
134	18	2	t	15.3	0.5	2022-12-21
135	18	2	f	6	26.1	2022-12-21
136	18	2	t	2.7	2.4	2022-12-21
137	18	2	f	14.5	25.9	2022-12-21
139	19	2	t	0	0	2022-12-21
138	18	2	t	-2.8	1	2022-12-21
147	20	2	f	19.9	15.9	2022-12-21
156	20	2	t	-4	2.9	2022-12-21
165	28	2	f	15.4	21	2022-12-21
174	10	3	t	-1.1	-0.5	2023-02-10
183	1	3	f	2.5	1.9	2023-02-10
192	1	3	f	-11.3	26	2023-02-10
201	16	3	f	-23.3	-0.7	2023-02-10
210	15	3	f	-15.4	2.6	2023-02-10
219	2	3	f	1	-0.1	2023-02-10
228	8	3	f	-23	-0.1	2023-02-10
237	8	3	f	-15.7	22.7	2023-02-10
246	16	4	f	22.3	0.6	2023-03-26
255	11	4	f	3.9	16.9	2023-03-26
264	11	4	f	-3.7	1.3	2023-03-26
273	13	4	t	1.7	0.2	2023-03-26
282	7	4	t	23.3	-0.1	2023-03-26
291	5	4	f	-17.2	19.7	2023-03-26
300	10	4	f	10.2	1.1	2023-03-26
309	15	4	t	-22.7	12.4	2023-03-26
318	12	4	t	-16.8	19	2023-03-26
327	15	1	t	-13.6	12.5	2022-12-19
336	1	1	f	14.7	20.5	2022-12-19
345	2	1	f	22.2	12.1	2022-12-19
354	2	1	f	2.1	0.3	2022-12-19
363	4	1	f	1	-0.3	2022-12-19
372	6	1	t	6.2	8.2	2022-12-19
381	8	1	f	-19.6	16.4	2022-12-19
390	8	1	f	-10.8	12.2	2022-12-19
399	13	1	t	23.2	2	2022-12-19
408	13	1	f	-16.2	-2.2	2022-12-19
417	1	2	f	-15.7	27.9	2022-12-21
426	1	2	f	-1.1	25.7	2022-12-21
435	1	2	f	-4.2	2.7	2022-12-21
444	4	2	f	-23.2	2	2022-12-21
453	6	2	t	1.8	1.2	2022-12-21
462	8	2	t	-23.7	8.8	2022-12-21
471	13	2	t	9.9	24.5	2022-12-21
480	2	2	f	-16.5	5.5	2022-12-21
489	2	2	f	-4.7	2.6	2022-12-21
498	30	3	t	1.1	0.9	2023-02-10
507	25	3	t	17.5	23.6	2023-02-10
516	18	3	t	1	0.7	2023-02-10
525	18	3	t	-0.7	-1.2	2023-02-10
534	26	3	f	5.8	2.6	2023-02-10
543	26	3	t	1	6.2	2023-02-10
552	29	3	f	1.2	0.6	2023-02-10
561	20	3	t	-0.9	-0.1	2023-02-10
570	19	3	t	0.5	1.2	2023-02-10
580	24	4	t	-21.9	10.8	2023-03-26
590	27	4	f	-22.1	-0.2	2023-03-26
600	22	4	f	-19.5	17.8	2023-03-26
610	18	4	f	1.3	1	2023-03-26
620	26	4	f	-0.4	8.3	2023-03-26
630	26	4	t	4.8	5	2023-03-26
640	29	4	t	0	1.2	2023-03-26
650	30	4	t	-7.1	8.8	2023-03-26
660	20	4	f	1.3	8.9	2023-03-26
140	19	2	t	-2.5	12.5	2022-12-21
149	20	2	f	-5.1	4.5	2022-12-21
158	21	2	f	23.4	-1.6	2022-12-21
167	14	3	t	-0.1	1	2023-02-10
176	11	3	t	12	24.6	2023-02-10
185	1	3	t	-0.5	-0.2	2023-02-10
194	1	3	t	-14.8	22.7	2023-02-10
203	16	3	t	0.2	-0.7	2023-02-10
212	2	3	t	11.6	3.3	2023-02-10
221	2	3	t	-22.7	6.2	2023-02-10
230	8	3	f	11.9	24.1	2023-02-10
239	8	3	f	18.4	16.7	2023-02-10
248	11	4	f	-2.3	1.9	2023-03-26
257	11	4	f	-7.8	19.6	2023-03-26
266	11	4	t	0.1	0.4	2023-03-26
275	13	4	f	5.4	2.8	2023-03-26
284	7	4	f	23.2	3.4	2023-03-26
293	9	4	f	1.8	0.3	2023-03-26
302	10	4	f	-7.4	3.4	2023-03-26
311	15	4	t	1.7	0	2023-03-26
320	12	4	t	1.6	0.6	2023-03-26
329	1	1	t	1	-0.8	2022-12-19
338	1	1	t	-21.2	12.3	2022-12-19
347	2	1	f	13.5	24.3	2022-12-19
356	2	1	f	-0.6	2.6	2022-12-19
365	4	1	t	0	0	2022-12-19
374	6	1	f	-0.1	2.7	2022-12-19
383	8	1	t	-16.5	20.7	2022-12-19
392	8	1	t	21.6	14.5	2022-12-19
401	13	1	t	23	2.8	2022-12-19
410	14	1	t	0.9	5	2022-12-19
419	1	2	f	-19.6	17.4	2022-12-21
428	1	2	t	-2.6	1.3	2022-12-21
437	3	2	f	-9.3	24.5	2022-12-21
446	4	2	t	-21.6	12.4	2022-12-21
455	8	2	t	-15.9	20.9	2022-12-21
464	8	2	f	-2.1	26.7	2022-12-21
473	15	2	f	-15.2	22.3	2022-12-21
482	2	2	f	1.8	2.8	2022-12-21
491	22	3	t	8.3	25.3	2023-02-10
500	30	3	t	-6.1	12.5	2023-02-10
509	27	3	f	0.7	0.5	2023-02-10
518	18	3	t	2.7	0.9	2023-02-10
527	18	3	f	2.3	0.9	2023-02-10
536	26	3	t	-6.9	11.1	2023-02-10
545	26	3	f	-8.9	4	2023-02-10
554	29	3	f	-1.2	-0.4	2023-02-10
563	20	3	t	-0.4	0.8	2023-02-10
572	19	3	f	9.7	26.5	2023-02-10
582	24	4	t	1.7	0.6	2023-03-26
592	22	4	f	-6.7	26.1	2023-03-26
602	22	4	f	1.6	0.7	2023-03-26
612	18	4	f	1.7	0.8	2023-03-26
622	26	4	t	19	18.9	2023-03-26
632	29	4	f	0.9	-0.2	2023-03-26
642	29	4	t	-0.6	0.9	2023-03-26
652	30	4	f	0.7	1.4	2023-03-26
662	20	4	f	-16.3	21.5	2023-03-26
141	19	2	t	2	1.1	2022-12-21
150	20	2	t	-22.9	2.5	2022-12-21
159	21	2	t	0	0	2022-12-21
168	10	3	f	21.6	11.1	2023-02-10
177	11	3	f	14.3	22.6	2023-02-10
186	1	3	t	-0.7	0.2	2023-02-10
195	1	3	f	14.7	23.9	2023-02-10
204	15	3	f	1.2	1.4	2023-02-10
213	2	3	f	22.4	4.2	2023-02-10
222	2	3	t	0.1	-1.7	2023-02-10
231	8	3	t	1.1	29.7	2023-02-10
240	8	3	t	-1.1	0.8	2023-02-10
249	11	4	t	0	0	2023-03-26
258	11	4	t	-17.4	22.9	2023-03-26
267	11	4	t	-0.7	5.9	2023-03-26
276	13	4	f	-23.4	1.5	2023-03-26
285	7	4	f	-1.3	0.5	2023-03-26
294	9	4	t	0	0	2023-03-26
303	15	4	t	16.5	23.9	2023-03-26
312	15	4	t	0.6	1.5	2023-03-26
321	12	4	f	-1.6	1.2	2023-03-26
330	1	1	t	0.5	1.3	2022-12-19
339	1	1	f	-19	25	2022-12-19
348	2	1	t	23	4.4	2022-12-19
357	2	1	t	-0.4	1.1	2022-12-19
366	4	1	f	23.9	9.9	2022-12-19
375	6	1	t	1.2	1.5	2022-12-19
384	8	1	f	-15.6	21.9	2022-12-19
393	8	1	f	-0.2	2.7	2022-12-19
402	13	1	t	-22.8	-1.2	2022-12-19
411	14	1	f	-0.4	25.5	2022-12-19
420	1	2	f	-10.3	15.5	2022-12-21
429	1	2	t	11.4	26.6	2022-12-21
438	3	2	t	12.3	7.1	2022-12-21
447	4	2	f	2.9	1.4	2022-12-21
456	8	2	t	-23	1.2	2022-12-21
465	8	2	f	-24.1	7.9	2022-12-21
474	15	2	f	-14.8	14.6	2022-12-21
483	2	2	t	1.7	2.4	2022-12-21
492	22	3	t	22.8	0.5	2023-02-10
501	25	3	f	15.3	20.4	2023-02-10
510	27	3	t	-0.6	1.1	2023-02-10
519	18	3	t	-8	8.9	2023-02-10
528	18	3	t	0.2	1.3	2023-02-10
537	26	3	t	-16.8	22.7	2023-02-10
546	26	3	t	-0.4	1.4	2023-02-10
555	29	3	f	4.4	21.3	2023-02-10
564	20	3	t	-10.2	26.7	2023-02-10
573	19	3	f	1.8	0.5	2023-02-10
583	25	4	f	-17	21.5	2023-03-26
593	22	4	t	21.3	13.6	2023-03-26
603	18	4	f	-1.8	0.6	2023-03-26
613	18	4	t	-0.5	0.1	2023-03-26
623	26	4	t	-23.2	9.9	2023-03-26
633	29	4	f	0	1	2023-03-26
643	29	4	t	-1.2	5.4	2023-03-26
653	30	4	t	-0.2	0.6	2023-03-26
663	20	4	f	23.4	5.1	2023-03-26
142	19	2	f	-4.7	11.3	2022-12-21
151	20	2	f	20.6	14	2022-12-21
160	21	2	f	4.7	2.9	2022-12-21
169	10	3	f	-22.8	1.5	2023-02-10
178	11	3	t	16.3	21	2023-02-10
187	1	3	f	14.3	27.5	2023-02-10
196	1	3	t	0	0.4	2023-02-10
205	15	3	t	-0.7	1	2023-02-10
214	2	3	f	17.6	17.5	2023-02-10
223	2	3	t	0.5	12.9	2023-02-10
232	8	3	f	6.2	6.3	2023-02-10
241	13	3	t	1.3	0.5	2023-02-10
250	11	4	f	-0.5	1.5	2023-03-26
259	11	4	f	-16.7	18.9	2023-03-26
268	11	4	f	-2.3	5	2023-03-26
277	13	4	f	-23	0.5	2023-03-26
286	7	4	f	3.6	2.4	2023-03-26
295	9	4	t	-0.4	1.9	2023-03-26
304	15	4	f	12.9	9.4	2023-03-26
313	15	4	f	1.1	0.5	2023-03-26
322	12	4	f	-1.8	0.4	2023-03-26
331	1	1	f	-23	12.5	2022-12-19
340	1	1	t	-16.8	22.2	2022-12-19
349	2	1	t	-0.6	-0.2	2022-12-19
358	2	1	f	-3.8	20.6	2022-12-19
367	4	1	f	2.7	0.9	2022-12-19
376	6	1	t	1.6	2.2	2022-12-19
385	8	1	t	-16.5	19	2022-12-19
394	9	1	t	0	1.2	2022-12-19
403	13	1	f	0	0	2022-12-19
412	14	2	t	3.8	2.1	2022-12-21
421	1	2	f	3.4	0.9	2022-12-21
430	1	2	f	-16.7	27.6	2022-12-21
439	3	2	t	-2.8	6.2	2022-12-21
448	6	2	t	-2.5	1.6	2022-12-21
457	8	2	f	4.2	3.4	2022-12-21
466	9	2	t	1.2	2.1	2022-12-21
475	15	2	t	22.9	0	2022-12-21
484	2	2	f	9.3	24.9	2022-12-21
493	22	3	f	1.6	0	2023-02-10
502	25	3	f	1.7	0.3	2023-02-10
511	27	3	f	13.5	25.1	2023-02-10
520	18	3	t	-0.4	1	2023-02-10
529	18	3	t	-1.3	-0.2	2023-02-10
538	26	3	t	-0.5	2.4	2023-02-10
547	26	3	f	0	0	2023-02-10
556	29	3	t	1.1	1.7	2023-02-10
565	19	3	f	-23.5	4.6	2023-02-10
574	31	4	f	2	0.5	2023-03-26
584	25	4	f	-12.6	22.5	2023-03-26
594	22	4	f	-20.2	16.2	2023-03-26
604	18	4	t	7.2	5.9	2023-03-26
614	18	4	t	-1.1	1.2	2023-03-26
624	26	4	f	-21.8	11.9	2023-03-26
634	29	4	f	8	12.4	2023-03-26
644	29	4	f	-1.7	5.9	2023-03-26
654	20	4	f	0	0	2023-03-26
664	20	4	t	-1.3	-0.1	2023-03-26
143	19	2	t	0	0	2022-12-21
152	20	2	f	-1.5	2.4	2022-12-21
161	21	2	f	22.4	-0.4	2022-12-21
170	10	3	t	-6.6	2	2023-02-10
179	1	3	t	11.8	14.3	2023-02-10
188	1	3	t	7.8	25.6	2023-02-10
197	16	3	t	0.7	0.3	2023-02-10
206	15	3	t	-18.3	17.3	2023-02-10
215	2	3	t	21.4	1.4	2023-02-10
224	2	3	f	-13.1	4.6	2023-02-10
233	8	3	t	0.2	1.5	2023-02-10
242	14	4	f	21	13.4	2023-03-26
251	11	4	f	19.5	44	2023-03-26
260	11	4	t	-20.6	14.4	2023-03-26
269	13	4	t	12.5	23.6	2023-03-26
278	7	4	f	12.1	26.1	2023-03-26
287	5	4	f	-3.8	25.8	2023-03-26
296	9	4	f	-1.6	1.5	2023-03-26
305	15	4	t	-3.6	14.3	2023-03-26
314	15	4	t	5	4.1	2023-03-26
323	12	4	f	6.9	0.6	2023-03-26
332	1	1	t	0.7	-0.1	2022-12-19
341	1	1	t	15.2	20.5	2022-12-19
350	2	1	t	-0.1	0.8	2022-12-19
359	2	1	f	-23	1.6	2022-12-19
368	4	1	t	-0.9	1.1	2022-12-19
377	6	1	f	1.1	1.9	2022-12-19
386	8	1	t	6.2	6	2022-12-19
395	9	1	t	0	0	2022-12-19
404	13	1	f	0	5.1	2022-12-19
413	14	2	t	0	0	2022-12-21
422	1	2	f	-15.9	20.7	2022-12-21
431	1	2	t	-7	2.4	2022-12-21
440	3	2	t	0	0	2022-12-21
449	6	2	f	-22.7	-1.2	2022-12-21
458	8	2	f	-17.6	20.6	2022-12-21
467	9	2	f	-2.5	3.8	2022-12-21
476	15	2	t	-23.3	8.2	2022-12-21
485	2	2	f	0.7	5.5	2022-12-21
494	22	3	t	-16.7	24.6	2023-02-10
503	25	3	f	-5.6	3.9	2023-02-10
512	27	3	f	0	0	2023-02-10
521	18	3	f	13.1	-1.1	2023-02-10
530	18	3	t	-2.8	0.5	2023-02-10
539	26	3	f	-4.5	7.1	2023-02-10
548	26	3	f	-1	0.8	2023-02-10
557	29	3	t	0.2	0.8	2023-02-10
566	19	3	t	-1.5	-1.1	2023-02-10
575	31	4	f	-0.4	26.1	2023-03-26
585	25	4	f	-21.2	14.5	2023-03-26
595	22	4	t	-20.6	17.3	2023-03-26
605	18	4	f	-3.6	26.8	2023-03-26
615	18	4	f	-1.2	1.2	2023-03-26
625	26	4	t	-16.3	21.9	2023-03-26
635	29	4	t	-16.2	20.1	2023-03-26
645	29	4	t	-19.9	-2.2	2023-03-26
655	20	4	f	-2.7	1	2023-03-26
665	20	4	f	2.3	4	2023-03-26
144	19	2	f	22.5	12.3	2022-12-21
153	20	2	t	0	1.8	2022-12-21
162	21	2	f	-2	1.2	2022-12-21
171	10	3	t	16.3	20.3	2023-02-10
180	1	3	t	-0.1	29.3	2023-02-10
189	1	3	t	-5.8	26.1	2023-02-10
198	16	3	t	-8.8	13.5	2023-02-10
207	15	3	t	23.8	2.5	2023-02-10
216	2	3	t	0.2	-0.2	2023-02-10
225	9	3	t	5.9	3	2023-02-10
234	8	3	f	2	1.2	2023-02-10
243	14	4	t	-2.1	0.3	2023-03-26
252	11	4	t	12.9	24	2023-03-26
261	11	4	t	2	-0.1	2023-03-26
270	13	4	t	-10.8	25.1	2023-03-26
279	7	4	t	-6.9	20.4	2023-03-26
288	5	4	f	9.7	23.4	2023-03-26
297	9	4	f	-1.3	1.2	2023-03-26
306	15	4	t	0.5	21.5	2023-03-26
315	15	4	t	-6.1	3.4	2023-03-26
324	15	1	f	21.7	14.1	2022-12-19
333	1	1	f	-20.8	15	2022-12-19
342	1	1	t	-23.3	2.4	2022-12-19
351	2	1	t	0.7	-0.6	2022-12-19
360	2	1	t	0.2	1.5	2022-12-19
369	4	1	t	-1.2	2.2	2022-12-19
378	8	1	f	-1.8	26	2022-12-19
387	8	1	t	-18.1	17.6	2022-12-19
396	9	1	t	-0.5	1.9	2022-12-19
405	13	1	f	17.3	18.4	2022-12-19
414	14	2	t	0	0	2022-12-21
423	1	2	f	-18.9	19.2	2022-12-21
432	1	2	t	0.5	28.5	2022-12-21
441	3	2	f	-2.3	2.4	2022-12-21
450	6	2	t	1.1	1.5	2022-12-21
459	8	2	f	23	3.5	2022-12-21
468	9	2	f	9.3	-0.2	2022-12-21
477	2	2	t	2.2	1.2	2022-12-21
486	2	2	f	0	40.3	2022-12-21
495	22	3	t	-22.5	1.8	2023-02-10
504	25	3	t	0.4	-0.2	2023-02-10
513	27	3	f	2.5	1.3	2023-02-10
522	18	3	t	0.9	1.2	2023-02-10
531	18	3	t	0.5	0.7	2023-02-10
540	26	3	f	-1.6	4.4	2023-02-10
549	29	3	f	-5.1	4.2	2023-02-10
558	29	3	f	1.8	0.8	2023-02-10
567	19	3	f	-3.4	27.6	2023-02-10
576	31	4	f	-20.5	15.7	2023-03-26
586	25	4	f	-1.8	1	2023-03-26
596	22	4	t	-19	16.5	2023-03-26
606	18	4	f	-2.7	15.9	2023-03-26
616	18	4	t	-1.7	1.2	2023-03-26
626	26	4	t	0.4	1	2023-03-26
636	29	4	t	-14.7	23.9	2023-03-26
646	30	4	t	0	0	2023-03-26
656	20	4	t	-0.1	0.1	2023-03-26
666	20	4	f	-4	0.1	2023-03-26
145	19	2	f	0.6	7.3	2022-12-21
154	20	2	t	14.2	23.3	2022-12-21
163	21	2	t	3.1	3.3	2022-12-21
172	10	3	t	-21.1	16.7	2023-02-10
181	1	3	f	16.1	22.4	2023-02-10
190	1	3	f	-14.6	24.4	2023-02-10
199	16	3	t	-9.9	-1	2023-02-10
208	15	3	t	-17.5	19.4	2023-02-10
217	2	3	t	20.8	16.6	2023-02-10
226	9	3	t	1	0.9	2023-02-10
235	8	3	f	-15.8	23.3	2023-02-10
244	14	4	t	7.1	0.4	2023-03-26
253	11	4	f	16.9	22.4	2023-03-26
262	11	4	t	0	3.6	2023-03-26
271	13	4	f	-1.3	0.7	2023-03-26
280	7	4	t	-18.8	18.3	2023-03-26
289	5	4	f	16.9	20.4	2023-03-26
298	9	4	t	1.6	1.2	2023-03-26
307	15	4	t	-23.5	9.5	2023-03-26
316	12	4	f	18.3	15.8	2023-03-26
325	15	1	t	0	0	2022-12-19
334	1	1	f	6.1	7.6	2022-12-19
343	1	1	f	0.9	0.8	2022-12-19
352	2	1	t	7	16	2022-12-19
361	2	1	t	0.4	1.4	2022-12-19
370	6	1	f	6.2	7.2	2022-12-19
379	8	1	t	-6	9.2	2022-12-19
388	8	1	f	-21.6	14.1	2022-12-19
397	9	1	t	-6.2	2	2022-12-19
406	13	1	f	0.2	0.4	2022-12-19
415	14	2	f	-1.5	9.9	2022-12-21
424	1	2	f	16.8	22.5	2022-12-21
433	1	2	t	5.5	1.2	2022-12-21
442	3	2	t	0.9	4.1	2022-12-21
451	6	2	t	1.8	3.6	2022-12-21
460	8	2	f	-17.4	18.3	2022-12-21
469	9	2	t	1	2	2022-12-21
478	2	2	t	-1.6	2	2022-12-21
487	2	2	t	-3.8	4.2	2022-12-21
496	30	3	t	0.6	-0.5	2023-02-10
505	25	3	f	0	0	2023-02-10
514	23	3	f	-13.7	24.3	2023-02-10
523	18	3	t	-1	0	2023-02-10
532	28	3	t	-1.1	1.3	2023-02-10
541	26	3	f	-15.6	22.5	2023-02-10
550	29	3	t	-0.2	1.2	2023-02-10
559	20	3	t	-0.5	1.9	2023-02-10
568	19	3	f	2.8	13.4	2023-02-10
577	31	4	t	1	0.3	2023-03-26
587	25	4	t	1.7	0.5	2023-03-26
597	22	4	t	-18.4	19.8	2023-03-26
607	18	4	f	15.9	2.1	2023-03-26
617	18	4	t	-0.9	1.2	2023-03-26
627	26	4	t	0.6	0.2	2023-03-26
637	29	4	t	-0.5	0.8	2023-03-26
647	30	4	f	12.1	22.2	2023-03-26
657	20	4	f	12.3	25.9	2023-03-26
667	20	4	f	-22.8	0.4	2023-03-26
146	20	2	t	1.8	0.6	2022-12-21
155	20	2	f	9.3	28.2	2022-12-21
164	28	2	t	-0.9	0.3	2022-12-21
173	10	3	f	22.4	5.1	2023-02-10
182	1	3	t	10.5	25.2	2023-02-10
191	1	3	t	-18.1	23.6	2023-02-10
200	16	3	t	0.2	-0.2	2023-02-10
209	15	3	t	-0.2	0.3	2023-02-10
218	2	3	t	0.9	0.6	2023-02-10
227	8	3	f	18.6	21.2	2023-02-10
236	8	3	f	-2	6.4	2023-02-10
245	14	4	t	0.2	4.6	2023-03-26
254	11	4	f	11	18.2	2023-03-26
263	11	4	t	1.2	1.7	2023-03-26
272	13	4	t	-1.2	-0.6	2023-03-26
281	7	4	t	-17.5	19	2023-03-26
290	5	4	f	1	21	2023-03-26
299	10	4	f	-7.2	10.5	2023-03-26
308	15	4	f	-22.6	7.9	2023-03-26
317	12	4	t	16.5	22.9	2023-03-26
326	15	1	f	0.5	1.2	2022-12-19
335	1	1	f	-15.9	23.5	2022-12-19
344	1	1	f	-15.9	25.8	2022-12-19
353	2	1	t	1	-0.2	2022-12-19
362	2	1	f	22.5	0.5	2022-12-19
371	6	1	f	22.3	4.4	2022-12-19
380	8	1	f	-16.8	19.6	2022-12-19
389	8	1	f	6.1	10.5	2022-12-19
398	13	1	f	23.2	0.9	2022-12-19
407	13	1	f	-6.2	5.3	2022-12-19
416	14	2	t	2.8	0.9	2022-12-21
425	1	2	t	-3.6	5.4	2022-12-21
434	1	2	f	-3.8	9.5	2022-12-21
443	4	2	f	-23.7	1.7	2022-12-21
452	6	2	t	-19.6	16.4	2022-12-21
461	8	2	t	13.6	23.1	2022-12-21
470	9	2	t	2.2	1.5	2022-12-21
479	2	2	t	18.4	21.3	2022-12-21
488	2	2	t	23	0.1	2022-12-21
497	30	3	f	-0.2	25	2023-02-10
506	25	3	f	-15.6	27.1	2023-02-10
515	23	3	f	-20.7	16.7	2023-02-10
524	18	3	t	-0.6	0.3	2023-02-10
533	28	3	f	0	0	2023-02-10
542	26	3	t	-2.3	-0.5	2023-02-10
551	29	3	t	1.8	0.6	2023-02-10
560	20	3	t	-23	4.1	2023-02-10
569	19	3	t	-1.1	-0.4	2023-02-10
579	24	4	f	2.7	16.7	2023-03-26
589	27	4	f	2.6	1.2	2023-03-26
599	22	4	f	-22.9	8	2023-03-26
609	18	4	t	-0.4	1.4	2023-03-26
619	18	4	t	-1.1	7.7	2023-03-26
629	26	4	f	-2	0.1	2023-03-26
639	29	4	t	0.6	0.4	2023-03-26
649	30	4	f	14.5	21	2023-03-26
659	20	4	f	9.9	24.1	2023-03-26
148	20	2	f	-16.5	22.5	2022-12-21
157	21	2	f	2.9	14.3	2022-12-21
166	14	3	t	2.1	0.7	2023-02-10
175	11	3	f	11.2	24.7	2023-02-10
184	1	3	f	-9.3	25.4	2023-02-10
193	1	3	f	23.3	1.2	2023-02-10
202	16	3	f	-0.7	0.3	2023-02-10
211	15	3	f	-17.2	19.9	2023-02-10
220	2	3	f	-23.3	2.4	2023-02-10
229	8	3	f	-22.7	11.4	2023-02-10
238	8	3	f	-0.1	9.4	2023-02-10
247	16	4	f	1.2	0.8	2023-03-26
256	11	4	t	7.7	14.7	2023-03-26
265	11	4	t	-0.6	0.9	2023-03-26
274	13	4	f	2.7	6.3	2023-03-26
283	7	4	f	22.4	1.9	2023-03-26
292	5	4	t	-17.2	19.2	2023-03-26
301	10	4	t	-0.7	0.2	2023-03-26
310	15	4	f	-21.9	13	2023-03-26
319	12	4	f	22.8	2.5	2023-03-26
328	1	1	t	-22.4	11.5	2022-12-19
337	1	1	t	16.1	33.9	2022-12-19
346	2	1	f	18	1	2022-12-19
355	2	1	t	-0.1	2.7	2022-12-19
364	4	1	t	0	0	2022-12-19
373	6	1	t	-13.1	24.8	2022-12-19
382	8	1	t	16.4	22.8	2022-12-19
391	8	1	f	6.7	13.5	2022-12-19
400	13	1	f	6.9	5.9	2022-12-19
409	14	1	f	0.9	2.1	2022-12-19
418	1	2	f	-11.6	26.7	2022-12-21
427	1	2	f	22.2	12.9	2022-12-21
436	3	2	t	-16.3	20.8	2022-12-21
445	4	2	f	-4.5	1.5	2022-12-21
454	6	2	f	-23	1.4	2022-12-21
463	8	2	f	-6.4	8.7	2022-12-21
472	15	2	t	-2.5	1.9	2022-12-21
481	2	2	t	-3.1	2.8	2022-12-21
490	2	2	f	11.8	4.7	2022-12-21
10	18	1	f	-10	11.7	2022-12-19
499	30	3	t	-23.2	7	2023-02-10
508	25	3	t	-22.9	10.2	2023-02-10
517	18	3	f	-21.7	11.2	2023-02-10
526	18	3	t	0.1	0.8	2023-02-10
535	26	3	t	-18.8	16.1	2023-02-10
544	26	3	f	3.8	3.1	2023-02-10
553	29	3	f	22.9	5.2	2023-02-10
562	20	3	t	-15.4	27.3	2023-02-10
571	19	3	t	2.6	1.3	2023-02-10
578	31	4	t	-0.7	0.3	2023-03-26
581	24	4	f	-1.2	0.4	2023-03-26
588	25	4	t	-22.3	0.4	2023-03-26
591	22	4	f	1	1.2	2023-03-26
598	22	4	f	-15.4	23.6	2023-03-26
601	22	4	t	23.7	2.1	2023-03-26
608	18	4	t	0.7	1.2	2023-03-26
611	18	4	t	-0.2	0.2	2023-03-26
618	18	4	f	0.9	2.8	2023-03-26
621	26	4	f	18.5	16.8	2023-03-26
628	26	4	f	-0.7	2.9	2023-03-26
631	26	4	t	7.4	5.7	2023-03-26
638	29	4	t	0.4	1.5	2023-03-26
641	29	4	f	-0.2	2.2	2023-03-26
648	30	4	f	20.2	15.8	2023-03-26
651	30	4	f	2.2	0.1	2023-03-26
658	20	4	f	10.4	26	2023-03-26
661	20	4	f	0.1	8.7	2023-03-26
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add player	7	add_player
26	Can change player	7	change_player
27	Can delete player	7	delete_player
28	Can view player	7	view_player
29	Can add shots	8	add_shots
30	Can change shots	8	change_shots
31	Can delete shots	8	delete_shots
32	Can view shots	8	view_shots
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: box_score; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.box_score (id, date, "isStarter", game_id, player_id, minutes, points, assists, "offensiveRebounds", "defensiveRebounds", steals, blocks, turnovers, "defensiveFouls", "offensiveFouls", "freeThrowsMade", "freeThrowsAttempted", "twoPointersMade", "twoPointersAttempted", "threePointersMade", "threePointersAttempted", player_name) FROM stdin;
2	2022-12-19	t	1	18	35	35	6	0	2	1	2	2	2	0	14	14	9	23	1	1	\N
1	2022-12-19	f	1	17	16	12	1	0	3	0	1	0	1	0	0	0	0	0	4	5	\N
4	2022-12-19	t	1	20	31	13	0	2	1	1	0	2	4	1	7	8	3	6	0	2	\N
11	2022-12-21	f	2	22	17	6	1	0	2	1	0	0	2	0	0	0	0	1	2	4	\N
12	2022-12-21	f	2	23	6	3	1	1	0	0	0	0	0	0	0	0	0	0	1	1	\N
13	2022-12-21	t	2	26	30	13	6	2	4	1	0	3	0	0	1	2	6	8	0	0	\N
14	2022-12-21	f	2	27	9	0	0	1	2	0	0	1	0	1	0	0	0	4	0	0	\N
15	2022-12-21	t	2	29	30	15	1	0	4	0	0	3	2	0	4	4	4	5	1	3	\N
16	2022-12-21	f	2	17	20	6	0	0	1	0	1	0	5	0	0	0	0	2	2	3	\N
17	2022-12-21	t	2	18	35	27	3	0	6	2	1	5	1	2	11	13	8	16	0	3	\N
18	2022-12-21	f	2	19	26	9	2	4	3	2	0	1	0	0	1	2	4	6	0	1	\N
19	2022-12-21	t	2	20	38	14	3	0	3	1	1	3	2	0	2	2	3	5	2	6	\N
20	2022-12-21	t	2	21	19	6	2	1	2	2	0	1	1	0	2	2	2	5	0	2	\N
21	2022-12-21	f	2	28	3	2	0	0	1	0	0	1	0	0	0	0	1	1	0	1	\N
22	2023-02-10	f	3	14	16	4	3	1	1	0	0	0	5	0	0	0	2	2	0	0	\N
23	2023-02-10	t	3	10	17	11	2	0	2	0	0	0	3	0	1	1	2	2	2	5	\N
5	2022-12-19	t	1	21	23	8	3	3	3	0	1	2	2	0	2	4	3	5	0	4	\N
3	2022-12-19	f	1	19	28	12	2	1	3	2	0	2	2	1	0	0	3	4	2	3	\N
24	2023-02-10	f	3	11	24	8	1	2	3	0	1	3	2	1	2	2	0	0	2	4	\N
25	2023-02-10	t	3	1	35	38	9	1	1	1	0	6	2	1	12	13	4	5	6	13	\N
26	2023-02-10	f	3	16	13	10	1	1	2	0	0	1	1	1	0	0	5	6	0	1	\N
27	2023-02-10	f	3	15	28	13	3	1	2	1	2	0	0	0	0	0	2	4	3	4	\N
28	2023-02-10	t	3	2	36	23	2	0	4	0	1	4	5	0	5	5	6	8	2	5	\N
29	2023-02-10	t	3	9	28	9	2	2	6	0	1	2	2	1	5	6	2	2	0	0	\N
30	2023-02-10	t	3	8	36	11	6	1	2	1	0	2	2	0	4	4	2	6	1	8	\N
31	2023-02-10	f	3	13	1	2	0	0	0	0	0	0	1	0	0	0	1	1	0	0	\N
32	2023-03-26	t	4	14	10	6	0	0	2	0	0	2	0	0	0	1	3	3	0	1	\N
33	2023-03-26	f	4	16	14	2	0	2	0	1	1	0	2	0	2	2	0	1	0	1	\N
34	2023-03-26	f	4	11	31	28	0	2	4	0	0	2	4	1	3	3	8	15	3	6	\N
35	2023-03-26	f	4	13	21	14	5	1	0	0	0	3	1	0	4	6	2	5	2	4	\N
36	2023-03-26	f	4	7	15	11	0	1	4	0	0	0	3	0	0	0	1	3	3	6	\N
37	2023-03-26	t	4	5	26	3	5	0	2	0	0	1	2	0	0	0	0	1	1	5	\N
38	2023-03-26	t	4	9	32	7	4	2	8	1	6	3	1	1	1	2	3	6	0	0	\N
39	2023-03-26	f	4	10	19	4	0	0	0	1	0	1	1	0	2	2	1	4	0	0	\N
40	2023-03-26	t	4	15	35	29	3	0	5	0	0	5	3	0	8	11	6	8	3	5	\N
41	2023-03-26	t	4	12	32	8	1	0	4	2	0	1	2	1	0	0	1	4	2	4	\N
42	2022-12-19	f	1	15	10	6	0	1	2	0	0	0	0	0	2	2	2	3	0	1	\N
43	2022-12-19	t	1	1	38	28	6	0	3	1	0	4	4	0	4	4	3	5	6	12	\N
44	2022-12-19	t	1	2	41	26	3	3	5	2	0	4	0	2	5	7	9	13	1	5	\N
45	2022-12-19	f	1	4	22	8	2	4	2	1	0	2	4	1	0	0	4	6	0	1	\N
46	2022-12-19	t	1	6	32	13	6	2	6	0	0	0	2	0	4	4	3	6	1	2	\N
47	2022-12-19	t	1	8	34	19	1	0	4	1	0	2	5	0	0	0	2	6	5	10	\N
48	2022-12-19	t	1	9	31	9	3	2	5	0	2	0	4	0	1	2	4	4	0	0	\N
49	2022-12-19	f	1	13	13	9	1	2	2	0	0	0	1	0	0	0	0	6	3	5	\N
50	2022-12-19	f	1	14	14	3	4	0	2	0	0	4	2	3	1	2	1	2	0	1	\N
51	2022-12-21	f	2	14	18	8	1	2	5	1	0	1	2	1	0	0	4	5	0	0	\N
52	2022-12-21	t	2	1	36	16	8	0	2	2	0	4	2	0	2	2	4	8	2	11	\N
53	2022-12-21	t	2	3	22	12	4	1	5	1	0	1	1	0	1	2	4	5	1	2	\N
54	2022-12-21	f	2	4	15	3	2	1	1	0	1	0	0	0	0	0	0	2	1	3	\N
55	2022-12-21	t	2	6	34	13	2	1	4	1	0	5	3	2	2	2	4	4	1	3	\N
56	2022-12-21	t	2	8	29	12	4	0	1	1	1	3	3	2	0	0	0	2	4	9	\N
57	2022-12-21	f	2	9	19	6	3	4	3	3	1	1	2	0	0	0	3	5	0	0	\N
58	2022-12-21	f	2	13	7	3	1	0	0	0	1	1	2	0	0	0	0	0	1	1	\N
59	2022-12-21	f	2	15	19	8	0	0	1	0	0	0	0	0	0	0	1	2	2	3	\N
60	2022-12-21	t	2	2	35	17	4	0	5	0	1	2	2	0	1	3	5	10	2	4	\N
61	2023-02-10	f	3	22	23	12	3	0	3	0	0	1	1	0	0	0	0	1	4	4	\N
62	2023-02-10	f	3	30	18	11	1	1	1	0	0	0	3	0	2	2	3	3	1	2	\N
63	2023-02-10	f	3	25	20	9	3	1	0	1	1	2	0	0	1	1	1	4	2	4	\N
64	2023-02-10	t	3	27	20	2	1	2	2	0	0	1	4	1	0	0	1	4	0	1	\N
65	2023-02-10	f	3	23	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	2	\N
66	2023-02-10	t	3	18	39	44	7	0	3	2	1	4	1	0	18	19	13	15	0	1	\N
67	2023-02-10	f	3	28	7	2	0	1	1	0	0	1	1	1	0	0	1	2	0	0	\N
68	2023-02-10	t	3	26	28	19	7	3	3	0	0	0	4	0	3	3	5	12	2	3	\N
69	2023-02-10	t	3	29	32	13	6	1	3	3	0	1	2	1	5	5	4	9	0	1	\N
70	2023-02-10	f	3	20	20	18	1	1	0	1	1	0	5	0	3	5	3	3	3	3	\N
71	2023-02-10	t	3	19	26	8	0	0	3	2	0	0	2	0	0	0	4	6	0	3	\N
76	2023-03-26	f	4	22	28	20	5	2	5	2	0	0	2	0	5	5	0	2	5	10	\N
81	2023-03-26	t	4	20	28	6	1	3	3	2	0	2	4	0	2	2	2	8	0	6	\N
72	2023-03-26	f	4	31	12	4	0	1	0	1	0	1	1	0	0	0	2	3	0	2	\N
77	2023-03-26	t	4	18	35	31	3	2	0	4	0	3	1	0	13	15	9	16	0	1	\N
73	2023-03-26	f	4	24	13	5	0	0	1	1	0	0	2	0	0	0	1	3	1	1	\N
78	2023-03-26	t	4	26	35	17	6	1	10	1	2	2	0	0	0	1	4	7	3	5	\N
74	2023-03-26	f	4	25	14	5	2	1	1	0	0	0	3	0	0	0	1	2	1	4	\N
79	2023-03-26	t	4	29	37	23	4	1	4	2	0	1	1	0	3	3	7	12	2	2	\N
75	2023-03-26	f	4	27	7	0	0	0	1	0	0	1	1	1	0	0	0	1	0	1	\N
80	2023-03-26	t	4	30	26	7	2	2	4	0	0	1	3	0	1	2	3	5	0	3	\N
7	2022-12-19	f	1	23	10	1	1	0	1	0	0	0	1	0	1	1	0	0	0	3	\N
9	2022-12-19	f	1	28	12	6	1	1	5	0	0	1	2	0	2	3	2	2	0	2	\N
6	2022-12-19	f	1	22	23	11	1	0	3	1	0	0	1	0	0	0	1	1	3	6	\N
8	2022-12-19	t	1	27	25	12	1	2	2	1	0	0	2	0	4	4	4	6	0	3	\N
10	2022-12-19	t	1	29	33	13	4	2	5	1	1	1	2	0	2	3	4	10	1	2	\N
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app	player
8	app	shots
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-08-20 03:49:43.477716+02
2	auth	0001_initial	2023-08-20 03:49:43.77941+02
3	admin	0001_initial	2023-08-20 03:49:43.843231+02
4	admin	0002_logentry_remove_auto_add	2023-08-20 03:49:43.860373+02
5	admin	0003_logentry_add_action_flag_choices	2023-08-20 03:49:43.884805+02
6	contenttypes	0002_remove_content_type_name	2023-08-20 03:49:43.930621+02
7	auth	0002_alter_permission_name_max_length	2023-08-20 03:49:43.949647+02
8	auth	0003_alter_user_email_max_length	2023-08-20 03:49:43.967167+02
9	auth	0004_alter_user_username_opts	2023-08-20 03:49:43.989688+02
10	auth	0005_alter_user_last_login_null	2023-08-20 03:49:44.017678+02
11	auth	0006_require_contenttypes_0002	2023-08-20 03:49:44.022702+02
12	auth	0007_alter_validators_add_error_messages	2023-08-20 03:49:44.042846+02
13	auth	0008_alter_user_username_max_length	2023-08-20 03:49:44.079932+02
14	auth	0009_alter_user_last_name_max_length	2023-08-20 03:49:44.100934+02
15	auth	0010_alter_group_name_max_length	2023-08-20 03:49:44.125699+02
16	auth	0011_update_proxy_permissions	2023-08-20 03:49:44.146248+02
17	auth	0012_alter_user_first_name_max_length	2023-08-20 03:49:44.166796+02
18	sessions	0001_initial	2023-08-20 03:49:44.203054+02
19	app	0001_initial	2023-08-29 19:28:28.471005+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.games (id, date, "homeTeam", "awayTeam") FROM stdin;
1	2022-12-19	1	2
2	2022-12-21	1	2
3	2023-02-10	2	1
4	2023-03-26	2	1
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.players (id, name) FROM stdin;
2	Tweety
1	Michael Jordan
3	Bugs Bunny
11	Wile E. Coyote
12	Bill Murray
13	Barnyard Dawg
14	Tasmanian Devil
15	Foghorn Leghorn
16	Elmer Fudd
17	Monstar 1
18	Monstar 2
19	Monstar 3
20	Monstar 4
21	Monstar 5
22	Monstar 6
4	Daffy Duck
23	Monstar 7
24	Monstar 8
25	Monstar 9
26	Monstar 10
27	Monstar 11
28	Monstar 12
29	Monstar 13
30	Monstar 14
31	Monstar 15
6	Yosemite Sam
8	Porky Pig
5	Sniffles
9	Sylvester
7	Road Runner
10	Lola Bunny
\.


--
-- Data for Name: shots; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.shots (id, player_id, game_id, "isMake", "locationX", "locationY", date) FROM stdin;
4	17	1	t	-7.8	23.5	2022-12-19
2	17	1	t	-7.7	26.1	2022-12-19
1	17	1	t	0.2	25.1	2022-12-19
7	18	1	f	-0.6	0.5	2022-12-19
3	17	1	f	15.8	24.5	2022-12-19
6	18	1	f	-0.2	-0.9	2022-12-19
5	17	1	t	16.3	23.8	2022-12-19
10	18	1	f	-10	11.7	2022-12-19
9	18	1	f	-5.9	13.8	2022-12-19
8	18	1	t	-14.3	0.4	2022-12-19
11	18	1	t	-7	13.8	2022-12-19
12	18	1	t	-6.2	5.9	2022-12-19
13	18	1	f	0.9	2	2022-12-19
14	18	1	f	-2	1.1	2022-12-19
15	18	1	t	0.7	12.7	2022-12-19
16	18	1	t	-18.1	18	2022-12-19
17	18	1	f	-1.3	0.8	2022-12-19
18	18	1	f	-6.6	2	2022-12-19
19	18	1	t	1.2	10.3	2022-12-19
20	18	1	t	-1	13.6	2022-12-19
21	18	1	t	0.1	2.2	2022-12-19
22	18	1	f	0.2	0.8	2022-12-19
23	18	1	f	-6.2	13	2022-12-19
24	18	1	f	-14.1	10.3	2022-12-19
25	18	1	f	-6.5	13.8	2022-12-19
26	18	1	t	0.1	2.4	2022-12-19
27	18	1	t	1	-0.3	2022-12-19
28	18	1	f	8.7	14	2022-12-19
29	18	1	f	7.1	4	2022-12-19
30	19	1	f	-14.3	25.3	2022-12-19
31	19	1	t	0	0	2022-12-19
32	19	1	t	0.4	4.7	2022-12-19
33	19	1	t	13.5	22.5	2022-12-19
34	19	1	f	0.6	0.4	2022-12-19
35	19	1	t	6.9	13.5	2022-12-19
36	19	1	t	23.2	0.8	2022-12-19
37	20	1	f	1.8	24.6	2022-12-19
38	20	1	t	-1	0.2	2022-12-19
39	20	1	t	0.7	-0.7	2022-12-19
40	20	1	f	-2.7	1.1	2022-12-19
41	20	1	t	0.6	5.4	2022-12-19
42	20	1	f	23.5	9.7	2022-12-19
43	20	1	f	3.4	0.9	2022-12-19
44	20	1	f	0	-0.9	2022-12-19
45	21	1	t	-1.6	0.7	2022-12-19
46	21	1	f	13.5	25	2022-12-19
47	21	1	t	0.1	1.2	2022-12-19
48	21	1	t	0	0	2022-12-19
49	21	1	f	0	0	2022-12-19
50	21	1	f	-23	-1	2022-12-19
51	21	1	f	-23.3	4.6	2022-12-19
52	21	1	f	4	1.8	2022-12-19
53	21	1	f	-11.9	22	2022-12-19
54	22	1	f	-18.3	20	2022-12-19
55	22	1	t	-22.8	-1.2	2022-12-19
56	22	1	f	14.5	21	2022-12-19
57	22	1	f	-14.1	21	2022-12-19
58	22	1	t	-20.5	17	2022-12-19
59	22	1	t	-0.7	0.3	2022-12-19
60	22	1	t	1.6	24.6	2022-12-19
61	23	1	f	-22.8	-1.7	2022-12-19
62	23	1	f	22.7	3.3	2022-12-19
63	23	1	f	16.7	24.3	2022-12-19
64	27	1	t	0	1.9	2022-12-19
65	27	1	t	1.5	0.9	2022-12-19
66	27	1	f	-22.9	-1.6	2022-12-19
67	27	1	t	-1.6	0.8	2022-12-19
68	27	1	f	-1.3	3.3	2022-12-19
69	27	1	f	-22.5	12	2022-12-19
70	27	1	f	23.3	1.4	2022-12-19
71	27	1	t	1.5	-0.7	2022-12-19
72	27	1	f	-7	0.9	2022-12-19
73	28	1	f	-22.5	3.2	2022-12-19
74	28	1	f	18.5	19.2	2022-12-19
75	28	1	t	1.5	-0.3	2022-12-19
76	28	1	t	-0.6	2.5	2022-12-19
77	29	1	t	0.5	1.4	2022-12-19
78	29	1	f	-0.9	0.9	2022-12-19
79	29	1	f	-6.7	14.7	2022-12-19
80	29	1	f	-1.6	5.6	2022-12-19
81	29	1	f	8.1	20.9	2022-12-19
82	29	1	t	0	0	2022-12-19
83	29	1	f	0	0	2022-12-19
84	29	1	t	1	1.9	2022-12-19
85	29	1	f	-18.9	16.6	2022-12-19
86	29	1	t	0	0	2022-12-19
87	29	1	f	-1.6	0.8	2022-12-19
88	29	1	t	7.7	23.8	2022-12-19
89	22	2	f	-17	22	2022-12-21
90	22	2	f	2.2	1.5	2022-12-21
91	22	2	f	-17	22.4	2022-12-21
92	22	2	t	-8.1	26	2022-12-21
93	22	2	t	-8.5	25.5	2022-12-21
94	23	2	t	21	13.1	2022-12-21
95	26	2	f	-2.8	11.9	2022-12-21
96	26	2	t	-6.1	4.3	2022-12-21
97	26	2	t	-0.6	6.2	2022-12-21
98	26	2	f	3.6	5	2022-12-21
99	26	2	t	1	6	2022-12-21
100	26	2	t	-6.9	1.3	2022-12-21
101	26	2	t	-1.3	0.9	2022-12-21
102	26	2	t	-2.1	0.7	2022-12-21
103	27	2	f	4.5	0.8	2022-12-21
104	27	2	f	4.5	11	2022-12-21
105	27	2	f	-6	0.3	2022-12-21
106	27	2	f	-3.2	0.2	2022-12-21
107	29	2	f	-23.9	0.9	2022-12-21
108	29	2	t	-1.3	2	2022-12-21
109	29	2	t	-2.3	1.5	2022-12-21
110	29	2	f	-4.2	2.4	2022-12-21
111	29	2	t	-3.8	5.8	2022-12-21
112	29	2	t	-19.5	17.6	2022-12-21
113	29	2	t	3.6	3.3	2022-12-21
114	29	2	f	16.1	20.3	2022-12-21
115	17	2	f	-17.6	0.1	2022-12-21
116	17	2	t	5.6	25.8	2022-12-21
117	17	2	f	23.7	-0.4	2022-12-21
118	17	2	f	-18.4	12	2022-12-21
119	17	2	t	-22.5	-3.3	2022-12-21
120	18	2	f	4.8	27.1	2022-12-21
121	18	2	t	-1.8	2.6	2022-12-21
122	18	2	f	3.9	9.3	2022-12-21
123	18	2	f	-5.5	4.3	2022-12-21
124	18	2	f	3.4	7.1	2022-12-21
125	18	2	f	5.8	7.5	2022-12-21
126	18	2	f	3.4	2	2022-12-21
127	18	2	t	0.1	6.1	2022-12-21
128	18	2	f	2.7	3.6	2022-12-21
129	18	2	t	-3.7	16.8	2022-12-21
130	18	2	f	-4.3	1.1	2022-12-21
131	18	2	f	2	3.1	2022-12-21
132	18	2	t	7.5	12.3	2022-12-21
133	18	2	t	1.8	0.9	2022-12-21
134	18	2	t	15.3	0.5	2022-12-21
135	18	2	f	6	26.1	2022-12-21
136	18	2	t	2.7	2.4	2022-12-21
139	19	2	t	0	0	2022-12-21
137	18	2	f	14.5	25.9	2022-12-21
147	20	2	f	19.9	15.9	2022-12-21
157	21	2	f	2.9	14.3	2022-12-21
167	14	3	t	-0.1	1	2023-02-10
177	11	3	f	14.3	22.6	2023-02-10
187	1	3	f	14.3	27.5	2023-02-10
197	16	3	t	0.7	0.3	2023-02-10
207	15	3	t	23.8	2.5	2023-02-10
217	2	3	t	20.8	16.6	2023-02-10
227	8	3	f	18.6	21.2	2023-02-10
237	8	3	f	-15.7	22.7	2023-02-10
247	16	4	f	1.2	0.8	2023-03-26
257	11	4	f	-7.8	19.6	2023-03-26
267	11	4	t	-0.7	5.9	2023-03-26
277	13	4	f	-23	0.5	2023-03-26
287	5	4	f	-3.8	25.8	2023-03-26
297	9	4	f	-1.3	1.2	2023-03-26
307	15	4	t	-23.5	9.5	2023-03-26
317	12	4	t	16.5	22.9	2023-03-26
327	15	1	t	-13.6	12.5	2022-12-19
337	1	1	t	16.1	33.9	2022-12-19
347	2	1	f	13.5	24.3	2022-12-19
357	2	1	t	-0.4	1.1	2022-12-19
367	4	1	f	2.7	0.9	2022-12-19
377	6	1	f	1.1	1.9	2022-12-19
387	8	1	t	-18.1	17.6	2022-12-19
397	9	1	t	-6.2	2	2022-12-19
407	13	1	f	-6.2	5.3	2022-12-19
417	1	2	f	-15.7	27.9	2022-12-21
427	1	2	f	22.2	12.9	2022-12-21
437	3	2	f	-9.3	24.5	2022-12-21
447	4	2	f	2.9	1.4	2022-12-21
457	8	2	f	4.2	3.4	2022-12-21
467	9	2	f	-2.5	3.8	2022-12-21
477	2	2	t	2.2	1.2	2022-12-21
487	2	2	t	-3.8	4.2	2022-12-21
497	30	3	f	-0.2	25	2023-02-10
507	25	3	t	17.5	23.6	2023-02-10
517	18	3	f	-21.7	11.2	2023-02-10
527	18	3	f	2.3	0.9	2023-02-10
537	26	3	t	-16.8	22.7	2023-02-10
547	26	3	f	0	0	2023-02-10
557	29	3	t	0.2	0.8	2023-02-10
567	19	3	f	-3.4	27.6	2023-02-10
577	31	4	t	1	0.3	2023-03-26
587	25	4	t	1.7	0.5	2023-03-26
597	22	4	t	-18.4	19.8	2023-03-26
607	18	4	f	15.9	2.1	2023-03-26
617	18	4	t	-0.9	1.2	2023-03-26
627	26	4	t	0.6	0.2	2023-03-26
637	29	4	t	-0.5	0.8	2023-03-26
647	30	4	f	12.1	22.2	2023-03-26
657	20	4	f	12.3	25.9	2023-03-26
667	20	4	f	-22.8	0.4	2023-03-26
138	18	2	t	-2.8	1	2022-12-21
148	20	2	f	-16.5	22.5	2022-12-21
158	21	2	f	23.4	-1.6	2022-12-21
168	10	3	f	21.6	11.1	2023-02-10
178	11	3	t	16.3	21	2023-02-10
188	1	3	t	7.8	25.6	2023-02-10
198	16	3	t	-8.8	13.5	2023-02-10
208	15	3	t	-17.5	19.4	2023-02-10
218	2	3	t	0.9	0.6	2023-02-10
228	8	3	f	-23	-0.1	2023-02-10
238	8	3	f	-0.1	9.4	2023-02-10
248	11	4	f	-2.3	1.9	2023-03-26
258	11	4	t	-17.4	22.9	2023-03-26
268	11	4	f	-2.3	5	2023-03-26
278	7	4	f	12.1	26.1	2023-03-26
288	5	4	f	9.7	23.4	2023-03-26
298	9	4	t	1.6	1.2	2023-03-26
308	15	4	f	-22.6	7.9	2023-03-26
318	12	4	t	-16.8	19	2023-03-26
328	1	1	t	-22.4	11.5	2022-12-19
338	1	1	t	-21.2	12.3	2022-12-19
348	2	1	t	23	4.4	2022-12-19
358	2	1	f	-3.8	20.6	2022-12-19
368	4	1	t	-0.9	1.1	2022-12-19
378	8	1	f	-1.8	26	2022-12-19
388	8	1	f	-21.6	14.1	2022-12-19
398	13	1	f	23.2	0.9	2022-12-19
408	13	1	f	-16.2	-2.2	2022-12-19
418	1	2	f	-11.6	26.7	2022-12-21
428	1	2	t	-2.6	1.3	2022-12-21
438	3	2	t	12.3	7.1	2022-12-21
448	6	2	t	-2.5	1.6	2022-12-21
458	8	2	f	-17.6	20.6	2022-12-21
468	9	2	f	9.3	-0.2	2022-12-21
478	2	2	t	-1.6	2	2022-12-21
488	2	2	t	23	0.1	2022-12-21
498	30	3	t	1.1	0.9	2023-02-10
508	25	3	t	-22.9	10.2	2023-02-10
518	18	3	t	2.7	0.9	2023-02-10
528	18	3	t	0.2	1.3	2023-02-10
538	26	3	t	-0.5	2.4	2023-02-10
548	26	3	f	-1	0.8	2023-02-10
558	29	3	f	1.8	0.8	2023-02-10
568	19	3	f	2.8	13.4	2023-02-10
578	31	4	t	-0.7	0.3	2023-03-26
588	25	4	t	-22.3	0.4	2023-03-26
598	22	4	f	-15.4	23.6	2023-03-26
608	18	4	t	0.7	1.2	2023-03-26
618	18	4	f	0.9	2.8	2023-03-26
628	26	4	f	-0.7	2.9	2023-03-26
638	29	4	t	0.4	1.5	2023-03-26
648	30	4	f	20.2	15.8	2023-03-26
658	20	4	f	10.4	26	2023-03-26
140	19	2	t	-2.5	12.5	2022-12-21
150	20	2	t	-22.9	2.5	2022-12-21
160	21	2	f	4.7	2.9	2022-12-21
170	10	3	t	-6.6	2	2023-02-10
180	1	3	t	-0.1	29.3	2023-02-10
190	1	3	f	-14.6	24.4	2023-02-10
200	16	3	t	0.2	-0.2	2023-02-10
210	15	3	f	-15.4	2.6	2023-02-10
220	2	3	f	-23.3	2.4	2023-02-10
230	8	3	f	11.9	24.1	2023-02-10
240	8	3	t	-1.1	0.8	2023-02-10
250	11	4	f	-0.5	1.5	2023-03-26
260	11	4	t	-20.6	14.4	2023-03-26
270	13	4	t	-10.8	25.1	2023-03-26
280	7	4	t	-18.8	18.3	2023-03-26
290	5	4	f	1	21	2023-03-26
300	10	4	f	10.2	1.1	2023-03-26
310	15	4	f	-21.9	13	2023-03-26
320	12	4	t	1.6	0.6	2023-03-26
330	1	1	t	0.5	1.3	2022-12-19
340	1	1	t	-16.8	22.2	2022-12-19
350	2	1	t	-0.1	0.8	2022-12-19
360	2	1	t	0.2	1.5	2022-12-19
370	6	1	f	6.2	7.2	2022-12-19
380	8	1	f	-16.8	19.6	2022-12-19
390	8	1	f	-10.8	12.2	2022-12-19
400	13	1	f	6.9	5.9	2022-12-19
410	14	1	t	0.9	5	2022-12-19
420	1	2	f	-10.3	15.5	2022-12-21
430	1	2	f	-16.7	27.6	2022-12-21
440	3	2	t	0	0	2022-12-21
450	6	2	t	1.1	1.5	2022-12-21
460	8	2	f	-17.4	18.3	2022-12-21
470	9	2	t	2.2	1.5	2022-12-21
480	2	2	f	-16.5	5.5	2022-12-21
490	2	2	f	11.8	4.7	2022-12-21
500	30	3	t	-6.1	12.5	2023-02-10
510	27	3	t	-0.6	1.1	2023-02-10
520	18	3	t	-0.4	1	2023-02-10
530	18	3	t	-2.8	0.5	2023-02-10
540	26	3	f	-1.6	4.4	2023-02-10
550	29	3	t	-0.2	1.2	2023-02-10
560	20	3	t	-23	4.1	2023-02-10
570	19	3	t	0.5	1.2	2023-02-10
580	24	4	t	-21.9	10.8	2023-03-26
590	27	4	f	-22.1	-0.2	2023-03-26
600	22	4	f	-19.5	17.8	2023-03-26
610	18	4	f	1.3	1	2023-03-26
620	26	4	f	-0.4	8.3	2023-03-26
630	26	4	t	4.8	5	2023-03-26
640	29	4	t	0	1.2	2023-03-26
650	30	4	t	-7.1	8.8	2023-03-26
660	20	4	f	1.3	8.9	2023-03-26
141	19	2	t	2	1.1	2022-12-21
151	20	2	f	20.6	14	2022-12-21
161	21	2	f	22.4	-0.4	2022-12-21
171	10	3	t	16.3	20.3	2023-02-10
181	1	3	f	16.1	22.4	2023-02-10
191	1	3	t	-18.1	23.6	2023-02-10
201	16	3	f	-23.3	-0.7	2023-02-10
211	15	3	f	-17.2	19.9	2023-02-10
221	2	3	t	-22.7	6.2	2023-02-10
231	8	3	t	1.1	29.7	2023-02-10
241	13	3	t	1.3	0.5	2023-02-10
251	11	4	f	19.5	44	2023-03-26
261	11	4	t	2	-0.1	2023-03-26
271	13	4	f	-1.3	0.7	2023-03-26
281	7	4	t	-17.5	19	2023-03-26
291	5	4	f	-17.2	19.7	2023-03-26
301	10	4	t	-0.7	0.2	2023-03-26
311	15	4	t	1.7	0	2023-03-26
321	12	4	f	-1.6	1.2	2023-03-26
331	1	1	f	-23	12.5	2022-12-19
341	1	1	t	15.2	20.5	2022-12-19
351	2	1	t	0.7	-0.6	2022-12-19
361	2	1	t	0.4	1.4	2022-12-19
371	6	1	f	22.3	4.4	2022-12-19
381	8	1	f	-19.6	16.4	2022-12-19
391	8	1	f	6.7	13.5	2022-12-19
401	13	1	t	23	2.8	2022-12-19
411	14	1	f	-0.4	25.5	2022-12-19
421	1	2	f	3.4	0.9	2022-12-21
431	1	2	t	-7	2.4	2022-12-21
441	3	2	f	-2.3	2.4	2022-12-21
451	6	2	t	1.8	3.6	2022-12-21
461	8	2	t	13.6	23.1	2022-12-21
471	13	2	t	9.9	24.5	2022-12-21
481	2	2	t	-3.1	2.8	2022-12-21
491	22	3	t	8.3	25.3	2023-02-10
501	25	3	f	15.3	20.4	2023-02-10
511	27	3	f	13.5	25.1	2023-02-10
521	18	3	f	13.1	-1.1	2023-02-10
531	18	3	t	0.5	0.7	2023-02-10
541	26	3	f	-15.6	22.5	2023-02-10
551	29	3	t	1.8	0.6	2023-02-10
561	20	3	t	-0.9	-0.1	2023-02-10
571	19	3	t	2.6	1.3	2023-02-10
581	24	4	f	-1.2	0.4	2023-03-26
591	22	4	f	1	1.2	2023-03-26
601	22	4	t	23.7	2.1	2023-03-26
611	18	4	t	-0.2	0.2	2023-03-26
621	26	4	f	18.5	16.8	2023-03-26
631	26	4	t	7.4	5.7	2023-03-26
641	29	4	f	-0.2	2.2	2023-03-26
651	30	4	f	2.2	0.1	2023-03-26
661	20	4	f	0.1	8.7	2023-03-26
142	19	2	f	-4.7	11.3	2022-12-21
152	20	2	f	-1.5	2.4	2022-12-21
162	21	2	f	-2	1.2	2022-12-21
172	10	3	t	-21.1	16.7	2023-02-10
182	1	3	t	10.5	25.2	2023-02-10
192	1	3	f	-11.3	26	2023-02-10
202	16	3	f	-0.7	0.3	2023-02-10
212	2	3	t	11.6	3.3	2023-02-10
222	2	3	t	0.1	-1.7	2023-02-10
232	8	3	f	6.2	6.3	2023-02-10
242	14	4	f	21	13.4	2023-03-26
252	11	4	t	12.9	24	2023-03-26
262	11	4	t	0	3.6	2023-03-26
272	13	4	t	-1.2	-0.6	2023-03-26
282	7	4	t	23.3	-0.1	2023-03-26
292	5	4	t	-17.2	19.2	2023-03-26
302	10	4	f	-7.4	3.4	2023-03-26
312	15	4	t	0.6	1.5	2023-03-26
322	12	4	f	-1.8	0.4	2023-03-26
332	1	1	t	0.7	-0.1	2022-12-19
342	1	1	t	-23.3	2.4	2022-12-19
352	2	1	t	7	16	2022-12-19
362	2	1	f	22.5	0.5	2022-12-19
372	6	1	t	6.2	8.2	2022-12-19
382	8	1	t	16.4	22.8	2022-12-19
392	8	1	t	21.6	14.5	2022-12-19
402	13	1	t	-22.8	-1.2	2022-12-19
412	14	2	t	3.8	2.1	2022-12-21
422	1	2	f	-15.9	20.7	2022-12-21
432	1	2	t	0.5	28.5	2022-12-21
442	3	2	t	0.9	4.1	2022-12-21
452	6	2	t	-19.6	16.4	2022-12-21
462	8	2	t	-23.7	8.8	2022-12-21
472	15	2	t	-2.5	1.9	2022-12-21
482	2	2	f	1.8	2.8	2022-12-21
492	22	3	t	22.8	0.5	2023-02-10
502	25	3	f	1.7	0.3	2023-02-10
512	27	3	f	0	0	2023-02-10
522	18	3	t	0.9	1.2	2023-02-10
532	28	3	t	-1.1	1.3	2023-02-10
542	26	3	t	-2.3	-0.5	2023-02-10
552	29	3	f	1.2	0.6	2023-02-10
562	20	3	t	-15.4	27.3	2023-02-10
572	19	3	f	9.7	26.5	2023-02-10
582	24	4	t	1.7	0.6	2023-03-26
592	22	4	f	-6.7	26.1	2023-03-26
602	22	4	f	1.6	0.7	2023-03-26
612	18	4	f	1.7	0.8	2023-03-26
622	26	4	t	19	18.9	2023-03-26
632	29	4	f	0.9	-0.2	2023-03-26
642	29	4	t	-0.6	0.9	2023-03-26
652	30	4	f	0.7	1.4	2023-03-26
662	20	4	f	-16.3	21.5	2023-03-26
143	19	2	t	0	0	2022-12-21
153	20	2	t	0	1.8	2022-12-21
163	21	2	t	3.1	3.3	2022-12-21
173	10	3	f	22.4	5.1	2023-02-10
183	1	3	f	2.5	1.9	2023-02-10
193	1	3	f	23.3	1.2	2023-02-10
203	16	3	t	0.2	-0.7	2023-02-10
213	2	3	f	22.4	4.2	2023-02-10
223	2	3	t	0.5	12.9	2023-02-10
233	8	3	t	0.2	1.5	2023-02-10
243	14	4	t	-2.1	0.3	2023-03-26
253	11	4	f	16.9	22.4	2023-03-26
263	11	4	t	1.2	1.7	2023-03-26
273	13	4	t	1.7	0.2	2023-03-26
283	7	4	f	22.4	1.9	2023-03-26
293	9	4	f	1.8	0.3	2023-03-26
303	15	4	t	16.5	23.9	2023-03-26
313	15	4	f	1.1	0.5	2023-03-26
323	12	4	f	6.9	0.6	2023-03-26
333	1	1	f	-20.8	15	2022-12-19
343	1	1	f	0.9	0.8	2022-12-19
353	2	1	t	1	-0.2	2022-12-19
363	4	1	f	1	-0.3	2022-12-19
373	6	1	t	-13.1	24.8	2022-12-19
383	8	1	t	-16.5	20.7	2022-12-19
393	8	1	f	-0.2	2.7	2022-12-19
403	13	1	f	0	0	2022-12-19
413	14	2	t	0	0	2022-12-21
423	1	2	f	-18.9	19.2	2022-12-21
433	1	2	t	5.5	1.2	2022-12-21
443	4	2	f	-23.7	1.7	2022-12-21
453	6	2	t	1.8	1.2	2022-12-21
463	8	2	f	-6.4	8.7	2022-12-21
473	15	2	f	-15.2	22.3	2022-12-21
483	2	2	t	1.7	2.4	2022-12-21
493	22	3	f	1.6	0	2023-02-10
503	25	3	f	-5.6	3.9	2023-02-10
513	27	3	f	2.5	1.3	2023-02-10
523	18	3	t	-1	0	2023-02-10
533	28	3	f	0	0	2023-02-10
543	26	3	t	1	6.2	2023-02-10
553	29	3	f	22.9	5.2	2023-02-10
563	20	3	t	-0.4	0.8	2023-02-10
573	19	3	f	1.8	0.5	2023-02-10
583	25	4	f	-17	21.5	2023-03-26
593	22	4	t	21.3	13.6	2023-03-26
603	18	4	f	-1.8	0.6	2023-03-26
613	18	4	t	-0.5	0.1	2023-03-26
623	26	4	t	-23.2	9.9	2023-03-26
633	29	4	f	0	1	2023-03-26
643	29	4	t	-1.2	5.4	2023-03-26
653	30	4	t	-0.2	0.6	2023-03-26
663	20	4	f	23.4	5.1	2023-03-26
144	19	2	f	22.5	12.3	2022-12-21
154	20	2	t	14.2	23.3	2022-12-21
164	28	2	t	-0.9	0.3	2022-12-21
174	10	3	t	-1.1	-0.5	2023-02-10
184	1	3	f	-9.3	25.4	2023-02-10
194	1	3	t	-14.8	22.7	2023-02-10
204	15	3	f	1.2	1.4	2023-02-10
214	2	3	f	17.6	17.5	2023-02-10
224	2	3	f	-13.1	4.6	2023-02-10
234	8	3	f	2	1.2	2023-02-10
244	14	4	t	7.1	0.4	2023-03-26
254	11	4	f	11	18.2	2023-03-26
264	11	4	f	-3.7	1.3	2023-03-26
274	13	4	f	2.7	6.3	2023-03-26
284	7	4	f	23.2	3.4	2023-03-26
294	9	4	t	0	0	2023-03-26
304	15	4	f	12.9	9.4	2023-03-26
314	15	4	t	5	4.1	2023-03-26
324	15	1	f	21.7	14.1	2022-12-19
334	1	1	f	6.1	7.6	2022-12-19
344	1	1	f	-15.9	25.8	2022-12-19
354	2	1	f	2.1	0.3	2022-12-19
364	4	1	t	0	0	2022-12-19
374	6	1	f	-0.1	2.7	2022-12-19
384	8	1	f	-15.6	21.9	2022-12-19
394	9	1	t	0	1.2	2022-12-19
404	13	1	f	0	5.1	2022-12-19
414	14	2	t	0	0	2022-12-21
424	1	2	f	16.8	22.5	2022-12-21
434	1	2	f	-3.8	9.5	2022-12-21
444	4	2	f	-23.2	2	2022-12-21
454	6	2	f	-23	1.4	2022-12-21
464	8	2	f	-2.1	26.7	2022-12-21
474	15	2	f	-14.8	14.6	2022-12-21
484	2	2	f	9.3	24.9	2022-12-21
494	22	3	t	-16.7	24.6	2023-02-10
504	25	3	t	0.4	-0.2	2023-02-10
514	23	3	f	-13.7	24.3	2023-02-10
524	18	3	t	-0.6	0.3	2023-02-10
534	26	3	f	5.8	2.6	2023-02-10
544	26	3	f	3.8	3.1	2023-02-10
554	29	3	f	-1.2	-0.4	2023-02-10
564	20	3	t	-10.2	26.7	2023-02-10
574	31	4	f	2	0.5	2023-03-26
584	25	4	f	-12.6	22.5	2023-03-26
594	22	4	f	-20.2	16.2	2023-03-26
604	18	4	t	7.2	5.9	2023-03-26
614	18	4	t	-1.1	1.2	2023-03-26
624	26	4	f	-21.8	11.9	2023-03-26
634	29	4	f	8	12.4	2023-03-26
644	29	4	f	-1.7	5.9	2023-03-26
654	20	4	f	0	0	2023-03-26
664	20	4	t	-1.3	-0.1	2023-03-26
145	19	2	f	0.6	7.3	2022-12-21
155	20	2	f	9.3	28.2	2022-12-21
165	28	2	f	15.4	21	2022-12-21
175	11	3	f	11.2	24.7	2023-02-10
185	1	3	t	-0.5	-0.2	2023-02-10
195	1	3	f	14.7	23.9	2023-02-10
205	15	3	t	-0.7	1	2023-02-10
215	2	3	t	21.4	1.4	2023-02-10
225	9	3	t	5.9	3	2023-02-10
235	8	3	f	-15.8	23.3	2023-02-10
245	14	4	t	0.2	4.6	2023-03-26
255	11	4	f	3.9	16.9	2023-03-26
265	11	4	t	-0.6	0.9	2023-03-26
275	13	4	f	5.4	2.8	2023-03-26
285	7	4	f	-1.3	0.5	2023-03-26
295	9	4	t	-0.4	1.9	2023-03-26
305	15	4	t	-3.6	14.3	2023-03-26
315	15	4	t	-6.1	3.4	2023-03-26
325	15	1	t	0	0	2022-12-19
335	1	1	f	-15.9	23.5	2022-12-19
345	2	1	f	22.2	12.1	2022-12-19
355	2	1	t	-0.1	2.7	2022-12-19
365	4	1	t	0	0	2022-12-19
375	6	1	t	1.2	1.5	2022-12-19
385	8	1	t	-16.5	19	2022-12-19
395	9	1	t	0	0	2022-12-19
405	13	1	f	17.3	18.4	2022-12-19
415	14	2	f	-1.5	9.9	2022-12-21
425	1	2	t	-3.6	5.4	2022-12-21
435	1	2	f	-4.2	2.7	2022-12-21
445	4	2	f	-4.5	1.5	2022-12-21
455	8	2	t	-15.9	20.9	2022-12-21
465	8	2	f	-24.1	7.9	2022-12-21
475	15	2	t	22.9	0	2022-12-21
485	2	2	f	0.7	5.5	2022-12-21
495	22	3	t	-22.5	1.8	2023-02-10
505	25	3	f	0	0	2023-02-10
515	23	3	f	-20.7	16.7	2023-02-10
525	18	3	t	-0.7	-1.2	2023-02-10
535	26	3	t	-18.8	16.1	2023-02-10
545	26	3	f	-8.9	4	2023-02-10
555	29	3	f	4.4	21.3	2023-02-10
565	19	3	f	-23.5	4.6	2023-02-10
575	31	4	f	-0.4	26.1	2023-03-26
585	25	4	f	-21.2	14.5	2023-03-26
595	22	4	t	-20.6	17.3	2023-03-26
605	18	4	f	-3.6	26.8	2023-03-26
615	18	4	f	-1.2	1.2	2023-03-26
625	26	4	t	-16.3	21.9	2023-03-26
635	29	4	t	-16.2	20.1	2023-03-26
645	29	4	t	-19.9	-2.2	2023-03-26
655	20	4	f	-2.7	1	2023-03-26
665	20	4	f	2.3	4	2023-03-26
146	20	2	t	1.8	0.6	2022-12-21
156	20	2	t	-4	2.9	2022-12-21
166	14	3	t	2.1	0.7	2023-02-10
176	11	3	t	12	24.6	2023-02-10
186	1	3	t	-0.7	0.2	2023-02-10
196	1	3	t	0	0.4	2023-02-10
206	15	3	t	-18.3	17.3	2023-02-10
216	2	3	t	0.2	-0.2	2023-02-10
226	9	3	t	1	0.9	2023-02-10
236	8	3	f	-2	6.4	2023-02-10
246	16	4	f	22.3	0.6	2023-03-26
256	11	4	t	7.7	14.7	2023-03-26
266	11	4	t	0.1	0.4	2023-03-26
276	13	4	f	-23.4	1.5	2023-03-26
286	7	4	f	3.6	2.4	2023-03-26
296	9	4	f	-1.6	1.5	2023-03-26
306	15	4	t	0.5	21.5	2023-03-26
316	12	4	f	18.3	15.8	2023-03-26
326	15	1	f	0.5	1.2	2022-12-19
336	1	1	f	14.7	20.5	2022-12-19
346	2	1	f	18	1	2022-12-19
356	2	1	f	-0.6	2.6	2022-12-19
366	4	1	f	23.9	9.9	2022-12-19
376	6	1	t	1.6	2.2	2022-12-19
386	8	1	t	6.2	6	2022-12-19
396	9	1	t	-0.5	1.9	2022-12-19
406	13	1	f	0.2	0.4	2022-12-19
416	14	2	t	2.8	0.9	2022-12-21
426	1	2	f	-1.1	25.7	2022-12-21
436	3	2	t	-16.3	20.8	2022-12-21
446	4	2	t	-21.6	12.4	2022-12-21
456	8	2	t	-23	1.2	2022-12-21
466	9	2	t	1.2	2.1	2022-12-21
476	15	2	t	-23.3	8.2	2022-12-21
486	2	2	f	0	40.3	2022-12-21
496	30	3	t	0.6	-0.5	2023-02-10
506	25	3	f	-15.6	27.1	2023-02-10
516	18	3	t	1	0.7	2023-02-10
526	18	3	t	0.1	0.8	2023-02-10
536	26	3	t	-6.9	11.1	2023-02-10
546	26	3	t	-0.4	1.4	2023-02-10
556	29	3	t	1.1	1.7	2023-02-10
566	19	3	t	-1.5	-1.1	2023-02-10
576	31	4	f	-20.5	15.7	2023-03-26
586	25	4	f	-1.8	1	2023-03-26
596	22	4	t	-19	16.5	2023-03-26
606	18	4	f	-2.7	15.9	2023-03-26
616	18	4	t	-1.7	1.2	2023-03-26
626	26	4	t	0.4	1	2023-03-26
636	29	4	t	-14.7	23.9	2023-03-26
646	30	4	t	0	0	2023-03-26
656	20	4	t	-0.1	0.1	2023-03-26
666	20	4	f	-4	0.1	2023-03-26
149	20	2	f	-5.1	4.5	2022-12-21
159	21	2	t	0	0	2022-12-21
169	10	3	f	-22.8	1.5	2023-02-10
179	1	3	t	11.8	14.3	2023-02-10
189	1	3	t	-5.8	26.1	2023-02-10
199	16	3	t	-9.9	-1	2023-02-10
209	15	3	t	-0.2	0.3	2023-02-10
219	2	3	f	1	-0.1	2023-02-10
229	8	3	f	-22.7	11.4	2023-02-10
239	8	3	f	18.4	16.7	2023-02-10
249	11	4	t	0	0	2023-03-26
259	11	4	f	-16.7	18.9	2023-03-26
269	13	4	t	12.5	23.6	2023-03-26
279	7	4	t	-6.9	20.4	2023-03-26
289	5	4	f	16.9	20.4	2023-03-26
299	10	4	f	-7.2	10.5	2023-03-26
309	15	4	t	-22.7	12.4	2023-03-26
319	12	4	f	22.8	2.5	2023-03-26
329	1	1	t	1	-0.8	2022-12-19
339	1	1	f	-19	25	2022-12-19
349	2	1	t	-0.6	-0.2	2022-12-19
359	2	1	f	-23	1.6	2022-12-19
369	4	1	t	-1.2	2.2	2022-12-19
379	8	1	t	-6	9.2	2022-12-19
389	8	1	f	6.1	10.5	2022-12-19
399	13	1	t	23.2	2	2022-12-19
409	14	1	f	0.9	2.1	2022-12-19
419	1	2	f	-19.6	17.4	2022-12-21
429	1	2	t	11.4	26.6	2022-12-21
439	3	2	t	-2.8	6.2	2022-12-21
449	6	2	f	-22.7	-1.2	2022-12-21
459	8	2	f	23	3.5	2022-12-21
469	9	2	t	1	2	2022-12-21
479	2	2	t	18.4	21.3	2022-12-21
489	2	2	f	-4.7	2.6	2022-12-21
499	30	3	t	-23.2	7	2023-02-10
509	27	3	f	0.7	0.5	2023-02-10
519	18	3	t	-8	8.9	2023-02-10
529	18	3	t	-1.3	-0.2	2023-02-10
539	26	3	f	-4.5	7.1	2023-02-10
549	29	3	f	-5.1	4.2	2023-02-10
559	20	3	t	-0.5	1.9	2023-02-10
569	19	3	t	-1.1	-0.4	2023-02-10
579	24	4	f	2.7	16.7	2023-03-26
589	27	4	f	2.6	1.2	2023-03-26
599	22	4	f	-22.9	8	2023-03-26
609	18	4	t	-0.4	1.4	2023-03-26
619	18	4	t	-1.1	7.7	2023-03-26
629	26	4	f	-2	0.1	2023-03-26
639	29	4	t	0.6	0.4	2023-03-26
649	30	4	f	14.5	21	2023-03-26
659	20	4	f	9.9	24.1	2023-03-26
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: app; Owner: okcapplicant
--

COPY app.teams (id, name) FROM stdin;
1	Tune Squad
2	Monstars
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add player	7	add_player
26	Can change player	7	change_player
27	Can delete player	7	delete_player
28	Can view player	7	view_player
29	Can add shots	8	add_shots
30	Can change shots	8	change_shots
31	Can delete shots	8	delete_shots
32	Can view shots	8	view_shots
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app	player
8	app	shots
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-08-22 12:20:34.934744+02
2	auth	0001_initial	2023-08-22 12:20:35.231546+02
3	admin	0001_initial	2023-08-22 12:20:35.309412+02
4	admin	0002_logentry_remove_auto_add	2023-08-22 12:20:35.334386+02
5	admin	0003_logentry_add_action_flag_choices	2023-08-22 12:20:35.357933+02
6	contenttypes	0002_remove_content_type_name	2023-08-22 12:20:35.407278+02
7	auth	0002_alter_permission_name_max_length	2023-08-22 12:20:35.426519+02
8	auth	0003_alter_user_email_max_length	2023-08-22 12:20:35.443139+02
9	auth	0004_alter_user_username_opts	2023-08-22 12:20:35.458135+02
10	auth	0005_alter_user_last_login_null	2023-08-22 12:20:35.479172+02
11	auth	0006_require_contenttypes_0002	2023-08-22 12:20:35.48314+02
12	auth	0007_alter_validators_add_error_messages	2023-08-22 12:20:35.50516+02
13	auth	0008_alter_user_username_max_length	2023-08-22 12:20:35.543716+02
14	auth	0009_alter_user_last_name_max_length	2023-08-22 12:20:35.566722+02
15	auth	0010_alter_group_name_max_length	2023-08-22 12:20:35.599318+02
16	auth	0011_update_proxy_permissions	2023-08-22 12:20:35.628329+02
17	auth	0012_alter_user_first_name_max_length	2023-08-22 12:20:35.657052+02
18	sessions	0001_initial	2023-08-22 12:20:35.703044+02
19	app	0001_initial	2023-08-30 05:32:00.504499+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: okcapplicant
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: app; Owner: okcapplicant
--

SELECT pg_catalog.setval('app.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: app; Owner: okcapplicant
--

SELECT pg_catalog.setval('app.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: app; Owner: okcapplicant
--

SELECT pg_catalog.setval('app.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: app; Owner: okcapplicant
--

SELECT pg_catalog.setval('app.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: app; Owner: okcapplicant
--

SELECT pg_catalog.setval('app.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: app; Owner: okcapplicant
--

SELECT pg_catalog.setval('app.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: app; Owner: okcapplicant
--

SELECT pg_catalog.setval('app.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: app; Owner: okcapplicant
--

SELECT pg_catalog.setval('app.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: app; Owner: okcapplicant
--

SELECT pg_catalog.setval('app.django_migrations_id_seq', 19, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: okcapplicant
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: okcapplicant
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: okcapplicant
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: okcapplicant
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: okcapplicant
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: okcapplicant
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: okcapplicant
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: okcapplicant
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: okcapplicant
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: app_player app_player_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.app_player
    ADD CONSTRAINT app_player_pkey PRIMARY KEY (id);


--
-- Name: app_shots app_shots_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.app_shots
    ADD CONSTRAINT app_shots_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: box_score box_score_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.box_score
    ADD CONSTRAINT box_score_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: shots shots_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.shots
    ADD CONSTRAINT shots_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX auth_group_name_a6ea08ec_like ON app.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON app.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON app.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON app.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX auth_user_groups_group_id_97559544 ON app.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON app.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON app.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON app.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX auth_user_username_6821ab7c_like ON app.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON app.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON app.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX django_session_expire_date_a5c62663 ON app.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: app; Owner: okcapplicant
--

CREATE INDEX django_session_session_key_c0390e0f_like ON app.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: okcapplicant
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: app_player app_player_player_id_fkey; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.app_player
    ADD CONSTRAINT app_player_player_id_fkey FOREIGN KEY (player_id) REFERENCES app.players(id);


--
-- Name: app_shots app_shots_player_id_fkey; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.app_shots
    ADD CONSTRAINT app_shots_player_id_fkey FOREIGN KEY (player_id) REFERENCES app.players(id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES app.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES app.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES app.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES app.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES app.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES app.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES app.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: box_score box_score_player_id_fkey; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.box_score
    ADD CONSTRAINT box_score_player_id_fkey FOREIGN KEY (player_id) REFERENCES app.players(id);


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES app.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES app.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shots shots_player_id_fkey; Type: FK CONSTRAINT; Schema: app; Owner: okcapplicant
--

ALTER TABLE ONLY app.shots
    ADD CONSTRAINT shots_player_id_fkey FOREIGN KEY (player_id) REFERENCES app.players(id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: okcapplicant
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

