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
ALTER TABLE ONLY public.parent DROP CONSTRAINT parent_pk;
ALTER TABLE ONLY public.ownership DROP CONSTRAINT ownership_pk;
ALTER TABLE ONLY public.occupation DROP CONSTRAINT occupation_pk;
ALTER TABLE ONLY public.family DROP CONSTRAINT family_pk;
ALTER TABLE ONLY public.dynasty DROP CONSTRAINT dynasty_pk;
ALTER TABLE public.relationship ALTER COLUMN relationship_id DROP DEFAULT;
ALTER TABLE public."public.relationship" ALTER COLUMN relationship_id DROP DEFAULT;
ALTER TABLE public."public.property" ALTER COLUMN property_id DROP DEFAULT;
ALTER TABLE public."public.person" ALTER COLUMN person_id DROP DEFAULT;
ALTER TABLE public."public.parent" ALTER COLUMN parent_id DROP DEFAULT;
ALTER TABLE public."public.ownership" ALTER COLUMN ownership_id DROP DEFAULT;
ALTER TABLE public."public.occupation" ALTER COLUMN occupation_id DROP DEFAULT;
ALTER TABLE public."public.family" ALTER COLUMN family_id DROP DEFAULT;
ALTER TABLE public."public.dynasty" ALTER COLUMN dynasty_id DROP DEFAULT;
ALTER TABLE public.property ALTER COLUMN property_id DROP DEFAULT;
ALTER TABLE public.person ALTER COLUMN person_id DROP DEFAULT;
ALTER TABLE public.parent ALTER COLUMN parent_id DROP DEFAULT;
ALTER TABLE public.ownership ALTER COLUMN ownership_id DROP DEFAULT;
ALTER TABLE public.occupation ALTER COLUMN occupation_id DROP DEFAULT;
ALTER TABLE public.family ALTER COLUMN family_id DROP DEFAULT;
ALTER TABLE public.dynasty ALTER COLUMN dynasty_id DROP DEFAULT;
DROP SEQUENCE public.relationship_relationship_id_seq;
DROP TABLE public.relationship;
DROP SEQUENCE public."public.relationship_relationship_id_seq";
DROP TABLE public."public.relationship";
DROP SEQUENCE public."public.property_property_id_seq";
DROP TABLE public."public.property";
DROP SEQUENCE public."public.person_person_id_seq";
DROP TABLE public."public.person";
DROP SEQUENCE public."public.parent_parent_id_seq";
DROP TABLE public."public.parent";
DROP SEQUENCE public."public.ownership_ownership_id_seq";
DROP TABLE public."public.ownership";
DROP SEQUENCE public."public.occupation_occupation_id_seq";
DROP TABLE public."public.occupation";
DROP SEQUENCE public."public.family_family_id_seq";
DROP TABLE public."public.family";
DROP SEQUENCE public."public.dynasty_dynasty_id_seq";
DROP TABLE public."public.dynasty";
DROP SEQUENCE public.property_property_id_seq;
DROP TABLE public.property;
DROP SEQUENCE public.person_person_id_seq;
DROP TABLE public.person;
DROP SEQUENCE public.parent_parent_id_seq;
DROP TABLE public.parent;
DROP SEQUENCE public.ownership_ownership_id_seq;
DROP TABLE public.ownership;
DROP SEQUENCE public.occupation_occupation_id_seq;
DROP TABLE public.occupation;
DROP SEQUENCE public.family_family_id_seq;
DROP TABLE public.family;
DROP SEQUENCE public.dynasty_dynasty_id_seq;
DROP TABLE public.dynasty;
SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- Name: family; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public.family (
    family_id integer NOT NULL,
    family_name character varying NOT NULL,
    dynasty_id integer,
    family_head integer,
    family_creator_id integer,
    family_start date
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
-- Name: public.dynasty; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public."public.dynasty" (
    dynasty_id integer NOT NULL,
    dynasty_name character varying NOT NULL,
    dynasty_head integer,
    dynasty_creator_id integer,
    dynasty_start date
);


ALTER TABLE public."public.dynasty" OWNER TO mattsii;

--
-- Name: public.dynasty_dynasty_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public."public.dynasty_dynasty_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.dynasty_dynasty_id_seq" OWNER TO mattsii;

--
-- Name: public.dynasty_dynasty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public."public.dynasty_dynasty_id_seq" OWNED BY public."public.dynasty".dynasty_id;


--
-- Name: public.family; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public."public.family" (
    family_id integer NOT NULL,
    family_name character varying NOT NULL,
    dynasty_id integer,
    family_head integer,
    family_creator_id integer,
    family_start date
);


ALTER TABLE public."public.family" OWNER TO mattsii;

--
-- Name: public.family_family_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public."public.family_family_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.family_family_id_seq" OWNER TO mattsii;

--
-- Name: public.family_family_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public."public.family_family_id_seq" OWNED BY public."public.family".family_id;


--
-- Name: public.occupation; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public."public.occupation" (
    occupation_id integer NOT NULL,
    occupation_type character varying NOT NULL,
    occupation_start date,
    occupation_end date,
    person_id integer NOT NULL
);


ALTER TABLE public."public.occupation" OWNER TO mattsii;

--
-- Name: public.occupation_occupation_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public."public.occupation_occupation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.occupation_occupation_id_seq" OWNER TO mattsii;

--
-- Name: public.occupation_occupation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public."public.occupation_occupation_id_seq" OWNED BY public."public.occupation".occupation_id;


--
-- Name: public.ownership; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public."public.ownership" (
    ownership_id integer NOT NULL,
    property_id integer NOT NULL,
    person_id integer NOT NULL,
    ownership_start date,
    ownership_end date,
    ownership_source text
);


ALTER TABLE public."public.ownership" OWNER TO mattsii;

--
-- Name: public.ownership_ownership_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public."public.ownership_ownership_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.ownership_ownership_id_seq" OWNER TO mattsii;

--
-- Name: public.ownership_ownership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public."public.ownership_ownership_id_seq" OWNED BY public."public.ownership".ownership_id;


--
-- Name: public.parent; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public."public.parent" (
    parent_id integer NOT NULL,
    person_id integer NOT NULL,
    parent_person_id integer NOT NULL,
    parent_type character varying NOT NULL
);


ALTER TABLE public."public.parent" OWNER TO mattsii;

--
-- Name: public.parent_parent_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public."public.parent_parent_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.parent_parent_id_seq" OWNER TO mattsii;

--
-- Name: public.parent_parent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public."public.parent_parent_id_seq" OWNED BY public."public.parent".parent_id;


--
-- Name: public.person; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public."public.person" (
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


ALTER TABLE public."public.person" OWNER TO mattsii;

--
-- Name: public.person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public."public.person_person_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.person_person_id_seq" OWNER TO mattsii;

--
-- Name: public.person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public."public.person_person_id_seq" OWNED BY public."public.person".person_id;


--
-- Name: public.property; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public."public.property" (
    property_id integer NOT NULL,
    property_size character varying,
    property_name character varying NOT NULL,
    property_type character varying NOT NULL,
    property_creation date,
    property_start date,
    property_creator_id integer
);


ALTER TABLE public."public.property" OWNER TO mattsii;

--
-- Name: public.property_property_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public."public.property_property_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.property_property_id_seq" OWNER TO mattsii;

--
-- Name: public.property_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public."public.property_property_id_seq" OWNED BY public."public.property".property_id;


--
-- Name: public.relationship; Type: TABLE; Schema: public; Owner: mattsii
--

CREATE TABLE public."public.relationship" (
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


ALTER TABLE public."public.relationship" OWNER TO mattsii;

--
-- Name: public.relationship_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: mattsii
--

CREATE SEQUENCE public."public.relationship_relationship_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.relationship_relationship_id_seq" OWNER TO mattsii;

--
-- Name: public.relationship_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mattsii
--

ALTER SEQUENCE public."public.relationship_relationship_id_seq" OWNED BY public."public.relationship".relationship_id;


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
-- Name: dynasty dynasty_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.dynasty ALTER COLUMN dynasty_id SET DEFAULT nextval('public.dynasty_dynasty_id_seq'::regclass);


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
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.person ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- Name: property property_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.property ALTER COLUMN property_id SET DEFAULT nextval('public.property_property_id_seq'::regclass);


--
-- Name: public.dynasty dynasty_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.dynasty" ALTER COLUMN dynasty_id SET DEFAULT nextval('public."public.dynasty_dynasty_id_seq"'::regclass);


--
-- Name: public.family family_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.family" ALTER COLUMN family_id SET DEFAULT nextval('public."public.family_family_id_seq"'::regclass);


--
-- Name: public.occupation occupation_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.occupation" ALTER COLUMN occupation_id SET DEFAULT nextval('public."public.occupation_occupation_id_seq"'::regclass);


--
-- Name: public.ownership ownership_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.ownership" ALTER COLUMN ownership_id SET DEFAULT nextval('public."public.ownership_ownership_id_seq"'::regclass);


--
-- Name: public.parent parent_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.parent" ALTER COLUMN parent_id SET DEFAULT nextval('public."public.parent_parent_id_seq"'::regclass);


--
-- Name: public.person person_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.person" ALTER COLUMN person_id SET DEFAULT nextval('public."public.person_person_id_seq"'::regclass);


--
-- Name: public.property property_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.property" ALTER COLUMN property_id SET DEFAULT nextval('public."public.property_property_id_seq"'::regclass);


--
-- Name: public.relationship relationship_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.relationship" ALTER COLUMN relationship_id SET DEFAULT nextval('public."public.relationship_relationship_id_seq"'::regclass);


--
-- Name: relationship relationship_id; Type: DEFAULT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.relationship ALTER COLUMN relationship_id SET DEFAULT nextval('public.relationship_relationship_id_seq'::regclass);


--
-- Data for Name: dynasty; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.dynasty (dynasty_id, dynasty_name, dynasty_head, dynasty_creator_id, dynasty_start) FROM stdin;
\.


--
-- Data for Name: family; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.family (family_id, family_name, dynasty_id, family_head, family_creator_id, family_start) FROM stdin;
\.


--
-- Data for Name: occupation; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.occupation (occupation_id, occupation_type, occupation_start, occupation_end, person_id) FROM stdin;
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
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.person (person_id, name_first, name_by, name_middle, name_maiden, name_last, gender, date_birth, date_death, place_birth, place_death, cause_death, family_id, person_source, dynasty_id) FROM stdin;
1	world	\N	\N	\N	\N	M	\N	\N	\N	\N	\N	\N	\N	\N
2	world2	\N	\N	\N	\N	M	\N	\N	\N	\N	\N	\N	\N	\N
3	world2	\N	\N	\N	\N	M	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: property; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.property (property_id, property_size, property_name, property_type, property_creation, property_start, property_creator_id) FROM stdin;
\.


--
-- Data for Name: public.dynasty; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public."public.dynasty" (dynasty_id, dynasty_name, dynasty_head, dynasty_creator_id, dynasty_start) FROM stdin;
\.


--
-- Data for Name: public.family; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public."public.family" (family_id, family_name, dynasty_id, family_head, family_creator_id, family_start) FROM stdin;
\.


--
-- Data for Name: public.occupation; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public."public.occupation" (occupation_id, occupation_type, occupation_start, occupation_end, person_id) FROM stdin;
\.


--
-- Data for Name: public.ownership; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public."public.ownership" (ownership_id, property_id, person_id, ownership_start, ownership_end, ownership_source) FROM stdin;
\.


--
-- Data for Name: public.parent; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public."public.parent" (parent_id, person_id, parent_person_id, parent_type) FROM stdin;
\.


--
-- Data for Name: public.person; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public."public.person" (person_id, name_first, name_by, name_middle, name_maiden, name_last, gender, date_birth, date_death, place_birth, place_death, cause_death, family_id, person_source, dynasty_id) FROM stdin;
\.


--
-- Data for Name: public.property; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public."public.property" (property_id, property_size, property_name, property_type, property_creation, property_start, property_creator_id) FROM stdin;
\.


--
-- Data for Name: public.relationship; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public."public.relationship" (relationship_id, relationship_type, relationship_start, relationship_end, person_1, person_2, person_1_role, person_2_role, relationship_notes, relationship_source) FROM stdin;
\.


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: mattsii
--

COPY public.relationship (relationship_id, relationship_type, relationship_start, relationship_end, person_1, person_2, person_1_role, person_2_role, relationship_notes, relationship_source) FROM stdin;
\.


--
-- Name: dynasty_dynasty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.dynasty_dynasty_id_seq', 1, false);


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
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.person_person_id_seq', 3, true);


--
-- Name: property_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.property_property_id_seq', 1, false);


--
-- Name: public.dynasty_dynasty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public."public.dynasty_dynasty_id_seq"', 1, false);


--
-- Name: public.family_family_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public."public.family_family_id_seq"', 1, false);


--
-- Name: public.occupation_occupation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public."public.occupation_occupation_id_seq"', 1, false);


--
-- Name: public.ownership_ownership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public."public.ownership_ownership_id_seq"', 1, false);


--
-- Name: public.parent_parent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public."public.parent_parent_id_seq"', 1, false);


--
-- Name: public.person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public."public.person_person_id_seq"', 1, false);


--
-- Name: public.property_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public."public.property_property_id_seq"', 1, false);


--
-- Name: public.relationship_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public."public.relationship_relationship_id_seq"', 1, false);


--
-- Name: relationship_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mattsii
--

SELECT pg_catalog.setval('public.relationship_relationship_id_seq', 1, false);


--
-- Name: dynasty dynasty_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public.dynasty
    ADD CONSTRAINT dynasty_pk PRIMARY KEY (dynasty_id);


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

