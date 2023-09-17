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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy_type; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.galaxy_type AS ENUM (
    'elliptical',
    'spiral',
    'lenticular',
    'irregular',
    'dwarf'
);


ALTER TYPE public.galaxy_type OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    name character varying(250) NOT NULL,
    blackhole_id integer NOT NULL,
    is_supermassive boolean NOT NULL
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(250) NOT NULL,
    age_in_billions_of_years numeric(10,5) NOT NULL,
    estimated_number_of_stars_in_billions integer,
    type public.galaxy_type
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    description text,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    star_id integer,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    lowest_temperature_in_kelvin integer,
    highest_temperature_in_kelvin integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(250),
    galaxy_id integer,
    distance_from_earth_in_light_years numeric NOT NULL,
    is_bigger_than_the_sun boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES ('Sagittarius A*', 1, true);
INSERT INTO public.blackhole VALUES ('Cygnus X-1', 2, false);
INSERT INTO public.blackhole VALUES ('M87', 3, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.51000, 100, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 2.73000, 40, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 13.00000, 1300, 'elliptical');
INSERT INTO public.galaxy VALUES (5, 'NGC 1300', 12.10000, 15, 'irregular');
INSERT INTO public.galaxy VALUES (6, 'NGC 4945', 3.60000, 10, 'dwarf');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.00000, 1000, 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Earch only natural satellite', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'A moon of Mars', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Another moon of Mars', false);
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, 'Largest moon in the solar system', false);
INSERT INTO public.moon VALUES (5, 'Callisto', 3, 'Another moon of Jupiter', false);
INSERT INTO public.moon VALUES (6, 'Io', 3, 'One of the most geolgically active moons', false);
INSERT INTO public.moon VALUES (7, 'Europa', 3, 'Water-rich moon of Jupiter', false);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 'Second largest moon in the solar system', false);
INSERT INTO public.moon VALUES (9, 'Triton', 6, 'A moon of Neptune', false);
INSERT INTO public.moon VALUES (10, 'Rhea', 5, 'Second-largest moon of Saturn', false);
INSERT INTO public.moon VALUES (11, 'Oberon', 6, 'A moon of Uranus', false);
INSERT INTO public.moon VALUES (12, 'Iapetus', 5, 'Another moon of Saturn', false);
INSERT INTO public.moon VALUES (13, 'Charon', 1, 'A moon of Pluto', false);
INSERT INTO public.moon VALUES (14, 'Hyperion', 5, 'An irregularly shaped moon of Saturn', false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 6, 'Another moon of Uranus', false);
INSERT INTO public.moon VALUES (16, 'Miranda', 6, 'Smallest and innermost of Uranus', false);
INSERT INTO public.moon VALUES (17, 'Phoebe', 5, 'Irregular moon of Saturn', false);
INSERT INTO public.moon VALUES (18, 'Amalthea', 3, 'Small moon of Jupiter', false);
INSERT INTO public.moon VALUES (19, 'Janus', 5, 'Co-orbital moon of Saturn', false);
INSERT INTO public.moon VALUES (20, 'Mimas', 5, 'A moon of Saturn with a large impact crater', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Our home planet', true, true, 184, 330);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'The Red Planet', false, true, 130, 308);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Largest planet in the Solar System', false, true, 110, 165);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 'Hottest planet', false, true, 737, 737);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 'Ice giant', false, true, 49, 60);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Farthest planet from the SUn', false, true, 72, 73);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2, 'Exoplanet', false, true, 200, 250);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri', 3, 'Exoplanet', false, true, 250, 300);
INSERT INTO public.planet VALUES (9, 'Gliese 581 d', 4, 'Exoplanet', false, true, 180, 240);
INSERT INTO public.planet VALUES (10, 'HD 40307 g', 5, 'Exoplanet', false, true, 200, 260);
INSERT INTO public.planet VALUES (11, 'WASP-12b', 6, 'Hot Jupiter', false, true, 2500, 3000);
INSERT INTO public.planet VALUES (13, 'HAT-P-11b', 6, 'Exoplanet', false, true, 500, 600);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 8.6, true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 642.5, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4.24, false);
INSERT INTO public.star VALUES (4, 'Vega', 2, 25.04, true);
INSERT INTO public.star VALUES (5, 'Rigel', 3, 860, true);
INSERT INTO public.star VALUES (6, 'Aldebaran', 4, 65, true);
INSERT INTO public.star VALUES (9, 'Sun', 1, 0, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 9, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

