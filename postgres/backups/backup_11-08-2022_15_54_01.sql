--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Debian 12.11-1.pgdg110+1)
-- Dumped by pg_dump version 12.11 (Debian 12.11-1.pgdg110+1)

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

ALTER TABLE ONLY public.relationship DROP CONSTRAINT relationship_fk1;
ALTER TABLE ONLY public.relationship DROP CONSTRAINT relationship_fk0;
ALTER TABLE ONLY public.property DROP CONSTRAINT property_fk0;
ALTER TABLE ONLY public.person DROP CONSTRAINT person_fk1;
ALTER TABLE ONLY public.person DROP CONSTRAINT person_fk0;
ALTER TABLE ONLY public.parent DROP CONSTRAINT parent_fk1;
ALTER TABLE ONLY public.parent DROP CONSTRAINT parent_fk0;
ALTER TABLE ONLY public.ownership DROP CONSTRAINT ownership_fk1;
ALTER TABLE ONLY public.ownership DROP CONSTRAINT ownership_fk0;
ALTER TABLE ONLY public.occupation DROP CONSTRAINT occupation_fk0;
ALTER TABLE ONLY public.family DROP CONSTRAINT family_fk2;
ALTER TABLE ONLY public.family DROP CONSTRAINT family_fk1;
ALTER TABLE ONLY public.family DROP CONSTRAINT family_fk0;
ALTER TABLE ONLY public.dynasty DROP CONSTRAINT dynasty_fk1;
ALTER TABLE ONLY public.dynasty DROP CONSTRAINT dynasty_fk0;
ALTER TABLE ONLY public.relationship DROP CONSTRAINT relationship_pk;
ALTER TABLE ONLY public.property DROP CONSTRAINT property_pk;
ALTER TABLE ONLY public.person DROP CONSTRAINT person_pk;
ALTER TABLE ONLY public.people DROP CONSTRAINT people_pkey;
ALTER TABLE ONLY public.parent DROP CONSTRAINT parent_pk;
ALTER TABLE ONLY public.ownership DROP CONSTRAINT ownership_pk;
ALTER TABLE ONLY public.occupation DROP CONSTRAINT occupation_pk;
ALTER TABLE ONLY public.family DROP CONSTRAINT family_pk;
ALTER TABLE ONLY public.families DROP CONSTRAINT families_pkey;
ALTER TABLE ONLY public.dynasty DROP CONSTRAINT dynasty_pk;
ALTER TABLE ONLY public.dynasties DROP CONSTRAINT dynasties_pkey;
ALTER TABLE public.relationship ALTER COLUMN relationship_id DROP DEFAULT;
ALTER TABLE public.property ALTER COLUMN property_id DROP DEFAULT;
ALTER TABLE public.person ALTER COLUMN person_id DROP DEFAULT;
ALTER TABLE public.people ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.parent ALTER COLUMN parent_id DROP DEFAULT;
ALTER TABLE public.ownership ALTER COLUMN ownership_id DROP DEFAULT;
ALTER TABLE public.occupation ALTER COLUMN occupation_id DROP DEFAULT;
ALTER TABLE public.family ALTER COLUMN family_id DROP DEFAULT;
ALTER TABLE public.families ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dynasty ALTER COLUMN dynasty_id DROP DEFAULT;
ALTER TABLE public.dynasties ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.relationship_relationship_id_seq;
DROP TABLE public.relationship;
DROP SEQUENCE public.property_property_id_seq;
DROP TABLE public.property;
DROP SEQUENCE public.person_person_id_seq;
DROP TABLE public.person;
DROP SEQUENCE public.people_id_seq;
DROP TABLE public.people;
DROP SEQUENCE public.parent_parent_id_seq;
DROP TABLE public.parent;
DROP SEQUENCE public.ownership_ownership_id_seq;
DROP TABLE public.ownership;
DROP SEQUENCE public.occupation_occupation_id_seq;
DROP TABLE public.occupation;
DROP SEQUENCE public.family_family_id_seq;
DROP TABLE public.family;
DROP SEQUENCE public.families_id_seq;
DROP TABLE public.families;
DROP SEQUENCE public.dynasty_dynasty_id_seq;
DROP TABLE public.dynasty;
DROP SEQUENCE public.dynasties_id_seq;
DROP TABLE public.dynasties;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dynasties; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.dynasties (
    id integer NOT NULL,
    dynasty_name character varying(100) NOT NULL,
    dynasty_head integer,
    dynasty_creator_id integer,
    dynasty_start date,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.dynasties OWNER TO mattsii;

--
-- Name: dynasties_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.dynasties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dynasties_id_seq OWNER TO mattsii;

--
-- Name: dynasties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.dynasties_id_seq OWNED BY public.dynasties.id;


--
-- Name: dynasty; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.dynasty (
    dynasty_id integer NOT NULL,
    dynasty_name character varying NOT NULL,
    dynasty_head integer,
    dynasty_creator_id integer,
    dynasty_start date
);


ALTER TABLE public.dynasty OWNER TO mattsii;

--
-- Name: dynasty_dynasty_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.dynasty_dynasty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dynasty_dynasty_id_seq OWNER TO mattsii;

--
-- Name: dynasty_dynasty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.dynasty_dynasty_id_seq OWNED BY public.dynasty.dynasty_id;


--
-- Name: families; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.families (
    id integer NOT NULL,
    family_name character varying(100) NOT NULL,
    family_head integer,
    dynasty_id integer,
    family_creator_id integer,
    family_start date,
    cadet_of integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.families OWNER TO mattsii;

--
-- Name: families_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.families_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.families_id_seq OWNER TO mattsii;

--
-- Name: families_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.families_id_seq OWNED BY public.families.id;


--
-- Name: family; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.family (
    family_id integer NOT NULL,
    family_name character varying NOT NULL,
    dynasty_id integer,
    family_head integer,
    family_creator_id integer,
    family_start date,
    cadet_of integer
);


ALTER TABLE public.family OWNER TO mattsii;

--
-- Name: family_family_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.family_family_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.family_family_id_seq OWNER TO mattsii;

--
-- Name: family_family_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.family_family_id_seq OWNED BY public.family.family_id;


--
-- Name: occupation; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.occupation (
    occupation_id integer NOT NULL,
    occupation_type character varying NOT NULL,
    occupation_start date,
    occupation_end date,
    occupation_info text,
    person_id integer NOT NULL
);


ALTER TABLE public.occupation OWNER TO mattsii;

--
-- Name: occupation_occupation_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.occupation_occupation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.occupation_occupation_id_seq OWNER TO mattsii;

--
-- Name: occupation_occupation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.occupation_occupation_id_seq OWNED BY public.occupation.occupation_id;


--
-- Name: ownership; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.ownership (
    ownership_id integer NOT NULL,
    property_id integer NOT NULL,
    person_id integer NOT NULL,
    ownership_start date,
    ownership_end date,
    ownership_source text
);


ALTER TABLE public.ownership OWNER TO mattsii;

--
-- Name: ownership_ownership_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.ownership_ownership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ownership_ownership_id_seq OWNER TO mattsii;

--
-- Name: ownership_ownership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.ownership_ownership_id_seq OWNED BY public.ownership.ownership_id;


--
-- Name: parent; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.parent (
    parent_id integer NOT NULL,
    person_id integer NOT NULL,
    parent_person_id integer NOT NULL,
    parent_type character varying NOT NULL
);


ALTER TABLE public.parent OWNER TO mattsii;

--
-- Name: parent_parent_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.parent_parent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parent_parent_id_seq OWNER TO mattsii;

--
-- Name: parent_parent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.parent_parent_id_seq OWNED BY public.parent.parent_id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.people (
    id integer NOT NULL,
    name_first character varying(100) NOT NULL,
    name_by character varying(100),
    name_middle character varying(100),
    name_maiden character varying(100),
    name_last character varying(100),
    gender character(1),
    date_birth date,
    date_death date,
    place_birth character varying(100),
    place_death character varying(100),
    cause_death character varying(100),
    family_id integer,
    person_source text,
    dynasty_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.people OWNER TO mattsii;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_id_seq OWNER TO mattsii;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    name_first character varying NOT NULL,
    name_by character varying,
    name_middle character varying,
    name_maiden character varying(255),
    name_last character varying,
    gender character(1) NOT NULL,
    date_birth date,
    date_death date,
    place_birth character varying,
    place_death character varying,
    cause_death character varying,
    family_id integer,
    person_source text,
    dynasty_id integer
);


ALTER TABLE public.person OWNER TO mattsii;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_person_id_seq OWNER TO mattsii;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person.person_id;


--
-- Name: property; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.property (
    property_id integer NOT NULL,
    property_size character varying,
    property_name character varying NOT NULL,
    property_type character varying NOT NULL,
    property_creation date,
    property_start date,
    property_creator_id integer
);


ALTER TABLE public.property OWNER TO mattsii;

--
-- Name: property_property_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.property_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.property_property_id_seq OWNER TO mattsii;

--
-- Name: property_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.property_property_id_seq OWNED BY public.property.property_id;


--
-- Name: relationship; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.relationship (
    relationship_id integer NOT NULL,
    relationship_type character varying NOT NULL,
    relationship_start date,
    relationship_end date,
    person_1 integer NOT NULL,
    person_2 integer NOT NULL,
    person_1_role character varying NOT NULL,
    person_2_role character varying NOT NULL,
    relationship_notes character varying,
    relationship_source text
);


ALTER TABLE public.relationship OWNER TO mattsii;

--
-- Name: relationship_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public.relationship_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationship_relationship_id_seq OWNER TO mattsii;

--
-- Name: relationship_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public.relationship_relationship_id_seq OWNED BY public.relationship.relationship_id;


--
-- Name: dynasties id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.dynasties ALTER COLUMN id SET DEFAULT nextval('public.dynasties_id_seq'::regclass);


--
-- Name: dynasty dynasty_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.dynasty ALTER COLUMN dynasty_id SET DEFAULT nextval('public.dynasty_dynasty_id_seq'::regclass);


--
-- Name: families id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.families ALTER COLUMN id SET DEFAULT nextval('public.families_id_seq'::regclass);


--
-- Name: family family_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.family ALTER COLUMN family_id SET DEFAULT nextval('public.family_family_id_seq'::regclass);


--
-- Name: occupation occupation_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.occupation ALTER COLUMN occupation_id SET DEFAULT nextval('public.occupation_occupation_id_seq'::regclass);


--
-- Name: ownership ownership_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.ownership ALTER COLUMN ownership_id SET DEFAULT nextval('public.ownership_ownership_id_seq'::regclass);


--
-- Name: parent parent_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.parent ALTER COLUMN parent_id SET DEFAULT nextval('public.parent_parent_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.person ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- Name: property property_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.property ALTER COLUMN property_id SET DEFAULT nextval('public.property_property_id_seq'::regclass);


--
-- Name: relationship relationship_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.relationship ALTER COLUMN relationship_id SET DEFAULT nextval('public.relationship_relationship_id_seq'::regclass);


--
-- Data for Name: dynasties; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.dynasties (id, dynasty_name, dynasty_head, dynasty_creator_id, dynasty_start, "createdAt", "updatedAt") FROM stdin;
1	Bellonid	\N	\N	0800-01-01	2022-08-08 22:11:50.014+00	2022-08-08 22:11:50.014+00
2	Jiménez	\N	\N	0850-01-01	2022-08-08 22:11:50.014+00	2022-08-08 22:11:50.014+00
3	Anscarid	\N	\N	0850-01-01	2022-08-08 22:11:50.014+00	2022-08-08 22:11:50.014+00
4	Robertian	\N	\N	0800-01-01	2022-08-08 22:11:50.014+00	2022-08-08 22:11:50.014+00
5	Salian	\N	\N	1000-01-01	2022-08-08 22:11:50.014+00	2022-08-08 22:11:50.014+00
6	Ottonian	\N	\N	0912-01-01	2022-08-08 22:11:50.014+00	2022-08-08 22:11:50.014+00
34	Bellonid	\N	\N	0800-01-01	2022-08-08 22:15:39.981+00	2022-08-08 22:15:39.981+00
35	Jiménez	\N	\N	0850-01-01	2022-08-08 22:15:39.981+00	2022-08-08 22:15:39.981+00
36	Anscarid	\N	\N	0850-01-01	2022-08-08 22:15:39.981+00	2022-08-08 22:15:39.981+00
37	Robertian	\N	\N	0800-01-01	2022-08-08 22:15:39.981+00	2022-08-08 22:15:39.981+00
38	Salian	\N	\N	1000-01-01	2022-08-08 22:15:39.981+00	2022-08-08 22:15:39.981+00
39	Ottonian	\N	\N	0912-01-01	2022-08-08 22:15:39.981+00	2022-08-08 22:15:39.981+00
40	Bellonid	\N	\N	0800-01-01	2022-08-08 22:19:31.647+00	2022-08-08 22:19:31.647+00
41	Jiménez	\N	\N	0850-01-01	2022-08-08 22:19:31.647+00	2022-08-08 22:19:31.647+00
42	Anscarid	\N	\N	0850-01-01	2022-08-08 22:19:31.647+00	2022-08-08 22:19:31.647+00
43	Robertian	\N	\N	0800-01-01	2022-08-08 22:19:31.647+00	2022-08-08 22:19:31.647+00
44	Salian	\N	\N	1000-01-01	2022-08-08 22:19:31.647+00	2022-08-08 22:19:31.647+00
45	Ottonian	\N	\N	0912-01-01	2022-08-08 22:19:31.647+00	2022-08-08 22:19:31.647+00
46	Bellonid	\N	\N	0800-01-01	2022-08-08 22:29:33.448+00	2022-08-08 22:29:33.448+00
47	Jiménez	\N	\N	0850-01-01	2022-08-08 22:29:33.448+00	2022-08-08 22:29:33.448+00
48	Anscarid	\N	\N	0850-01-01	2022-08-08 22:29:33.448+00	2022-08-08 22:29:33.448+00
49	Robertian	\N	\N	0800-01-01	2022-08-08 22:29:33.448+00	2022-08-08 22:29:33.448+00
50	Salian	\N	\N	1000-01-01	2022-08-08 22:29:33.448+00	2022-08-08 22:29:33.448+00
51	Ottonian	\N	\N	0912-01-01	2022-08-08 22:29:33.448+00	2022-08-08 22:29:33.448+00
52	Bellonid	\N	\N	0800-01-01	2022-08-09 19:52:27.352+00	2022-08-09 19:52:27.352+00
53	Jiménez	\N	\N	0850-01-01	2022-08-09 19:52:27.352+00	2022-08-09 19:52:27.352+00
54	Anscarid	\N	\N	0850-01-01	2022-08-09 19:52:27.352+00	2022-08-09 19:52:27.352+00
55	Robertian	\N	\N	0800-01-01	2022-08-09 19:52:27.352+00	2022-08-09 19:52:27.352+00
56	Salian	\N	\N	1000-01-01	2022-08-09 19:52:27.352+00	2022-08-09 19:52:27.352+00
57	Ottonian	\N	\N	0912-01-01	2022-08-09 19:52:27.352+00	2022-08-09 19:52:27.352+00
58	Bellonid	\N	\N	0800-01-01	2022-08-09 19:53:38.069+00	2022-08-09 19:53:38.069+00
59	Jiménez	\N	\N	0850-01-01	2022-08-09 19:53:38.069+00	2022-08-09 19:53:38.069+00
60	Anscarid	\N	\N	0850-01-01	2022-08-09 19:53:38.069+00	2022-08-09 19:53:38.069+00
61	Robertian	\N	\N	0800-01-01	2022-08-09 19:53:38.069+00	2022-08-09 19:53:38.069+00
62	Salian	\N	\N	1000-01-01	2022-08-09 19:53:38.069+00	2022-08-09 19:53:38.069+00
63	Ottonian	\N	\N	0912-01-01	2022-08-09 19:53:38.069+00	2022-08-09 19:53:38.069+00
64	Bellonid	\N	\N	0800-01-01	2022-08-09 19:55:38.141+00	2022-08-09 19:55:38.141+00
65	Jiménez	\N	\N	0850-01-01	2022-08-09 19:55:38.141+00	2022-08-09 19:55:38.141+00
66	Anscarid	\N	\N	0850-01-01	2022-08-09 19:55:38.141+00	2022-08-09 19:55:38.141+00
67	Robertian	\N	\N	0800-01-01	2022-08-09 19:55:38.141+00	2022-08-09 19:55:38.141+00
68	Salian	\N	\N	1000-01-01	2022-08-09 19:55:38.141+00	2022-08-09 19:55:38.141+00
69	Ottonian	\N	\N	0912-01-01	2022-08-09 19:55:38.141+00	2022-08-09 19:55:38.141+00
70	Bellonid	\N	\N	0800-01-01	2022-08-09 20:02:14.174+00	2022-08-09 20:02:14.174+00
71	Jiménez	\N	\N	0850-01-01	2022-08-09 20:02:14.174+00	2022-08-09 20:02:14.174+00
72	Anscarid	\N	\N	0850-01-01	2022-08-09 20:02:14.174+00	2022-08-09 20:02:14.174+00
73	Robertian	\N	\N	0800-01-01	2022-08-09 20:02:14.174+00	2022-08-09 20:02:14.174+00
74	Salian	\N	\N	1000-01-01	2022-08-09 20:02:14.174+00	2022-08-09 20:02:14.174+00
75	Ottonian	\N	\N	0912-01-01	2022-08-09 20:02:14.174+00	2022-08-09 20:02:14.174+00
76	Bellonid	\N	\N	0800-01-01	2022-08-09 20:08:36.654+00	2022-08-09 20:08:36.654+00
77	Jiménez	\N	\N	0850-01-01	2022-08-09 20:08:36.654+00	2022-08-09 20:08:36.654+00
78	Anscarid	\N	\N	0850-01-01	2022-08-09 20:08:36.654+00	2022-08-09 20:08:36.654+00
79	Robertian	\N	\N	0800-01-01	2022-08-09 20:08:36.654+00	2022-08-09 20:08:36.654+00
80	Salian	\N	\N	1000-01-01	2022-08-09 20:08:36.654+00	2022-08-09 20:08:36.654+00
81	Ottonian	\N	\N	0912-01-01	2022-08-09 20:08:36.654+00	2022-08-09 20:08:36.654+00
82	Bellonid	\N	\N	0800-01-01	2022-08-09 20:10:05.409+00	2022-08-09 20:10:05.409+00
83	Jiménez	\N	\N	0850-01-01	2022-08-09 20:10:05.409+00	2022-08-09 20:10:05.409+00
84	Anscarid	\N	\N	0850-01-01	2022-08-09 20:10:05.409+00	2022-08-09 20:10:05.409+00
85	Robertian	\N	\N	0800-01-01	2022-08-09 20:10:05.409+00	2022-08-09 20:10:05.409+00
86	Salian	\N	\N	1000-01-01	2022-08-09 20:10:05.409+00	2022-08-09 20:10:05.409+00
87	Ottonian	\N	\N	0912-01-01	2022-08-09 20:10:05.409+00	2022-08-09 20:10:05.409+00
88	Bellonid	\N	\N	0800-01-01	2022-08-09 20:11:47.843+00	2022-08-09 20:11:47.843+00
89	Jiménez	\N	\N	0850-01-01	2022-08-09 20:11:47.843+00	2022-08-09 20:11:47.843+00
90	Anscarid	\N	\N	0850-01-01	2022-08-09 20:11:47.843+00	2022-08-09 20:11:47.843+00
91	Robertian	\N	\N	0800-01-01	2022-08-09 20:11:47.843+00	2022-08-09 20:11:47.843+00
92	Salian	\N	\N	1000-01-01	2022-08-09 20:11:47.843+00	2022-08-09 20:11:47.843+00
93	Ottonian	\N	\N	0912-01-01	2022-08-09 20:11:47.843+00	2022-08-09 20:11:47.843+00
94	Bellonid	\N	\N	0800-01-01	2022-08-09 20:14:53.265+00	2022-08-09 20:14:53.265+00
95	Jiménez	\N	\N	0850-01-01	2022-08-09 20:14:53.265+00	2022-08-09 20:14:53.265+00
96	Anscarid	\N	\N	0850-01-01	2022-08-09 20:14:53.265+00	2022-08-09 20:14:53.265+00
97	Robertian	\N	\N	0800-01-01	2022-08-09 20:14:53.265+00	2022-08-09 20:14:53.265+00
98	Salian	\N	\N	1000-01-01	2022-08-09 20:14:53.265+00	2022-08-09 20:14:53.265+00
99	Ottonian	\N	\N	0912-01-01	2022-08-09 20:14:53.265+00	2022-08-09 20:14:53.265+00
100	Bellonid	\N	\N	0800-01-01	2022-08-09 20:16:35.595+00	2022-08-09 20:16:35.595+00
101	Jiménez	\N	\N	0850-01-01	2022-08-09 20:16:35.595+00	2022-08-09 20:16:35.595+00
102	Anscarid	\N	\N	0850-01-01	2022-08-09 20:16:35.595+00	2022-08-09 20:16:35.595+00
103	Robertian	\N	\N	0800-01-01	2022-08-09 20:16:35.595+00	2022-08-09 20:16:35.595+00
104	Salian	\N	\N	1000-01-01	2022-08-09 20:16:35.595+00	2022-08-09 20:16:35.595+00
105	Ottonian	\N	\N	0912-01-01	2022-08-09 20:16:35.595+00	2022-08-09 20:16:35.595+00
133	Bellonid	\N	\N	0800-01-01	2022-08-09 20:19:15.047+00	2022-08-09 20:19:15.047+00
134	Jiménez	\N	\N	0850-01-01	2022-08-09 20:19:15.047+00	2022-08-09 20:19:15.047+00
135	Anscarid	\N	\N	0850-01-01	2022-08-09 20:19:15.047+00	2022-08-09 20:19:15.047+00
136	Robertian	\N	\N	0800-01-01	2022-08-09 20:19:15.047+00	2022-08-09 20:19:15.047+00
137	Salian	\N	\N	1000-01-01	2022-08-09 20:19:15.047+00	2022-08-09 20:19:15.047+00
138	Ottonian	\N	\N	0912-01-01	2022-08-09 20:19:15.047+00	2022-08-09 20:19:15.047+00
166	Bellonid	\N	\N	0800-01-01	2022-08-09 20:39:04.746+00	2022-08-09 20:39:04.746+00
167	Jiménez	\N	\N	0850-01-01	2022-08-09 20:39:04.746+00	2022-08-09 20:39:04.746+00
168	Anscarid	\N	\N	0850-01-01	2022-08-09 20:39:04.746+00	2022-08-09 20:39:04.746+00
169	Robertian	\N	\N	0800-01-01	2022-08-09 20:39:04.746+00	2022-08-09 20:39:04.746+00
170	Salian	\N	\N	1000-01-01	2022-08-09 20:39:04.746+00	2022-08-09 20:39:04.746+00
171	Ottonian	\N	\N	0912-01-01	2022-08-09 20:39:04.746+00	2022-08-09 20:39:04.746+00
172	Bellonid	\N	\N	0800-01-01	2022-08-10 22:09:43.154+00	2022-08-10 22:09:43.154+00
173	Jiménez	\N	\N	0850-01-01	2022-08-10 22:09:43.154+00	2022-08-10 22:09:43.154+00
174	Anscarid	\N	\N	0850-01-01	2022-08-10 22:09:43.154+00	2022-08-10 22:09:43.154+00
175	Robertian	\N	\N	0800-01-01	2022-08-10 22:09:43.154+00	2022-08-10 22:09:43.154+00
176	Salian	\N	\N	1000-01-01	2022-08-10 22:09:43.154+00	2022-08-10 22:09:43.154+00
177	Ottonian	\N	\N	0912-01-01	2022-08-10 22:09:43.154+00	2022-08-10 22:09:43.154+00
178	Bellonid	\N	\N	0800-01-01	2022-08-10 22:23:13.155+00	2022-08-10 22:23:13.155+00
179	Jiménez	\N	\N	0850-01-01	2022-08-10 22:23:13.155+00	2022-08-10 22:23:13.155+00
180	Anscarid	\N	\N	0850-01-01	2022-08-10 22:23:13.155+00	2022-08-10 22:23:13.155+00
181	Robertian	\N	\N	0800-01-01	2022-08-10 22:23:13.155+00	2022-08-10 22:23:13.155+00
182	Salian	\N	\N	1000-01-01	2022-08-10 22:23:13.155+00	2022-08-10 22:23:13.155+00
183	Ottonian	\N	\N	0912-01-01	2022-08-10 22:23:13.155+00	2022-08-10 22:23:13.155+00
184	Bellonid	\N	\N	0800-01-01	2022-08-10 22:34:32.287+00	2022-08-10 22:34:32.287+00
185	Jiménez	\N	\N	0850-01-01	2022-08-10 22:34:32.287+00	2022-08-10 22:34:32.287+00
186	Anscarid	\N	\N	0850-01-01	2022-08-10 22:34:32.287+00	2022-08-10 22:34:32.287+00
187	Robertian	\N	\N	0800-01-01	2022-08-10 22:34:32.287+00	2022-08-10 22:34:32.287+00
188	Salian	\N	\N	1000-01-01	2022-08-10 22:34:32.287+00	2022-08-10 22:34:32.287+00
189	Ottonian	\N	\N	0912-01-01	2022-08-10 22:34:32.287+00	2022-08-10 22:34:32.287+00
217	Bellonid	\N	\N	0800-01-01	2022-08-10 22:39:08.066+00	2022-08-10 22:39:08.066+00
218	Jiménez	\N	\N	0850-01-01	2022-08-10 22:39:08.066+00	2022-08-10 22:39:08.066+00
219	Anscarid	\N	\N	0850-01-01	2022-08-10 22:39:08.066+00	2022-08-10 22:39:08.066+00
220	Robertian	\N	\N	0800-01-01	2022-08-10 22:39:08.066+00	2022-08-10 22:39:08.066+00
221	Salian	\N	\N	1000-01-01	2022-08-10 22:39:08.066+00	2022-08-10 22:39:08.066+00
222	Ottonian	\N	\N	0912-01-01	2022-08-10 22:39:08.066+00	2022-08-10 22:39:08.066+00
223	Bellonid	\N	\N	0800-01-01	2022-08-10 22:48:51.553+00	2022-08-10 22:48:51.553+00
224	Jiménez	\N	\N	0850-01-01	2022-08-10 22:48:51.553+00	2022-08-10 22:48:51.553+00
225	Anscarid	\N	\N	0850-01-01	2022-08-10 22:48:51.553+00	2022-08-10 22:48:51.553+00
226	Robertian	\N	\N	0800-01-01	2022-08-10 22:48:51.553+00	2022-08-10 22:48:51.553+00
227	Salian	\N	\N	1000-01-01	2022-08-10 22:48:51.553+00	2022-08-10 22:48:51.553+00
228	Ottonian	\N	\N	0912-01-01	2022-08-10 22:48:51.553+00	2022-08-10 22:48:51.553+00
256	Bellonid	\N	\N	0800-01-01	2022-08-10 22:51:09.14+00	2022-08-10 22:51:09.14+00
257	Jiménez	\N	\N	0850-01-01	2022-08-10 22:51:09.14+00	2022-08-10 22:51:09.14+00
258	Anscarid	\N	\N	0850-01-01	2022-08-10 22:51:09.14+00	2022-08-10 22:51:09.14+00
259	Robertian	\N	\N	0800-01-01	2022-08-10 22:51:09.14+00	2022-08-10 22:51:09.14+00
260	Salian	\N	\N	1000-01-01	2022-08-10 22:51:09.14+00	2022-08-10 22:51:09.14+00
261	Ottonian	\N	\N	0912-01-01	2022-08-10 22:51:09.14+00	2022-08-10 22:51:09.14+00
289	Bellonid	\N	\N	0800-01-01	2022-08-10 22:55:16.955+00	2022-08-10 22:55:16.955+00
290	Jiménez	\N	\N	0850-01-01	2022-08-10 22:55:16.955+00	2022-08-10 22:55:16.955+00
291	Anscarid	\N	\N	0850-01-01	2022-08-10 22:55:16.955+00	2022-08-10 22:55:16.955+00
292	Robertian	\N	\N	0800-01-01	2022-08-10 22:55:16.955+00	2022-08-10 22:55:16.955+00
293	Salian	\N	\N	1000-01-01	2022-08-10 22:55:16.955+00	2022-08-10 22:55:16.955+00
294	Ottonian	\N	\N	0912-01-01	2022-08-10 22:55:16.955+00	2022-08-10 22:55:16.955+00
322	Bellonid	\N	\N	0800-01-01	2022-08-10 22:57:02.631+00	2022-08-10 22:57:02.631+00
323	Jiménez	\N	\N	0850-01-01	2022-08-10 22:57:02.631+00	2022-08-10 22:57:02.631+00
324	Anscarid	\N	\N	0850-01-01	2022-08-10 22:57:02.631+00	2022-08-10 22:57:02.631+00
325	Robertian	\N	\N	0800-01-01	2022-08-10 22:57:02.631+00	2022-08-10 22:57:02.631+00
326	Salian	\N	\N	1000-01-01	2022-08-10 22:57:02.631+00	2022-08-10 22:57:02.631+00
327	Ottonian	\N	\N	0912-01-01	2022-08-10 22:57:02.631+00	2022-08-10 22:57:02.631+00
\.


--
-- Data for Name: dynasty; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.dynasty (dynasty_id, dynasty_name, dynasty_head, dynasty_creator_id, dynasty_start) FROM stdin;
\.


--
-- Data for Name: families; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.families (id, family_name, family_head, dynasty_id, family_creator_id, family_start, cadet_of, "createdAt", "updatedAt") FROM stdin;
18	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-09 20:16:35.653+00	2022-08-09 20:16:35.653+00
19	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-09 20:16:35.683+00	2022-08-09 20:16:35.683+00
20	Urgell	\N	1	\N	0974-01-01	18	2022-08-09 20:16:35.683+00	2022-08-09 20:16:35.683+00
21	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-09 20:16:35.7+00	2022-08-09 20:16:35.7+00
51	Barcelona	\N	\N	\N	0878-01-01	\N	2022-08-09 20:19:15.012+00	2022-08-09 20:19:15.012+00
52	Cerdanya	\N	\N	\N	0878-01-01	\N	2022-08-09 20:19:15.067+00	2022-08-09 20:19:15.067+00
53	Urgell	\N	\N	\N	0974-01-01	\N	2022-08-09 20:19:15.067+00	2022-08-09 20:19:15.067+00
54	Forcalquier	\N	\N	\N	1094-01-01	\N	2022-08-09 20:19:15.089+00	2022-08-09 20:19:15.089+00
84	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-09 20:39:04.764+00	2022-08-09 20:39:04.764+00
85	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-09 20:39:04.786+00	2022-08-09 20:39:04.786+00
86	Urgell	\N	1	\N	0974-01-01	18	2022-08-09 20:39:04.786+00	2022-08-09 20:39:04.786+00
87	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-09 20:39:04.797+00	2022-08-09 20:39:04.797+00
88	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-10 22:09:43.176+00	2022-08-10 22:09:43.176+00
89	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-10 22:09:43.2+00	2022-08-10 22:09:43.2+00
90	Urgell	\N	1	\N	0974-01-01	18	2022-08-10 22:09:43.2+00	2022-08-10 22:09:43.2+00
91	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-10 22:09:43.21+00	2022-08-10 22:09:43.21+00
92	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-10 22:23:13.193+00	2022-08-10 22:23:13.193+00
93	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-10 22:23:13.226+00	2022-08-10 22:23:13.226+00
94	Urgell	\N	1	\N	0974-01-01	18	2022-08-10 22:23:13.226+00	2022-08-10 22:23:13.226+00
95	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-10 22:23:13.239+00	2022-08-10 22:23:13.239+00
96	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-10 22:34:32.352+00	2022-08-10 22:34:32.352+00
97	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-10 22:34:32.45+00	2022-08-10 22:34:32.45+00
98	Urgell	\N	1	\N	0974-01-01	18	2022-08-10 22:34:32.45+00	2022-08-10 22:34:32.45+00
99	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-10 22:34:32.479+00	2022-08-10 22:34:32.479+00
129	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-10 22:39:08.111+00	2022-08-10 22:39:08.111+00
130	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-10 22:39:08.146+00	2022-08-10 22:39:08.146+00
131	Urgell	\N	1	\N	0974-01-01	18	2022-08-10 22:39:08.146+00	2022-08-10 22:39:08.146+00
132	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-10 22:39:08.156+00	2022-08-10 22:39:08.156+00
133	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-10 22:48:51.576+00	2022-08-10 22:48:51.576+00
134	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-10 22:48:51.597+00	2022-08-10 22:48:51.597+00
135	Urgell	\N	1	\N	0974-01-01	18	2022-08-10 22:48:51.597+00	2022-08-10 22:48:51.597+00
136	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-10 22:48:51.609+00	2022-08-10 22:48:51.609+00
166	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-10 22:51:09.196+00	2022-08-10 22:51:09.196+00
167	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-10 22:51:09.221+00	2022-08-10 22:51:09.221+00
168	Urgell	\N	1	\N	0974-01-01	18	2022-08-10 22:51:09.221+00	2022-08-10 22:51:09.221+00
169	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-10 22:51:09.23+00	2022-08-10 22:51:09.23+00
199	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-10 22:55:17.026+00	2022-08-10 22:55:17.026+00
200	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-10 22:55:17.056+00	2022-08-10 22:55:17.056+00
201	Urgell	\N	1	\N	0974-01-01	18	2022-08-10 22:55:17.056+00	2022-08-10 22:55:17.056+00
202	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-10 22:55:17.073+00	2022-08-10 22:55:17.073+00
232	Barcelona	\N	1	\N	0878-01-01	\N	2022-08-10 22:57:02.672+00	2022-08-10 22:57:02.672+00
233	Cerdanya	\N	1	\N	0878-01-01	18	2022-08-10 22:57:02.694+00	2022-08-10 22:57:02.694+00
234	Urgell	\N	1	\N	0974-01-01	18	2022-08-10 22:57:02.694+00	2022-08-10 22:57:02.694+00
235	Forcalquier	\N	1	\N	1094-01-01	20	2022-08-10 22:57:02.702+00	2022-08-10 22:57:02.702+00
\.


--
-- Data for Name: family; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.family (family_id, family_name, dynasty_id, family_head, family_creator_id, family_start, cadet_of) FROM stdin;
\.


--
-- Data for Name: occupation; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.occupation (occupation_id, occupation_type, occupation_start, occupation_end, occupation_info, person_id) FROM stdin;
\.


--
-- Data for Name: ownership; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.ownership (ownership_id, property_id, person_id, ownership_start, ownership_end, ownership_source) FROM stdin;
\.


--
-- Data for Name: parent; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.parent (parent_id, person_id, parent_person_id, parent_type) FROM stdin;
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.people (id, name_first, name_by, name_middle, name_maiden, name_last, gender, date_birth, date_death, place_birth, place_death, cause_death, family_id, person_source, dynasty_id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.person (person_id, name_first, name_by, name_middle, name_maiden, name_last, gender, date_birth, date_death, place_birth, place_death, cause_death, family_id, person_source, dynasty_id) FROM stdin;
\.


--
-- Data for Name: property; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.property (property_id, property_size, property_name, property_type, property_creation, property_start, property_creator_id) FROM stdin;
\.


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.relationship (relationship_id, relationship_type, relationship_start, relationship_end, person_1, person_2, person_1_role, person_2_role, relationship_notes, relationship_source) FROM stdin;
\.


--
-- Name: dynasties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.dynasties_id_seq', 354, true);


--
-- Name: dynasty_dynasty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.dynasty_dynasty_id_seq', 1, false);


--
-- Name: families_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.families_id_seq', 264, true);


--
-- Name: family_family_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.family_family_id_seq', 1, false);


--
-- Name: occupation_occupation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.occupation_occupation_id_seq', 1, false);


--
-- Name: ownership_ownership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.ownership_ownership_id_seq', 1, false);


--
-- Name: parent_parent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.parent_parent_id_seq', 1, false);


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.people_id_seq', 1, false);


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.person_person_id_seq', 1, false);


--
-- Name: property_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.property_property_id_seq', 1, false);


--
-- Name: relationship_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.relationship_relationship_id_seq', 1, false);


--
-- Name: dynasties dynasties_pkey; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.dynasties
    ADD CONSTRAINT dynasties_pkey PRIMARY KEY (id);


--
-- Name: dynasty dynasty_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.dynasty
    ADD CONSTRAINT dynasty_pk PRIMARY KEY (dynasty_id);


--
-- Name: families families_pkey; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_pkey PRIMARY KEY (id);


--
-- Name: family family_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_pk PRIMARY KEY (family_id);


--
-- Name: occupation occupation_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.occupation
    ADD CONSTRAINT occupation_pk PRIMARY KEY (occupation_id);


--
-- Name: ownership ownership_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.ownership
    ADD CONSTRAINT ownership_pk PRIMARY KEY (ownership_id);


--
-- Name: parent parent_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.parent
    ADD CONSTRAINT parent_pk PRIMARY KEY (parent_id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: person person_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pk PRIMARY KEY (person_id);


--
-- Name: property property_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_pk PRIMARY KEY (property_id);


--
-- Name: relationship relationship_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_pk PRIMARY KEY (relationship_id);


--
-- Name: dynasty dynasty_fk0; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.dynasty
    ADD CONSTRAINT dynasty_fk0 FOREIGN KEY (dynasty_head) REFERENCES public.person(person_id);


--
-- Name: dynasty dynasty_fk1; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.dynasty
    ADD CONSTRAINT dynasty_fk1 FOREIGN KEY (dynasty_creator_id) REFERENCES public.person(person_id);


--
-- Name: family family_fk0; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_fk0 FOREIGN KEY (dynasty_id) REFERENCES public.dynasty(dynasty_id);


--
-- Name: family family_fk1; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_fk1 FOREIGN KEY (family_head) REFERENCES public.person(person_id);


--
-- Name: family family_fk2; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_fk2 FOREIGN KEY (family_creator_id) REFERENCES public.person(person_id);


--
-- Name: occupation occupation_fk0; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.occupation
    ADD CONSTRAINT occupation_fk0 FOREIGN KEY (person_id) REFERENCES public.person(person_id);


--
-- Name: ownership ownership_fk0; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.ownership
    ADD CONSTRAINT ownership_fk0 FOREIGN KEY (property_id) REFERENCES public.property(property_id);


--
-- Name: ownership ownership_fk1; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.ownership
    ADD CONSTRAINT ownership_fk1 FOREIGN KEY (person_id) REFERENCES public.person(person_id);


--
-- Name: parent parent_fk0; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.parent
    ADD CONSTRAINT parent_fk0 FOREIGN KEY (person_id) REFERENCES public.person(person_id);


--
-- Name: parent parent_fk1; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.parent
    ADD CONSTRAINT parent_fk1 FOREIGN KEY (parent_person_id) REFERENCES public.person(person_id);


--
-- Name: person person_fk0; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_fk0 FOREIGN KEY (family_id) REFERENCES public.family(family_id);


--
-- Name: person person_fk1; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_fk1 FOREIGN KEY (dynasty_id) REFERENCES public.dynasty(dynasty_id);


--
-- Name: property property_fk0; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_fk0 FOREIGN KEY (property_creator_id) REFERENCES public.person(person_id);


--
-- Name: relationship relationship_fk0; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_fk0 FOREIGN KEY (person_1) REFERENCES public.person(person_id);


--
-- Name: relationship relationship_fk1; Type: FK CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_fk1 FOREIGN KEY (person_2) REFERENCES public.person(person_id);


--
-- PostgreSQL database dump complete
--

