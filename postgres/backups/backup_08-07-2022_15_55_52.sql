--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE "iber-db";




--
-- Drop roles
--

DROP ROLE mattsii;


--
-- Roles
--

CREATE ROLE mattsii;
ALTER ROLE mattsii WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md50bef4a70083a709205017a3baeb32638';






--
-- Databases
--

--
-- Database "template1" dump
--

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: mattsii
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO mattsii;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: mattsii
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: mattsii
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: mattsii
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "iber-db" dump
--

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

--
-- Name: iber-db; Type: DATABASE; Schema: -; Owner: mattsii
--

CREATE DATABASE "iber-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE "iber-db" OWNER TO mattsii;

\connect -reuse-previous=on "dbname='iber-db'"

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

SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- Name: public.dynasty dynasty_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.dynasty"
    ADD CONSTRAINT dynasty_pk PRIMARY KEY (dynasty_id);


--
-- Name: public.family family_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.family"
    ADD CONSTRAINT family_pk PRIMARY KEY (family_id);


--
-- Name: public.occupation occupation_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.occupation"
    ADD CONSTRAINT occupation_pk PRIMARY KEY (occupation_id);


--
-- Name: public.ownership ownership_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.ownership"
    ADD CONSTRAINT ownership_pk PRIMARY KEY (ownership_id);


--
-- Name: public.parent parent_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.parent"
    ADD CONSTRAINT parent_pk PRIMARY KEY (parent_id);


--
-- Name: public.person person_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.person"
    ADD CONSTRAINT person_pk PRIMARY KEY (person_id);


--
-- Name: public.property property_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.property"
    ADD CONSTRAINT property_pk PRIMARY KEY (property_id);


--
-- Name: public.relationship relationship_pk; Type: CONSTRAINT; Schema: public; Owner: mattsii
--

ALTER TABLE ONLY public."public.relationship"
    ADD CONSTRAINT relationship_pk PRIMARY KEY (relationship_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: mattsii
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO mattsii;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: mattsii
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

