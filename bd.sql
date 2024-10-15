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
2	Intel Core i7 11700K	Pictures\\\\Intel-Core-i7-11700K.jpg	2
1	RTX_3080	Pictures\\\\RTX_3080.png	1
5	Samsung_980_EVO_1TB	Pictures\\Samsung_980_EVO_1TB.jpg	5
3	Corsair_Vengeance_LPX_16GB	Pictures\\\\Corsair_Vengeance_LPX_16gb.jpg	3
6	Corsair_Vengeance_LPX_32gb	Pictures\\Corsair_Vengeance_LPX_32gb.jpg	6
4	ASUS_ROG_Strix_ Z490-E	Pictures\\ASUS_ROG_Strix_Z490-E.jpg	4
7	AMD_Radeon_RX_6700_XT	Pictures\\AMD_Radeon_RX_6700_XT.jpg	7
8	Gforce 3060 Ti	Pictures\\Gforce 3060 Ti.jpg	8
9	Radeon RX 580	Pictures\\Radeon RX 580.png	9
10	AMD RYZEN 5600	Pictures\\AMD RYZEN 5600.jpg	10
11	Gigabyte A520M K V2	Pictures\\A520 K V2.png	11
\.


--
-- Data for Name: product_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_properties (id, product_id, property_id, value) FROM stdin;
1	7	1	AMD
3	1	1	NVIDIA
5	2	1	Intel
7	8	1	NVIDIA
2	7	3	GDDR6
4	1	3	GDDR6
8	8	3	GDDR6
10	7	4	12 Гб
11	8	4	8 Гб
9	1	4	10 Гб
12	1	5	320 бит
13	7	5	192 бит
14	8	5	256 бит
15	3	7	8 Гб
16	3	8	DDR4 DIMM 288-pin
17	3	9	2666 МГц
18	6	7	16 Гб
20	6	9	3600 МГц
19	6	8	DDR4 DIMM 288-pin
21	9	1	AMD
22	9	3	GDDR6
23	9	4	8 Гб
24	9	5	128 бит
25	1	6	PCI Express 4.0
26	7	6	PCI Express 4.0
27	8	6	PCI Express 4.0
28	9	6	PCI Express 3.0
29	10	10	AM4
30	10	11	DDR4
31	10	12	6 шт.
32	10	13	10 нм
33	10	2	3500 МГц
34	2	10	LGA1200
35	2	11	DDR4
36	2	12	8 шт.
37	2	13	14 нм
6	2	2	3600 МГц
38	10	1	AMD
42	4	11	DDR4
41	4	15	Intel Z390
39	4	14	ATX
40	4	10	LGA1151v2
43	11	14	microATX
44	11	10	AM4
45	11	15	AMD A520
46	11	11	DDR4
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
7	1	3
8	1	4
9	1	5
10	1	6
11	3	7
12	3	8
13	3	9
14	2	10
15	2	11
16	2	12
17	2	13
18	4	10
19	4	11
20	4	14
21	4	15
\.


--
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_types (id, name) FROM stdin;
1	Видеокарта
2	Процессор
3	Оперативная память
4	Материнская плата
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, type, price, manufacturer, description) FROM stdin;
7	AMD Radeon RX 6700 XT	Видеокарта	41999.00	AMD	Отличная производительность для игр в 1440p с поддержкой Ray Tracing.
2	Intel Core i7-11700K	Процессор	34999.00	Intel	Процессор с 8 ядрами и 16 потоками.
3	Corsair Vengeance LPX 16GB	Оперативная память	7999.00	Corsair	Набор оперативной памяти на 16 ГБ.
6	Corsair Vengeance LPS 32GB	Оперативная память	10999.00	Corsair	Набор оперативной памяти на 32 ГБ.
5	Samsung 970 EVO 1TB	SSD	12999.00	Samsung	NVMe SSD с высокой скоростью чтения и записи.
1	NVIDIA GeForce RTX 3080	Видеокарта	69999.00	NVIDIA	Высокопроизводительная видеокарта для игр и графики.
8	NVIDIA GeForce RTX 3060 Ti	Видеокарта	36799.00	NVIDIA	Идеальная видеокарта для игр в 1080p и 1440p с хорошей производительностью.
9	AMD Radeon RX 580	Видеокарта	11799.00	AMD	Видеокарта для дешевых и среднебюджетных сборок
10	AMD RYZEN 5600 OEM	Процессор	10990.00	AMD	
4	ASUS ROG Strix Z390-E	Материнская плата	24999.00	ASUS	Материнская плата для процессоров Intel с поддержкой overclocking.
11	Gigabyte A520M K V2	Материнская плата	6985.00	AMD	\N
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properties (id, name, property_type_id) FROM stdin;
1	Производитель	1
2	Частота	2
3	Тип памяти	3
4	Размер памяти	4
5	Разрядность шины памяти	5
6	Тип подключения	6
7	Объем одного модуля	7
8	Тип	8
9	Тактовая частота	9
10	Сокет	10
11	Тип памяти	11
12	Количество ядер	12
13	Техпроцесс	13
14	Формфактор	14
15	Чипсет	16
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

SELECT pg_catalog.setval('public.product_properties_id_seq', 10, true);


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
-- Name: products pc_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT pc_components_pkey PRIMARY KEY (id);


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
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: images fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


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

