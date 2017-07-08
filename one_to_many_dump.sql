--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: calls; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE calls (
    id integer NOT NULL,
    "when" timestamp without time zone NOT NULL,
    duration integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE calls OWNER TO taylorpeat;

--
-- Name: calls_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE calls_id_seq OWNER TO taylorpeat;

--
-- Name: calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE calls_id_seq OWNED BY calls.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE contacts (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    number character varying(10) NOT NULL
);


ALTER TABLE contacts OWNER TO taylorpeat;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacts_id_seq OWNER TO taylorpeat;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: calls id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY calls ALTER COLUMN id SET DEFAULT nextval('calls_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Data for Name: calls; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY calls (id, "when", duration, contact_id) FROM stdin;
1	2016-01-02 04:59:00	1821	6
2	2016-01-08 15:30:00	350	17
3	2016-01-11 11:06:00	111	25
4	2016-01-13 18:13:00	2521	25
5	2016-01-17 09:43:00	982	17
6	2016-01-18 14:47:00	632	6
7	2016-01-17 11:52:00	175	26
8	2016-01-18 21:22:00	79	27
\.


--
-- Name: calls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('calls_id_seq', 8, true);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY contacts (id, first_name, last_name, number) FROM stdin;
6	William	Swift	7204890809
17	Yuan	Ku	2195677796
25	Tamila	Chichigov	5702700921
26	Merve	Elk	6343511126
27	Sawa	Fyodorov	6125594874
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('contacts_id_seq', 28, true);


--
-- Name: calls calls_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY calls
    ADD CONSTRAINT calls_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: contacts number_unique; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT number_unique UNIQUE (number);


--
-- Name: calls calls_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY calls
    ADD CONSTRAINT calls_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES contacts(id);


--
-- PostgreSQL database dump complete
--

