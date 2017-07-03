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
-- Name: films; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE films (
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    director character varying(255) NOT NULL,
    duration integer NOT NULL,
    id integer NOT NULL,
    CONSTRAINT director_name CHECK (((length((director)::text) >= 1) AND ("position"((director)::text, ' '::text) > 0))),
    CONSTRAINT title_length CHECK ((length((title)::text) >= 1)),
    CONSTRAINT year_range CHECK (((year >= 1900) AND (year <= 2100)))
);


ALTER TABLE films OWNER TO taylorpeat;

--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE films_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE films_id_seq OWNER TO taylorpeat;

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE films_id_seq OWNED BY films.id;


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY films ALTER COLUMN id SET DEFAULT nextval('films_id_seq'::regclass);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

INSERT INTO films VALUES ('Die Hard', 1988, 'action', 'John McTiernan', 132, 1);
INSERT INTO films VALUES ('Casablanca', 1942, 'drama', 'Michael Curtiz', 102, 2);
INSERT INTO films VALUES ('The Conversation', 1974, 'thriller', 'Francis Ford Coppola', 113, 3);
INSERT INTO films VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90, 4);
INSERT INTO films VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127, 5);
INSERT INTO films VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118, 6);
INSERT INTO films VALUES ('Godzilla', 1998, 'scifi', 'Roland Emmerich', 139, 7);
INSERT INTO films VALUES ('Godzilla', 2014, 'scifi', 'Gareth Edwards', 123, 8);


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('films_id_seq', 8, true);


--
-- PostgreSQL database dump complete
--

