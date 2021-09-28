--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car (
    id integer NOT NULL,
    model character varying,
    street_id character varying
);


ALTER TABLE public.car OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(10)
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: driver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver (
    id integer NOT NULL,
    car_id integer NOT NULL,
    phone character varying(10),
    name character varying(255) NOT NULL
);


ALTER TABLE public.driver OWNER TO postgres;

--
-- Name: trip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trip (
    id integer NOT NULL,
    client_id integer NOT NULL,
    driver_id integer NOT NULL,
    date_trip timestamp without time zone,
    destiny character varying
);


ALTER TABLE public.trip OWNER TO postgres;

--
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car (id, model, street_id) FROM stdin;
1	Audi	AKS-314
2	Kia	KAE-523
3	Kia	ALE-125
4	Lada	LRO-424
5	Toyota	OPA-302
6	Audi	ANR-024
7	Lada	NRE-121
8	Bmw	LSS-442
9	Honda	OSE-101
10	Renault	LPS-553
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name, phone) FROM stdin;
1	Kevin	9963351422
2	Andres	9941231234
3	Camilo	9734145632
4	Diana	9148281441
5	Juan	9183884244
6	Andrei	9848355255
7	Evans	9188435123
8	Gabriel	9554184831
9	Alejandro	9748144313
10	Yamil	9184827743
\.


--
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver (id, car_id, phone, name) FROM stdin;
1	5	9986768074	lian
2	3	9818313312	Noah
3	1	9188331301	Oliver
4	2	9132221832	Ava
5	7	9517361732	Elijah
6	6	9177316312	Emma
7	4	9736377385	Olivia
8	9	9018200173	Thiago
9	8	9820017271	Mateo
10	10	9183717388	Sebastian
\.


--
-- Data for Name: trip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trip (id, client_id, driver_id, date_trip, destiny) FROM stdin;
1	4	1	2021-04-05 12:21:30	Academika parina 2
2	8	9	2021-02-06 10:50:57	KFU
3	5	3	2021-05-21 01:10:21	Bauman Street
4	1	5	2021-06-30 08:50:01	Du
5	2	2	2021-01-21 10:41:05	Kazan Mall
6	3	7	2021-08-06 09:05:30	Kol Tso
7	9	4	2021-09-05 21:05:21	Kaban
8	7	8	2021-07-09 22:08:50	KFU
9	6	6	2021-08-22 23:40:12	Raves Bar
10	10	10	2021-10-10 23:23:23	Stadio
\.


--
-- Name: car car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id);


--
-- Name: trip trip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_pkey PRIMARY KEY (id);


--
-- Name: driver driver_car_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.car(id);


--
-- Name: trip trip_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: trip trip_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver(id);


--
-- PostgreSQL database dump complete
--

