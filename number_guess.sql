--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guessing;
--
-- Name: number_guessing; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing OWNER TO freecodecamp;

\connect number_guessing

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
-- Name: users_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users_info (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users_info OWNER TO freecodecamp;

--
-- Name: users_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_info_user_id_seq OWNED BY public.users_info.user_id;


--
-- Name: users_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_info ALTER COLUMN user_id SET DEFAULT nextval('public.users_info_user_id_seq'::regclass);


--
-- Data for Name: users_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users_info VALUES (44, 'user_1681778856735', 2, 315);
INSERT INTO public.users_info VALUES (43, 'user_1681778856736', 5, 5);
INSERT INTO public.users_info VALUES (46, 'user_1681778866841', 2, 170);
INSERT INTO public.users_info VALUES (45, 'user_1681778866842', 5, 280);
INSERT INTO public.users_info VALUES (48, 'user_1681778876139', 2, 645);
INSERT INTO public.users_info VALUES (47, 'user_1681778876140', 5, 307);
INSERT INTO public.users_info VALUES (49, 'mark', 1, 1);
INSERT INTO public.users_info VALUES (51, 'user_1681778921433', 2, 255);
INSERT INTO public.users_info VALUES (50, 'user_1681778921434', 5, 92);
INSERT INTO public.users_info VALUES (53, 'user_1681778934488', 2, 310);
INSERT INTO public.users_info VALUES (52, 'user_1681778934489', 5, 220);
INSERT INTO public.users_info VALUES (55, 'user_1681778969094', 2, 303);
INSERT INTO public.users_info VALUES (54, 'user_1681778969095', 5, 231);


--
-- Name: users_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_info_user_id_seq', 55, true);


--
-- Name: users_info users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_info
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

