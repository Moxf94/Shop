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
-- Name: product_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_properties (
    property_id integer NOT NULL,
    product_id integer,
    property_type_id integer,
    property_value character varying(255) NOT NULL
);


ALTER TABLE public.product_properties OWNER TO postgres;

--
-- Name: product_properties_property_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_properties_property_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_properties_property_id_seq OWNER TO postgres;

--
-- Name: product_properties_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_properties_property_id_seq OWNED BY public.product_properties.property_id;


--
-- Name: property_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_types (
    property_type_id integer NOT NULL,
    property_name character varying(255) NOT NULL
);


ALTER TABLE public.property_types OWNER TO postgres;

--
-- Name: property_types_property_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.property_types_property_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.property_types_property_type_id_seq OWNER TO postgres;

--
-- Name: property_types_property_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.property_types_property_type_id_seq OWNED BY public.property_types.property_type_id;


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: product_properties property_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties ALTER COLUMN property_id SET DEFAULT nextval('public.product_properties_property_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.pc_components_component_id_seq'::regclass);


--
-- Name: property_types property_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_types ALTER COLUMN property_type_id SET DEFAULT nextval('public.property_types_property_type_id_seq'::regclass);


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
-- Data for Name: product_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_properties (property_id, product_id, property_type_id, property_value) FROM stdin;
1	1	1	GDDR6
2	1	2	256 бит
3	1	3	HDMI
4	1	4	PCIe 4.0
5	2	5	8
6	2	6	3.6 GHz
7	3	7	16 ГБ
8	3	8	DDR4
9	4	9	NVMe
10	4	10	M.2
11	5	11	ATX
12	5	12	Intel
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
-- Data for Name: property_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_types (property_type_id, property_name) FROM stdin;
1	Тип памяти
2	Ширина шины
3	Видеовыходы
4	Тип подключения
5	Количество ядер
6	Тактовая частота
7	Объем памяти
8	Тип интерфейса
9	Форм-фактор SSD
10	Форм-фактор материнской платы
11	Поддерживаемые процессоры
12	Слоты для ОЗУ
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
-- Name: product_properties_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_properties_property_id_seq', 12, true);


--
-- Name: property_types_property_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_types_property_type_id_seq', 12, true);


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
    ADD CONSTRAINT product_properties_pkey PRIMARY KEY (property_id);


--
-- Name: property_types property_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_types
    ADD CONSTRAINT property_types_pkey PRIMARY KEY (property_type_id);


--
-- Name: product_properties product_properties_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties
    ADD CONSTRAINT product_properties_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: product_properties product_properties_property_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_properties
    ADD CONSTRAINT product_properties_property_type_id_fkey FOREIGN KEY (property_type_id) REFERENCES public.property_types(property_type_id);


--
-- PostgreSQL database dump complete
--

