--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    distance integer,
    galaxy_types character varying(100),
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    distance_from_earth integer,
    age_in_millions_of_years integer NOT NULL,
    mass numeric(10,2),
    is_spherical boolean,
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    distance_from_earth integer,
    age_in_millions_of_years integer NOT NULL,
    mass numeric(10,2),
    has_life boolean,
    galaxy_types text,
    star_id integer,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(50),
    description text,
    distance_from_earth integer,
    mission_duration integer,
    mission_type character varying(50) NOT NULL,
    spacecraft_name character varying(50)
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_types text,
    distance_from_earth integer,
    age_in_millions_of_years integer NOT NULL,
    mass numeric(30,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is a large barred spiral galaxy. All the stars we see in the night sky are in our own Milky Way Galaxy', 100000, 'barred spiral galaxy', 26670);
INSERT INTO public.galaxy VALUES (2, 'Elliptical Galaxies', 'Anelliptical galaxy is a type of galaxy with an approximately ellipsoidal shape and a smooth, nearly featureless image.', 650000, 'ellipsoidal shape', 6000000);
INSERT INTO public.galaxy VALUES (3, 'Spiral Galaxy', 'A spiral galaxy has a distinct pinwheel shape with a central bulge and spiral arms, composed of stars, gas, and dust.', 1200000, 'Spiral', 2500000);
INSERT INTO public.galaxy VALUES (4, 'Irregular Galaxy', 'An irregular galaxy is a galaxy that does not have a regular shape like spiral or elliptical galaxies, often chaotic in appearance.', 3000000, 'Irregular', 4500000);
INSERT INTO public.galaxy VALUES (5, 'Lenticular Galaxy', 'A lenticular galaxy is an intermediate form between an elliptical and a spiral galaxy, having a central bulge but no spiral arms.', 1800000, 'Lenticular', 3500000);
INSERT INTO public.galaxy VALUES (6, 'Dwarf Galaxy', 'A dwarf galaxy is a small galaxy composed of up to several billion stars, much smaller than the Milky Way.', 500000, 'Dwarf', 1000000);
INSERT INTO public.galaxy VALUES (7, 'Peculiar Galaxy', 'A peculiar galaxy has an unusual shape, size, or composition that makes it stand out from standard galaxy types.', 2200000, 'Peculiar', 2700000);
INSERT INTO public.galaxy VALUES (8, 'Ring Galaxy', 'A ring galaxy is characterized by a ring-like appearance with a central region of little to no stars, often formed by collisions.', 2400000, 'Ring', 3200000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 4600, 7340000.00, true, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 9376, 4600, 9000000.00, true, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 4600, 6200000.00, true, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 421700, 4600, 4080000.00, true, false, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 670900, 4600, 4500000.00, true, false, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400, 4600, 6000000.00, true, false, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700, 4600, 4200000.00, true, false, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 1221700, 4600, 4700000.00, true, false, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 238000, 4600, 5200000.00, true, false, 4);
INSERT INTO public.moon VALUES (10, 'Mimas', 185000, 4600, 3300000.00, true, false, 4);
INSERT INTO public.moon VALUES (11, 'Triton', 3548000, 4600, 4000000.00, true, false, 5);
INSERT INTO public.moon VALUES (12, 'Charon', 1957000, 4600, 4200000.00, true, false, 5);
INSERT INTO public.moon VALUES (13, 'Titania', 436300, 4600, 4800000.00, true, false, 6);
INSERT INTO public.moon VALUES (14, 'Oberon', 583500, 4600, 4100000.00, true, false, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 527040, 4600, 4800000.00, true, false, 7);
INSERT INTO public.moon VALUES (16, 'Iapetus', 3560000, 4600, 4700000.00, true, false, 7);
INSERT INTO public.moon VALUES (17, 'Ceres', 413000, 4600, 3200000.00, true, false, 8);
INSERT INTO public.moon VALUES (18, 'Miranda', 1296000, 4600, 3600000.00, true, false, 9);
INSERT INTO public.moon VALUES (19, 'Hyperion', 1500000, 4600, 4400000.00, true, false, 10);
INSERT INTO public.moon VALUES (20, 'MoonIO', 384400, 4600, 7340000.00, true, false, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 91700, 4600, 3300000.00, false, 'Barred Spiral Galaxy', 7, true);
INSERT INTO public.planet VALUES (2, 'Venus', 41400, 4600, 4860000.00, false, 'Barred Spiral Galaxy', 7, true);
INSERT INTO public.planet VALUES (3, 'Earth', 0, 4600, 5970000.00, true, 'Barred Spiral Galaxy', 7, true);
INSERT INTO public.planet VALUES (4, 'Mars', 78340, 4600, 6410000.00, false, 'Barred Spiral Galaxy', 7, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 628730, 4600, 18980000.00, false, 'Spiral Galaxy', 8, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 12750, 4600, 56800000.00, false, 'Spiral Galaxy', 8, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 2723950, 4600, 86000000.00, false, 'Spiral Galaxy', 8, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 429500, 4600, 10200000.00, false, 'Spiral Galaxy', 8, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 5913000, 4600, 13000000.00, false, 'Spiral Galaxy', 8, true);
INSERT INTO public.planet VALUES (10, 'Eris', 96000, 4600, 16000000.00, false, 'Spiral Galaxy', 9, true);
INSERT INTO public.planet VALUES (11, 'Haumea', 63500, 4600, 41000000.00, false, 'Spiral Galaxy', 9, true);
INSERT INTO public.planet VALUES (12, 'Makemake', 6200, 4600, 35000000.00, false, 'Spiral Galaxy', 9, true);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Mars Rover', 'Mission to explore the surface of Mars.', 225000, 180, 'Exploration', 'Perseverance');
INSERT INTO public.space_mission VALUES (2, 'Moon Base', 'Planned mission for establishing a base on the Moon.', 38440, 365, 'Research', 'Lunar Gateway');
INSERT INTO public.space_mission VALUES (3, 'Juno', 'Space probe to study Jupiter and its atmosphere.', 588000, 1000, 'Space Probe', 'Juno');
INSERT INTO public.space_mission VALUES (4, 'Voyager 1', 'Interstellar space probe, now exploring the outer limits of the solar system.', 220000000, 3600, 'Space Probe', 'Voyager 1');
INSERT INTO public.space_mission VALUES (5, 'Artemis I', 'Uncrewed mission to orbit the Moon and test the Space Launch System.', 38440, 42, 'Space Exploration', 'Orion');
INSERT INTO public.space_mission VALUES (6, 'Curiosity Rover', 'Mars rover tasked with studying the Martian surface.', 225000, 730, 'Exploration', 'Curiosity');
INSERT INTO public.space_mission VALUES (7, 'New Horizons', 'Mission to study Pluto and the Kuiper Belt.', 400000, 1200, 'Space Probe', 'New Horizons');
INSERT INTO public.space_mission VALUES (8, 'Apollo 11', 'First crewed mission to land on the Moon.', 38440, 8, 'Manned Mission', 'Eagle');
INSERT INTO public.space_mission VALUES (9, 'SpaceX Starship', 'Planned crewed mission to Mars and beyond.', 225000, 180, 'Spacecraft', 'Starship');
INSERT INTO public.space_mission VALUES (10, 'Titan Exploration', 'Mission to explore the moon Titan, Saturn’s largest moon.', 1200000, 1500, 'Exploration', 'Dragonfly');
INSERT INTO public.space_mission VALUES (11, 'ExoMars', 'Joint mission by ESA and Roscosmos to explore Mars.', 225000, 700, 'Exploration', 'Rosalind Franklin');
INSERT INTO public.space_mission VALUES (12, 'Lunar Gateway', 'International space station orbiting the Moon.', 38440, 3650, 'Space Station', 'Gateway');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 'Barred Spiral Galaxy', 150000000, 4600, 1989000000000.00, 1);
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', 'Barred Spiral Galaxy', 430000000, 5000, 2290000000000.00, 2);
INSERT INTO public.star VALUES (9, 'Sirius', 'Spiral Galaxy', 860000000, 200, 4390000000000.00, 3);
INSERT INTO public.star VALUES (10, 'Betelgeuse', 'Irregular Galaxy', 642000000, 100000, 1980000000000.00, 4);
INSERT INTO public.star VALUES (11, 'Rigel', 'Lenticular Galaxy', 900000000, 80000, 2200000000000.00, 5);
INSERT INTO public.star VALUES (12, 'Proxima Centauri', 'Spiral Galaxy', 400000000, 4000, 1230000000000.00, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_mission_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


--
-- Name: space_mission space_mission_spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_spacecraft_name_key UNIQUE (spacecraft_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

