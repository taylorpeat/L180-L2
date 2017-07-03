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
    CONSTRAINT date_range CHECK (((year >= 1900) AND (year <= 2100))),
    CONSTRAINT director_check CHECK (((length((director)::text) >= 3) AND ((director)::text ~~ '% %'::text)))
);


ALTER TABLE films OWNER TO taylorpeat;

--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

INSERT INTO films VALUES ('Die Hard', 1988, 'action', 'John McTiernan', 132);
INSERT INTO films VALUES ('Casablanca', 1942, 'drama', 'Michael Curtiz', 102);
INSERT INTO films VALUES ('The Conversation', 1974, 'thriller', 'Francis Ford Coppola', 113);
INSERT INTO films VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90);
INSERT INTO films VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);
INSERT INTO films VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);
INSERT INTO films VALUES ('1', 1999, 'action', 'Me Me', 124);


--
-- PostgreSQL database dump complete
--

