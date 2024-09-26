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
    data character varying
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
-- Name: products_property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_property (
    id integer NOT NULL,
    product_id integer,
    property_type_id integer,
    value character varying(100)
);


ALTER TABLE public.products_property OWNER TO postgres;

--
-- Name: products_property_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_property_id_seq OWNER TO postgres;

--
-- Name: products_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_property_id_seq OWNED BY public.products_property.id;


--
-- Name: products_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_type (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.products_type OWNER TO postgres;

--
-- Name: products_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_type_id_seq OWNER TO postgres;

--
-- Name: products_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_type_id_seq OWNED BY public.products_type.id;


--
-- Name: property_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_type (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.property_type OWNER TO postgres;

--
-- Name: property_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.property_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.property_type_id_seq OWNER TO postgres;

--
-- Name: property_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.property_type_id_seq OWNED BY public.property_type.id;


--
-- Name: property_type_product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_type_product_type (
    id integer NOT NULL,
    product_type_id integer,
    property_type_id integer
);


ALTER TABLE public.property_type_product_type OWNER TO postgres;

--
-- Name: property_type_product_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.property_type_product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.property_type_product_type_id_seq OWNER TO postgres;

--
-- Name: property_type_product_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.property_type_product_type_id_seq OWNED BY public.property_type_product_type.id;


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.pc_components_component_id_seq'::regclass);


--
-- Name: products_property id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_property ALTER COLUMN id SET DEFAULT nextval('public.products_property_id_seq'::regclass);


--
-- Name: products_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_type ALTER COLUMN id SET DEFAULT nextval('public.products_type_id_seq'::regclass);


--
-- Name: property_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_type ALTER COLUMN id SET DEFAULT nextval('public.property_type_id_seq'::regclass);


--
-- Name: property_type_product_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_type_product_type ALTER COLUMN id SET DEFAULT nextval('public.property_type_product_type_id_seq'::regclass);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, name, data) FROM stdin;
1	RTX_3080	Pictures\\\\RTX_3080.png
2	Intel Core i7 11700K	Pictures\\\\Intel-Core-i7-11700K.jpg
3	Corsair_Vengeance_LPX_16GB	Pictures\\\\Corsair_Vengeance_LPX_16gb.jpg
4	ASUS_ROG_Strix_ Z490-E	Pictures\\ASUS_ROG_Strix_ Z490-E.jpg
5	Samsung_980_EVO_1TB	Pictures\\Samsung_980_EVO_1TB.jpg
6	Corsair_Vengeance_LPX_32gb	Pictures\\Corsair_Vengeance_LPX_32gb.jpg
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
1	NVIDIA GeForce RTX 3080	Видеокарта	69999.00	NVIDIA	Высокопроизводительная видеокарта для игр и графики.
7	Видеокарта AMD Radeon RX 6700 XT	Видеокарта	479.99	AMD	Отличная производительность для игр в 1440p с поддержкой Ray Tracing.
8	Видеокарта NVIDIA GeForce RTX 3060 Ti	Видеокарта	399.99	NVIDIA	Идеальная видеокарта для игр в 1080p и 1440p с хорошей производительностью.
\.


--
-- Data for Name: products_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_property (id, product_id, property_type_id, value) FROM stdin;
1	1	1	Черный
\.


--
-- Data for Name: products_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_type (id, name) FROM stdin;
1	Видеокарты
\.


--
-- Data for Name: property_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_type (id, name) FROM stdin;
1	цвет
\.


--
-- Data for Name: property_type_product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_type_product_type (id, product_type_id, property_type_id) FROM stdin;
1	1	1
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 6, true);


--
-- Name: pc_components_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pc_components_component_id_seq', 8, true);


--
-- Name: products_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_property_id_seq', 1, false);


--
-- Name: products_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_type_id_seq', 1, false);


--
-- Name: property_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_type_id_seq', 1, false);


--
-- Name: property_type_product_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_type_product_type_id_seq', 1, false);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: products pc_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT pc_components_pkey PRIMARY KEY (id);


--
-- Name: products_property products_property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_property
    ADD CONSTRAINT products_property_pkey PRIMARY KEY (id);


--
-- Name: products_type products_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_type
    ADD CONSTRAINT products_type_pkey PRIMARY KEY (id);


--
-- Name: property_type property_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_type
    ADD CONSTRAINT property_type_pkey PRIMARY KEY (id);


--
-- Name: property_type_product_type property_type_product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_type_product_type
    ADD CONSTRAINT property_type_product_type_pkey PRIMARY KEY (id);


--
-- Name: property_type_product_type fk_products_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_type_product_type
    ADD CONSTRAINT fk_products_type FOREIGN KEY (product_type_id) REFERENCES public.products_type(id);


--
-- Name: property_type_product_type fk_property_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_type_product_type
    ADD CONSTRAINT fk_property_type FOREIGN KEY (property_type_id) REFERENCES public.property_type(id);


--
-- PostgreSQL database dump complete
--

