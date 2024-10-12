--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+2)
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
-- Name: format_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.format_type (
    id bigint NOT NULL,
    uuid character varying NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE public.format_type OWNER TO postgres;

--
-- Name: format_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.format_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.format_type_id_seq OWNER TO postgres;

--
-- Name: format_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.format_type_id_seq OWNED BY public.format_type.id;


--
-- Name: journalist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist (
    id bigint NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    uuid character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying,
    email character varying NOT NULL,
    phone character varying,
    ddi character varying,
    mobile character varying,
    linkedin character varying,
    twitter character varying,
    datasource character varying,
    valid_email boolean DEFAULT true NOT NULL,
    user_approved boolean DEFAULT false NOT NULL,
    "validatedAt" timestamp without time zone,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.journalist OWNER TO postgres;

--
-- Name: journalist_format_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist_format_type (
    journalist_id bigint NOT NULL,
    format_type_id bigint NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.journalist_format_type OWNER TO postgres;

--
-- Name: journalist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journalist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.journalist_id_seq OWNER TO postgres;

--
-- Name: journalist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journalist_id_seq OWNED BY public.journalist.id;


--
-- Name: journalist_news_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist_news_type (
    journalist_id bigint NOT NULL,
    news_type_id bigint NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.journalist_news_type OWNER TO postgres;

--
-- Name: journalist_publication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist_publication (
    journalist_id bigint NOT NULL,
    publication_id bigint NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.journalist_publication OWNER TO postgres;

--
-- Name: journalist_region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist_region (
    journalist_id bigint NOT NULL,
    region_id bigint NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.journalist_region OWNER TO postgres;

--
-- Name: journalist_role_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist_role_type (
    journalist_id bigint NOT NULL,
    role_type_id bigint NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.journalist_role_type OWNER TO postgres;

--
-- Name: journalist_search; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist_search (
    id bigint NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    uuid character varying NOT NULL,
    name character varying NOT NULL,
    description character varying,
    user_id bigint NOT NULL,
    search jsonb,
    journalists jsonb
);


ALTER TABLE public.journalist_search OWNER TO postgres;

--
-- Name: journalist_search_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journalist_search_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.journalist_search_id_seq OWNER TO postgres;

--
-- Name: journalist_search_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journalist_search_id_seq OWNED BY public.journalist_search.id;


--
-- Name: journalist_select; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist_select (
    id bigint NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    uuid character varying NOT NULL,
    name character varying NOT NULL,
    description character varying,
    user_id bigint NOT NULL,
    search jsonb NOT NULL
);


ALTER TABLE public.journalist_select OWNER TO postgres;

--
-- Name: journalist_select_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journalist_select_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.journalist_select_id_seq OWNER TO postgres;

--
-- Name: journalist_select_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journalist_select_id_seq OWNED BY public.journalist_select.id;


--
-- Name: news_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news_type (
    id bigint NOT NULL,
    uuid character varying NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE public.news_type OWNER TO postgres;

--
-- Name: news_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_type_id_seq OWNER TO postgres;

--
-- Name: news_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_type_id_seq OWNED BY public.news_type.id;


--
-- Name: publication_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publication_type (
    id bigint NOT NULL,
    uuid character varying NOT NULL,
    tier character varying NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE public.publication_type OWNER TO postgres;

--
-- Name: publication_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publication_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publication_type_id_seq OWNER TO postgres;

--
-- Name: publication_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publication_type_id_seq OWNED BY public.publication_type.id;


--
-- Name: role_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_type (
    id bigint NOT NULL,
    uuid character varying NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE public.role_type OWNER TO postgres;

--
-- Name: role_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_type_id_seq OWNER TO postgres;

--
-- Name: role_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_type_id_seq OWNED BY public.role_type.id;


--
-- Name: format_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.format_type ALTER COLUMN id SET DEFAULT nextval('public.format_type_id_seq'::regclass);


--
-- Name: journalist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist ALTER COLUMN id SET DEFAULT nextval('public.journalist_id_seq'::regclass);


--
-- Name: journalist_search id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_search ALTER COLUMN id SET DEFAULT nextval('public.journalist_search_id_seq'::regclass);


--
-- Name: journalist_select id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_select ALTER COLUMN id SET DEFAULT nextval('public.journalist_select_id_seq'::regclass);


--
-- Name: news_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_type ALTER COLUMN id SET DEFAULT nextval('public.news_type_id_seq'::regclass);


--
-- Name: publication_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publication_type ALTER COLUMN id SET DEFAULT nextval('public.publication_type_id_seq'::regclass);


--
-- Name: role_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_type ALTER COLUMN id SET DEFAULT nextval('public.role_type_id_seq'::regclass);


--
-- Data for Name: format_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.format_type VALUES (1, 'edde15ae-f15e-4e08-8f39-2eb3c0352cd0', 'Radio', 'Radio');
INSERT INTO public.format_type VALUES (2, 'ddcdb98e-92c4-4165-9fca-23143b90c550', 'TV/Video', 'TV/Video');
INSERT INTO public.format_type VALUES (3, '53fd84eb-6893-4c55-bc7b-0559e5da3df0', 'Photography', 'Photography');
INSERT INTO public.format_type VALUES (4, 'f94fa676-c955-4578-8b5c-debc1eee5d64', 'Podcast', 'Podcast');
INSERT INTO public.format_type VALUES (5, 'e3ca12c0-9d94-4ff4-ac2a-3dbb8d37b278', 'Blog', 'Blog');
INSERT INTO public.format_type VALUES (6, 'd733be12-4c96-44d1-ae42-1445826b1710', 'Editorial', 'Editorial');


--
-- Data for Name: journalist; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: journalist_format_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: journalist_news_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: journalist_publication; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: journalist_region; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: journalist_role_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: journalist_search; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: journalist_select; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: news_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.news_type VALUES (1, 'ac2f04f3-bc1e-469d-bd65-700f07b915c5', 'Blog', 'Blog');
INSERT INTO public.news_type VALUES (2, 'b459ed32-fc90-4758-8ae9-d6978eef989e', 'Books', 'Books');
INSERT INTO public.news_type VALUES (3, '5204b9af-0dc8-4b98-afcf-accb2e6bb654', 'Building', 'Building');
INSERT INTO public.news_type VALUES (4, 'f899bcf5-4936-42cf-ae53-473d64518cbf', 'Business', 'Business');
INSERT INTO public.news_type VALUES (5, '47b99493-3ab0-4088-b300-8fd4aa0a04f2', 'Climate', 'Climate');
INSERT INTO public.news_type VALUES (6, '4f4c2126-a324-4292-bc27-0bcb23535bd6', 'Construction', 'Construction');
INSERT INTO public.news_type VALUES (7, '8a88a1fd-9b3b-4d14-a217-31afa5c11829', 'Crime', 'Crime');
INSERT INTO public.news_type VALUES (8, '5ad5588f-28c1-46e0-bf5b-56468b12c934', 'Education', 'Education');
INSERT INTO public.news_type VALUES (9, '783c4ec6-a4ce-4dad-aea3-2c80d98b95d7', 'Entertainment', 'Entertainment');
INSERT INTO public.news_type VALUES (10, '9ca2be59-e6f6-4b6d-90a0-33c7efecab97', 'Environment', 'Environment');
INSERT INTO public.news_type VALUES (11, '140e9673-0cf0-4609-bf2b-a532a6ae479b', 'Finance', 'Finance');
INSERT INTO public.news_type VALUES (12, 'a7e239a5-a881-4cbc-a4ca-17d043f2c0f7', 'Food', 'Food');
INSERT INTO public.news_type VALUES (13, '55f11162-59ce-43dc-8cbd-2448ba5b184b', 'General', 'General');
INSERT INTO public.news_type VALUES (14, '03679c0b-3f89-4e2e-863e-707c2dcf2a76', 'Government', 'Government');
INSERT INTO public.news_type VALUES (15, '5a52c8cf-c46f-4515-98ab-19bc15e7717f', 'Health', 'Health');
INSERT INTO public.news_type VALUES (16, '1a924040-4ea1-4beb-895e-3a981c31a814', 'International', 'International');
INSERT INTO public.news_type VALUES (17, '4eb34a1f-f433-4a5c-bf8c-a7d5911aa54d', 'Law', 'Law');
INSERT INTO public.news_type VALUES (18, '2d955898-5f07-4958-b960-c47841fb44b9', 'Lifestyle', 'Lifestyle');
INSERT INTO public.news_type VALUES (19, '61a7dbf3-0ead-417e-ba6f-ec985643920b', 'Local Government', 'Local Government');
INSERT INTO public.news_type VALUES (20, 'f0b6c5c0-57ac-488c-9dbb-a2fc1f149b9d', 'Motoring', 'Motoring');
INSERT INTO public.news_type VALUES (21, '50ddfbbe-b331-42b3-888c-44c0933348b1', 'Pasifika', 'Pasifika');
INSERT INTO public.news_type VALUES (22, 'a9dfca3a-b84a-47ba-b565-664f50704d1e', 'Politics', 'Politics');
INSERT INTO public.news_type VALUES (23, '62b088cf-eda4-46fc-b6c5-02eca4ae4209', 'Property', 'Property');
INSERT INTO public.news_type VALUES (24, '5a34e419-daa6-4ab3-ab62-97304b514d2f', 'Science', 'Science');
INSERT INTO public.news_type VALUES (25, '636e0459-0284-48c0-a84f-11d9d4bde3c9', 'Sport', 'Sport');
INSERT INTO public.news_type VALUES (26, '2e6e54de-c8d1-47e5-b1df-b15ee2768606', 'Technology', 'Technology');
INSERT INTO public.news_type VALUES (27, '3ea8a307-c3a1-4849-807c-02c1cd8a34ae', 'Tertiary', 'Tertiary');
INSERT INTO public.news_type VALUES (28, 'a02e8745-09d2-4c43-b4b0-c3978ba313dc', 'Travel', 'Travel');
INSERT INTO public.news_type VALUES (29, '99001de9-4edd-4320-90d2-4ded39c6be91', 'Agriculture', 'Agriculture');
INSERT INTO public.news_type VALUES (30, 'a7e239a5-a881-4cbc-a4ca-35d043f2c0f7', 'Maori', 'Maori');
INSERT INTO public.news_type VALUES (31, 'a7e239c7-a881-4cbc-a4ca-35d043f2c0f7', 'Community', 'Community');
INSERT INTO public.news_type VALUES (32, 'a7e239c7-a881-5kbc-a4ca-35d043f2c0u7', 'Manufacturing', 'Manufacturing');
INSERT INTO public.news_type VALUES (33, 'a7e239c7-b56y-5kbc-a4ca-35d043f2c0u7', 'Social Issues', 'Social Issues');
INSERT INTO public.news_type VALUES (34, 'a7e392c7-b56y-5kbc-a4ca-35p043f2c0u7', 'Transport', 'Transport');
INSERT INTO public.news_type VALUES (35, '411bd046-b589-44ef-9229-771cb9fb0eec', 'Arts', 'Arts');


--
-- Data for Name: publication_type; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: role_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role_type VALUES (1, '0642b7dc-871e-4ab5-b7ec-6daf1f56c356', 'Bureau Chief', 'Bureau Chief');
INSERT INTO public.role_type VALUES (2, '51e46320-9deb-42d9-9935-94653aa1da8a', 'Chief Content Officer', 'Chief Content Officer');
INSERT INTO public.role_type VALUES (3, '0085dae6-ca02-402d-bab5-ce77d7db51df', 'Editor', 'Editor');
INSERT INTO public.role_type VALUES (4, 'ec159fb0-f54d-4c96-936b-2ab416ddc28d', 'Head of Content', 'Head of Content');
INSERT INTO public.role_type VALUES (5, '5f2c52a0-5004-44e1-81bd-7dbb91b07ef7', 'Head of Life Media', 'Head of Life Media');
INSERT INTO public.role_type VALUES (6, '41e45bc4-f0ab-46a0-b281-42f7465c41bf', 'Head of News', 'Head of News');
INSERT INTO public.role_type VALUES (7, '4e69e27d-8a40-430b-b3dc-4d0615963220', 'Journalist', 'Journalist');
INSERT INTO public.role_type VALUES (8, '82268e31-dd8d-40e1-856c-3548bdfb3717', 'Newsroom', 'Newsroom');
INSERT INTO public.role_type VALUES (9, '285d59e8-2623-4b19-b652-8cc18099020a', 'Publisher', 'Publisher');
INSERT INTO public.role_type VALUES (10, '47e037f6-738d-4972-b70a-06459aac9f85', 'Reporter', 'Reporter');
INSERT INTO public.role_type VALUES (11, 'a61f09a4-1493-4b6f-b7e4-5ade62b4e37e', 'Writer', 'Writer');
INSERT INTO public.role_type VALUES (12, '7d1512f4-117a-4cc7-b468-580144136806', 'Columnist', 'Columnist');
INSERT INTO public.role_type VALUES (13, '91440783-b9f1-42a6-a3c3-86cb55f186ae', 'Commentator', 'Commentator');
INSERT INTO public.role_type VALUES (14, '8faf316d-34c7-42f8-a702-06425a624d38', 'Content Creator', 'Content Creator');
INSERT INTO public.role_type VALUES (15, 'a7o392f7-b91y-5kbc-a4pa-35p043f2c0u7', 'Correspondent', 'Correspondent');
INSERT INTO public.role_type VALUES (16, 'e42bd6ff-1883-40b2-ae6e-11534c571aff', 'Editor (Deputy)', 'Deputy Editor');
INSERT INTO public.role_type VALUES (17, '2ba09e16-f6b9-4c4f-9729-64b390072ce6', 'Editor (Co-)', 'Co-Editor');
INSERT INTO public.role_type VALUES (18, 'e5360251-51a4-4182-9f3b-a4978cf79c2f', 'Editor (Senior)', 'Senior Editor');
INSERT INTO public.role_type VALUES (19, '8d7f8b5a-fdaa-491f-aac3-732ba9542527', 'Editor (Managing)', 'Managing Editor');
INSERT INTO public.role_type VALUES (20, 'adbb1330-3db3-4bf8-b777-7c9affcfa322', 'Editor (Section)', 'Section Editor');
INSERT INTO public.role_type VALUES (21, 'a7o392f7-e71y-5kbc-a4pa-82p043f2c0u7', 'Editor (at Large)', 'Editor at Large');
INSERT INTO public.role_type VALUES (22, 'a7e392c7-b91y-5kbc-a4ca-35p043f2c0u7', 'Reporter (Senior)', 'Senior Reporter');
INSERT INTO public.role_type VALUES (23, 'a7o184f7-e71y-5kbc-a4da-82p043f2c0u7', 'Journalist (Senior)', 'Senior Journalist');
INSERT INTO public.role_type VALUES (24, 'a7o184f7-e71y-5kbc-a4da-82p273f2c0u7', 'Journalist (Investigative)', 'Investigative Journalist');
INSERT INTO public.role_type VALUES (25, 'a7o183f7-e71y-5kbc-a7da-82t273z2c0u7', 'Producer', 'Producer');


--
-- Name: format_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.format_type_id_seq', 6, true);


--
-- Name: journalist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journalist_id_seq', 1, false);


--
-- Name: journalist_search_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journalist_search_id_seq', 1, false);


--
-- Name: journalist_select_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journalist_select_id_seq', 1, false);


--
-- Name: news_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_type_id_seq', 35, true);


--
-- Name: publication_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publication_type_id_seq', 1, false);


--
-- Name: role_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_type_id_seq', 25, true);


--
-- Name: format_type format_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.format_type
    ADD CONSTRAINT format_type_pkey PRIMARY KEY (id);


--
-- Name: journalist_format_type journalist_format_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_format_type
    ADD CONSTRAINT journalist_format_type_pkey PRIMARY KEY (journalist_id, format_type_id);


--
-- Name: journalist_news_type journalist_news_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_news_type
    ADD CONSTRAINT journalist_news_type_pkey PRIMARY KEY (journalist_id, news_type_id);


--
-- Name: journalist journalist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist
    ADD CONSTRAINT journalist_pkey PRIMARY KEY (id);


--
-- Name: journalist_publication journalist_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_publication
    ADD CONSTRAINT journalist_publication_pkey PRIMARY KEY (journalist_id, publication_id);


--
-- Name: journalist_region journalist_region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_region
    ADD CONSTRAINT journalist_region_pkey PRIMARY KEY (journalist_id, region_id);


--
-- Name: journalist_role_type journalist_role_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_role_type
    ADD CONSTRAINT journalist_role_type_pkey PRIMARY KEY (journalist_id, role_type_id);


--
-- Name: journalist_search journalist_search_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_search
    ADD CONSTRAINT journalist_search_pkey PRIMARY KEY (id);


--
-- Name: journalist_select journalist_select_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_select
    ADD CONSTRAINT journalist_select_pkey PRIMARY KEY (id);


--
-- Name: news_type news_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_type
    ADD CONSTRAINT news_type_pkey PRIMARY KEY (id);


--
-- Name: publication_type publication_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publication_type
    ADD CONSTRAINT publication_type_pkey PRIMARY KEY (id);


--
-- Name: role_type role_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_type
    ADD CONSTRAINT role_type_pkey PRIMARY KEY (id);


--
-- Name: journalist_format_type journalist_format_type_format_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_format_type
    ADD CONSTRAINT journalist_format_type_format_type_id_fkey FOREIGN KEY (format_type_id) REFERENCES public.format_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: journalist_format_type journalist_format_type_journalist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_format_type
    ADD CONSTRAINT journalist_format_type_journalist_id_fkey FOREIGN KEY (journalist_id) REFERENCES public.journalist(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: journalist_news_type journalist_news_type_journalist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_news_type
    ADD CONSTRAINT journalist_news_type_journalist_id_fkey FOREIGN KEY (journalist_id) REFERENCES public.journalist(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: journalist_news_type journalist_news_type_news_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_news_type
    ADD CONSTRAINT journalist_news_type_news_type_id_fkey FOREIGN KEY (news_type_id) REFERENCES public.news_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: journalist_publication journalist_publication_journalist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_publication
    ADD CONSTRAINT journalist_publication_journalist_id_fkey FOREIGN KEY (journalist_id) REFERENCES public.journalist(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: journalist_region journalist_region_journalist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_region
    ADD CONSTRAINT journalist_region_journalist_id_fkey FOREIGN KEY (journalist_id) REFERENCES public.journalist(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: journalist_role_type journalist_role_type_journalist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_role_type
    ADD CONSTRAINT journalist_role_type_journalist_id_fkey FOREIGN KEY (journalist_id) REFERENCES public.journalist(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: journalist_role_type journalist_role_type_role_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_role_type
    ADD CONSTRAINT journalist_role_type_role_type_id_fkey FOREIGN KEY (role_type_id) REFERENCES public.role_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

