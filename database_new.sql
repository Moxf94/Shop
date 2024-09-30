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
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    data character varying,
    product_id integer
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    price numeric(10,2) NOT NULL,
    manufacturer character varying(100),
    description text
);


ALTER TABLE public.products OWNER TO postgres;

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

ALTER SEQUENCE public.pc_components_component_id_seq OWNED BY public.products.id;


--
-- Name: pc_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pc_components (
    component_id integer DEFAULT nextval('public.pc_components_component_id_seq'::regclass) NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    price numeric(10,2) NOT NULL,
    manufacturer character varying(100),
    description text
);


ALTER TABLE public.pc_components OWNER TO postgres;

--
-- Name: product_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_properties (
    id integer NOT NULL,
    product_id integer,
    property_id integer,
    value text NOT NULL
);


ALTER TABLE public.product_properties OWNER TO postgres;

--
-- Name: product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_properties_id_seq OWNER TO postgres;

--
-- Name: product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_properties_id_seq OWNED BY public.product_properties.id;


--
-- Name: product_type_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type_properties (
    id integer NOT NULL,
    product_type_id integer,
    property_id integer
);


ALTER TABLE public.product_type_properties OWNER TO postgres;

--
-- Name: product_type_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_type_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_type_properties_id_seq OWNER TO postgres;

--
-- Name: product_type_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_type_properties_id_seq OWNED BY public.product_type_properties.id;


--
-- Name: product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.product_types OWNER TO postgres;

--
-- Name: product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_types_id_seq OWNER TO postgres;

--
-- Name: product_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_types_id_seq OWNED BY public.product_types.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properties (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    property_type_id integer
);


ALTER TABLE public.properties OWNER TO postgres;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.properties_id_seq OWNER TO postgres;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: product_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties ALTER COLUMN id SET DEFAULT nextval('public.product_properties_id_seq'::regclass);


--
-- Name: product_type_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type_properties ALTER COLUMN id SET DEFAULT nextval('public.product_type_properties_id_seq'::regclass);


--
-- Name: product_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types ALTER COLUMN id SET DEFAULT nextval('public.product_types_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.pc_components_component_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, name, data, product_id) FROM stdin;
2	Intel Core i7 11700K	Pictures\\Intel-Core-i7-11700K.jpg	2
1	RTX_3080	Pictures\\RTX_3080.png	1
3	Corsair_Vengeance_LPX_16GB	Pictures\\Corsair_Vengeance_LPX_16gb.jpg	3
5	Corsair_Vengeance_LPX_32gb	Pictures\\Corsair_Vengeance_LPX_32gb.jpg	6
4	ASUS ROG Strix Z490-E	Pictures\\ASUS_ROG_Strix_Z490-E.jpg	4
\.


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
-- Data for Name: product_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_properties (id, product_id, property_id, value) FROM stdin;
1	7	1	AMD
2	7	2	2321
3	1	1	NVIDIA
4	1	2	1410
5	2	1	Intel
6	2	2	3600
7	8	1	NVIDIA
8	8	2	2015
\.


--
-- Data for Name: product_type_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_type_properties (id, product_type_id, property_id) FROM stdin;
1	1	1
2	1	2
3	2	1
4	2	2
5	1	1
6	1	2
\.


--
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_types (id, name) FROM stdin;
1	Видеокарта
2	Процессор
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, type, price, manufacturer, description) FROM stdin;
2	Intel Core i7-11700K	Процессор	34999.00	Intel	Процессор с 8 ядрами и 16 потоками.
3	Corsair Vengeance LPX 16GB	ОЗУ	7999.00	Corsair	Набор оперативной памяти на 16 ГБ.
4	ASUS ROG Strix Z490-E	Материнская плата	24999.00	ASUS	Материнская плата для процессоров Intel с поддержкой overclocking.
5	Samsung 970 EVO 1TB	SSD	12999.00	Samsung	NVMe SSD с высокой скоростью чтения и записи.
6	Corsair Vengeance LPS 32GB	ОЗУ	10999.00	Corsair	Набор оперативной памяти на 32 ГБ.
7	Видеокарта AMD Radeon RX 6700 XT	Видеокарта	479.99	AMD	Отличная производительность для игр в 1440p с поддержкой Ray Tracing.
8	Видеокарта NVIDIA GeForce RTX 3060 Ti	Видеокарта	399.99	NVIDIA	Идеальная видеокарта для игр в 1080p и 1440p с хорошей производительностью.
1	Видеокарта NVIDIA GeForce RTX 3080	Видеокарта	69999.00	NVIDIA	Высокопроизводительная видеокарта для игр и графики.
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properties (id, name, property_type_id) FROM stdin;
1	Производитель	1
2	Частота	2
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 8, true);


--
-- Name: pc_components_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pc_components_component_id_seq', 8, true);


--
-- Name: product_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_properties_id_seq', 8, true);


--
-- Name: product_type_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_type_properties_id_seq', 6, true);


--
-- Name: product_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_types_id_seq', 2, true);


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properties_id_seq', 2, true);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: pc_components pc_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pc_components
    ADD CONSTRAINT pc_components_pkey PRIMARY KEY (component_id);


--
-- Name: product_properties product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties
    ADD CONSTRAINT product_properties_pkey PRIMARY KEY (id);


--
-- Name: product_type_properties product_type_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type_properties
    ADD CONSTRAINT product_type_properties_pkey PRIMARY KEY (id);


--
-- Name: product_types product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: images fr_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT fr_product_id FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: product_properties product_properties_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties
    ADD CONSTRAINT product_properties_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: product_properties product_properties_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties
    ADD CONSTRAINT product_properties_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- Name: product_type_properties product_type_properties_product_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type_properties
    ADD CONSTRAINT product_type_properties_product_type_id_fkey FOREIGN KEY (product_type_id) REFERENCES public.product_types(id);


--
-- Name: product_type_properties product_type_properties_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type_properties
    ADD CONSTRAINT product_type_properties_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- PostgreSQL database dump complete
--

