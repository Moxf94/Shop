--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: pc_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pc_components (
    component_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    price numeric(10,2) NOT NULL,
    manufacturer character varying(100),
    description text
);


ALTER TABLE public.pc_components OWNER TO postgres;

--
-- Name: pc_components_component_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pc_components_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pc_components_component_id_seq OWNER TO postgres;

--
-- Name: pc_components_component_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pc_components_component_id_seq OWNED BY public.pc_components.component_id;


--
-- Name: pc_components component_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pc_components ALTER COLUMN component_id SET DEFAULT nextval('public.pc_components_component_id_seq'::regclass);


--
-- Data for Name: pc_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pc_components (component_id, name, type, price, manufacturer, description) FROM stdin;
1	NVIDIA GeForce RTX 3080	Видеокарта	69999.00	NVIDIA	Высокопроизводительная видеокарта для игр и графики.
2	Intel Core i7-11700K	Процессор	34999.00	Intel	Процессор с 8 ядрами и 16 потоками.
3	Corsair Vengeance LPX 16GB	ОЗУ	7999.00	Corsair	Набор оперативной памяти на 16 ГБ.
4	ASUS ROG Strix Z490-E	Материнская плата	24999.00	ASUS	Материнская плата для процессоров Intel с поддержкой overclocking.
5	Samsung 970 EVO 1TB	SSD	12999.00	Samsung	NVMe SSD с высокой скоростью чтения и записи.
6	Corsair Vengeance LPS 32GB	ОЗУ	10999.00	Corsair	Набор оперативной памяти на 32 ГБ.
\.


--
-- Name: pc_components_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pc_components_component_id_seq', 6, true);


--
-- Name: pc_components pc_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pc_components
    ADD CONSTRAINT pc_components_pkey PRIMARY KEY (component_id);


--
-- PostgreSQL database dump complete
--

