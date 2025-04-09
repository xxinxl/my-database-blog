--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

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
-- Name: action; Type: TABLE; Schema: public; Owner: student064
--

CREATE TABLE public.action (
    action_id integer NOT NULL,
    name character varying(16) NOT NULL
);


ALTER TABLE public.action OWNER TO student064;

--
-- Name: action_action_id_seq; Type: SEQUENCE; Schema: public; Owner: student064
--

CREATE SEQUENCE public.action_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_action_id_seq OWNER TO student064;

--
-- Name: action_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student064
--

ALTER SEQUENCE public.action_action_id_seq OWNED BY public.action.action_id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: student064
--

CREATE TABLE public.comment (
    comment_id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.comment OWNER TO student064;

--
-- Name: comment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: student064
--

CREATE SEQUENCE public.comment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_comment_id_seq OWNER TO student064;

--
-- Name: comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student064
--

ALTER SEQUENCE public.comment_comment_id_seq OWNED BY public.comment.comment_id;


--
-- Name: magazine; Type: TABLE; Schema: public; Owner: student064
--

CREATE TABLE public.magazine (
    magazine_id integer NOT NULL,
    post_id integer NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL,
    action_id integer NOT NULL,
    date_publication timestamp without time zone NOT NULL
);


ALTER TABLE public.magazine OWNER TO student064;

--
-- Name: magazine_magazine_id_seq; Type: SEQUENCE; Schema: public; Owner: student064
--

CREATE SEQUENCE public.magazine_magazine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.magazine_magazine_id_seq OWNER TO student064;

--
-- Name: magazine_magazine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student064
--

ALTER SEQUENCE public.magazine_magazine_id_seq OWNED BY public.magazine.magazine_id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: student064
--

CREATE TABLE public.post (
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    headline character varying(255) NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.post OWNER TO student064;

--
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: student064
--

CREATE SEQUENCE public.post_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_post_id_seq OWNER TO student064;

--
-- Name: post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student064
--

ALTER SEQUENCE public.post_post_id_seq OWNED BY public.post.post_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: student064
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    name character varying(16) NOT NULL
);


ALTER TABLE public.role OWNER TO student064;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: student064
--

CREATE SEQUENCE public.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_role_id_seq OWNER TO student064;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student064
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: student064
--

CREATE TABLE public."user" (
    id_user integer NOT NULL,
    id_role integer NOT NULL,
    last_name character varying(32) NOT NULL,
    middle_name character varying(32) NOT NULL,
    first_name character varying(32) NOT NULL,
    phone_number character(10),
    password character varying(255) NOT NULL,
    email character varying(32) NOT NULL,
    date_registration timestamp without time zone NOT NULL,
    CONSTRAINT user_email_check CHECK (((email)::text ~ '.{1,20}@.{1,6}\..{1,4}'::text)),
    CONSTRAINT user_phone_number_check CHECK ((phone_number ~ '\d{10}'::text))
);


ALTER TABLE public."user" OWNER TO student064;

--
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: public; Owner: student064
--

CREATE SEQUENCE public.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_user_seq OWNER TO student064;

--
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student064
--

ALTER SEQUENCE public.user_id_user_seq OWNED BY public."user".id_user;


--
-- Name: action action_id; Type: DEFAULT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.action ALTER COLUMN action_id SET DEFAULT nextval('public.action_action_id_seq'::regclass);


--
-- Name: comment comment_id; Type: DEFAULT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.comment ALTER COLUMN comment_id SET DEFAULT nextval('public.comment_comment_id_seq'::regclass);


--
-- Name: magazine magazine_id; Type: DEFAULT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.magazine ALTER COLUMN magazine_id SET DEFAULT nextval('public.magazine_magazine_id_seq'::regclass);


--
-- Name: post post_id; Type: DEFAULT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.post ALTER COLUMN post_id SET DEFAULT nextval('public.post_post_id_seq'::regclass);


--
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- Name: user id_user; Type: DEFAULT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.user_id_user_seq'::regclass);


--
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: student064
--

COPY public.action (action_id, name) FROM stdin;
1	create
2	update
3	delete
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: student064
--

COPY public.comment (comment_id, post_id, user_id, content) FROM stdin;
27	22	2	Отличная статья! Очень полезная информация.
28	25	3	Согласен, материал полезный.
29	23	4	Много интересных фактов, спасибо.
30	24	5	Статья немного длинная, но все же полезная.
31	26	6	Очень понравилась структура статьи.
\.


--
-- Data for Name: magazine; Type: TABLE DATA; Schema: public; Owner: student064
--

COPY public.magazine (magazine_id, post_id, comment_id, user_id, action_id, date_publication) FROM stdin;
22	22	27	2	1	2025-04-08 10:00:00
23	25	28	3	2	2025-04-08 10:30:00
24	23	29	4	1	2025-04-08 11:00:00
25	24	30	5	2	2025-04-08 11:30:00
26	26	31	6	3	2025-04-08 12:00:00
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: student064
--

COPY public.post (post_id, user_id, headline, content) FROM stdin;
21	2	5 привычек успешных людей	Рассмотрим ежедневные ритуалы, которые помогают достигать целей.
22	3	Почему важно высыпаться	Сон влияет на здоровье, память и работоспособность.
23	4	Как развить креативность	Техники и упражнения для развития творческого мышления.
24	5	Ошибки начинающих программистов	Рассказ о самых распространённых ошибках и как их избежать.
25	6	Польза чтения книг	Почему чтение важно для развития личности и интеллекта.
26	7	Как перестать прокрастинировать	Рабочие стратегии борьбы с откладыванием дел.
27	8	Топ-10 фильмов для вдохновения	Фильмы, которые мотивируют действовать.
28	9	Питание и энергия	Как питание влияет на уровень энергии в течение дня.
29	10	Зачем вести дневник	Преимущества ведения личного дневника и как начать.
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: student064
--

COPY public.role (role_id, name) FROM stdin;
1	admin
2	editor
3	viewer
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: student064
--

COPY public."user" (id_user, id_role, last_name, middle_name, first_name, phone_number, password, email, date_registration) FROM stdin;
2	1	Иванов	Сергеевич	Алексей	8967270105	qwErty123	ivanov@mail.ru	2024-05-12 00:00:00
3	2	Петров	Андреевич	Илья	9012234567	myPass321	petrov@mail.ru	2024-05-15 00:00:00
4	1	Сидорова	Игоревна	Анна	9031234567	Ann2024#	sidorova@mail.ru	2024-05-18 00:00:00
5	2	Кузнецова	Алексеевна	Мария	9059876543	Pass1234	kuznecova@mail.ru	2024-05-21 00:00:00
6	1	Смирнов	Дмитриевич	Артём	9087654321	artPass!	smirnov@mail.ru	2024-05-25 00:00:00
7	2	Волкова	Павловна	Екатерина	9114567890	volkova2024	volkova@mail.ru	2024-05-30 00:00:00
8	1	Морозов	Николаевич	Дмитрий	9133214455	DimaPwd1	morozov@mail.ru	2024-06-01 00:00:00
9	2	Новикова	Владимировна	Ольга	9156677889	Olga2024*	novikova@mail.ru	2024-06-03 00:00:00
10	1	Алексеев	Михайлович	Максим	9170001112	maxSecure	alekseev@mail.ru	2024-06-06 00:00:00
11	2	Фёдорова	Евгеньевна	Светлана	9198887776	svetaPWD	fedorova@mail.ru	2024-06-09 00:00:00
\.


--
-- Name: action_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student064
--

SELECT pg_catalog.setval('public.action_action_id_seq', 3, true);


--
-- Name: comment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student064
--

SELECT pg_catalog.setval('public.comment_comment_id_seq', 31, true);


--
-- Name: magazine_magazine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student064
--

SELECT pg_catalog.setval('public.magazine_magazine_id_seq', 26, true);


--
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student064
--

SELECT pg_catalog.setval('public.post_post_id_seq', 29, true);


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student064
--

SELECT pg_catalog.setval('public.role_role_id_seq', 3, true);


--
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: student064
--

SELECT pg_catalog.setval('public.user_id_user_seq', 11, true);


--
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (action_id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (comment_id);


--
-- Name: magazine magazine_pkey; Type: CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.magazine
    ADD CONSTRAINT magazine_pkey PRIMARY KEY (magazine_id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (post_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);


--
-- Name: comment comment_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(post_id);


--
-- Name: comment comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id_user);


--
-- Name: magazine magazine_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.magazine
    ADD CONSTRAINT magazine_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.action(action_id);


--
-- Name: magazine magazine_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.magazine
    ADD CONSTRAINT magazine_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(comment_id);


--
-- Name: magazine magazine_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.magazine
    ADD CONSTRAINT magazine_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(post_id);


--
-- Name: magazine magazine_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.magazine
    ADD CONSTRAINT magazine_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id_user);


--
-- Name: post post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id_user);


--
-- Name: user user_id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student064
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.role(role_id);


--
-- PostgreSQL database dump complete
--

