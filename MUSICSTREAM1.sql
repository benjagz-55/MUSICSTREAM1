--
-- PostgreSQL database dump
--

\restrict 99JVFUrVapHwGWRfaPSMgc4qEIzaTL3Ks14FsvK2XDiHX7jPnvj9DeK32jY3xxW

-- Dumped from database version 16.15
-- Dumped by pg_dump version 16.15

-- Started on 2026-10-01 03:08:18

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16434)
-- Name: albumes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albumes (
    id integer NOT NULL,
    artista_id integer NOT NULL,
    titulo text NOT NULL,
    tipo text,
    fechalanzamiento date NOT NULL,
    imagenportada text
);


ALTER TABLE public.albumes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16427)
-- Name: artistas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artistas (
    id integer NOT NULL,
    nombreartistico character varying(15) NOT NULL,
    biografia text,
    pais text NOT NULL,
    fechadebut date NOT NULL
);


ALTER TABLE public.artistas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16446)
-- Name: canciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.canciones (
    id integer NOT NULL,
    album_id integer NOT NULL,
    titulo text NOT NULL,
    duracion integer NOT NULL,
    anolanzamiento date NOT NULL,
    genero_principal text NOT NULL,
    archivo_audio text NOT NULL
);


ALTER TABLE public.canciones OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16486)
-- Name: me_gusta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.me_gusta (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    tipo_entidad text,
    id_entidad integer NOT NULL,
    fecha date
);


ALTER TABLE public.me_gusta OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16403)
-- Name: plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan (
    id integer NOT NULL,
    nombre character varying(15) NOT NULL,
    precio numeric(15,2) NOT NULL,
    caracteristicas text
);


ALTER TABLE public.plan OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16458)
-- Name: playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    nombre text NOT NULL,
    descripcion text,
    fecha_creacion date NOT NULL,
    es_publica boolean DEFAULT false
);


ALTER TABLE public.playlist OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16471)
-- Name: reproducciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reproducciones (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    cancion_id integer NOT NULL,
    fecha_hora timestamp without time zone NOT NULL,
    duracion_escucha integer
);


ALTER TABLE public.reproducciones OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16498)
-- Name: seguir_artista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seguir_artista (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    artista_id integer NOT NULL,
    fecha date
);


ALTER TABLE public.seguir_artista OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16513)
-- Name: seguir_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seguir_usuario (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    usuario_seguido_id integer NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.seguir_usuario OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16410)
-- Name: suscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suscripciones (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    plan_id integer NOT NULL,
    fechainicio date NOT NULL,
    fechafin date,
    estado text NOT NULL
);


ALTER TABLE public.suscripciones OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16398)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    correo character varying(30) NOT NULL,
    contrasena character varying(255) NOT NULL,
    fechanacimiento date,
    fecharegistro date NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 16434)
-- Dependencies: 220
-- Data for Name: albumes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.albumes VALUES (8004, 8001, 'friendzone', 'trap', '2026-05-16', 'slime.jpg');


--
-- TOC entry 4956 (class 0 OID 16427)
-- Dependencies: 219
-- Data for Name: artistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.artistas VALUES (8001, 'slimesanti', 'trapero joven argentino', 'Argentina', '2023-03-29');
INSERT INTO public.artistas VALUES (8002, 'zell', 'joven balling', 'Argentina', '2018-10-15');
INSERT INTO public.artistas VALUES (8003, 'la mona jimenez', 'el rey del cuarteto', 'Argentina', '1967-05-22');


--
-- TOC entry 4958 (class 0 OID 16446)
-- Dependencies: 221
-- Data for Name: canciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4961 (class 0 OID 16486)
-- Dependencies: 224
-- Data for Name: me_gusta; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4954 (class 0 OID 16403)
-- Dependencies: 217
-- Data for Name: plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.plan VALUES (4444, 'plan basico', 9000.00, 'hasta 2 dispositivos simultaneos, sin anuncios');
INSERT INTO public.plan VALUES (5555, 'plan intermedio', 12000.00, 'hasta 3 dispositivos simultaneos, sin anuncios');
INSERT INTO public.plan VALUES (6666, 'plan premium', 14000.00, 'hasta 4 dispositivos simultaneos, sin anuncios y descargas offline');


--
-- TOC entry 4959 (class 0 OID 16458)
-- Dependencies: 222
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4960 (class 0 OID 16471)
-- Dependencies: 223
-- Data for Name: reproducciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4962 (class 0 OID 16498)
-- Dependencies: 225
-- Data for Name: seguir_artista; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4963 (class 0 OID 16513)
-- Dependencies: 226
-- Data for Name: seguir_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4955 (class 0 OID 16410)
-- Dependencies: 218
-- Data for Name: suscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.suscripciones VALUES (6666, 1111, 4444, '2026-10-01', '2026-11-01', 'activo');
INSERT INTO public.suscripciones VALUES (7777, 2222, 5555, '2026-08-26', '2026-09-26', 'vencido');
INSERT INTO public.suscripciones VALUES (8888, 3333, 6666, '2026-09-26', '2026-10-26', 'activo');


--
-- TOC entry 4953 (class 0 OID 16398)
-- Dependencies: 216
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios VALUES (1111, 'benja', 'benjagz@gmail.com', 'benja123', '2003-10-23', '2026-07-20');
INSERT INTO public.usuarios VALUES (2222, 'pedro', 'pedrito123@gmail.com', 'pedrito67', '2001-09-23', '2026-02-20');
INSERT INTO public.usuarios VALUES (3333, 'sol', 'solcito@gmail.com', 'sol6767', '2009-09-23', '2026-09-20');


--
-- TOC entry 4785 (class 2606 OID 16440)
-- Name: albumes albumes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albumes
    ADD CONSTRAINT albumes_pkey PRIMARY KEY (id);


--
-- TOC entry 4783 (class 2606 OID 16433)
-- Name: artistas artistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artistas
    ADD CONSTRAINT artistas_pkey PRIMARY KEY (id);


--
-- TOC entry 4787 (class 2606 OID 16452)
-- Name: canciones canciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canciones
    ADD CONSTRAINT canciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 16492)
-- Name: me_gusta me_gusta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.me_gusta
    ADD CONSTRAINT me_gusta_pkey PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 16409)
-- Name: plan plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_pkey PRIMARY KEY (id);


--
-- TOC entry 4789 (class 2606 OID 16465)
-- Name: playlist playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (id);


--
-- TOC entry 4791 (class 2606 OID 16475)
-- Name: reproducciones reproducciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reproducciones
    ADD CONSTRAINT reproducciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4795 (class 2606 OID 16502)
-- Name: seguir_artista seguir_artista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguir_artista
    ADD CONSTRAINT seguir_artista_pkey PRIMARY KEY (id);


--
-- TOC entry 4797 (class 2606 OID 16517)
-- Name: seguir_usuario seguir_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguir_usuario
    ADD CONSTRAINT seguir_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4781 (class 2606 OID 16416)
-- Name: suscripciones suscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripciones
    ADD CONSTRAINT suscripciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 16402)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 16441)
-- Name: albumes albumes_artista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albumes
    ADD CONSTRAINT albumes_artista_id_fkey FOREIGN KEY (artista_id) REFERENCES public.artistas(id);


--
-- TOC entry 4801 (class 2606 OID 16453)
-- Name: canciones canciones_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canciones
    ADD CONSTRAINT canciones_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albumes(id);


--
-- TOC entry 4805 (class 2606 OID 16493)
-- Name: me_gusta me_gusta_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.me_gusta
    ADD CONSTRAINT me_gusta_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4802 (class 2606 OID 16466)
-- Name: playlist playlist_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4803 (class 2606 OID 16481)
-- Name: reproducciones reproducciones_cancion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reproducciones
    ADD CONSTRAINT reproducciones_cancion_id_fkey FOREIGN KEY (cancion_id) REFERENCES public.canciones(id);


--
-- TOC entry 4804 (class 2606 OID 16476)
-- Name: reproducciones reproducciones_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reproducciones
    ADD CONSTRAINT reproducciones_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4806 (class 2606 OID 16508)
-- Name: seguir_artista seguir_artista_artista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguir_artista
    ADD CONSTRAINT seguir_artista_artista_id_fkey FOREIGN KEY (artista_id) REFERENCES public.artistas(id);


--
-- TOC entry 4807 (class 2606 OID 16503)
-- Name: seguir_artista seguir_artista_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguir_artista
    ADD CONSTRAINT seguir_artista_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4808 (class 2606 OID 16518)
-- Name: seguir_usuario seguir_usuario_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguir_usuario
    ADD CONSTRAINT seguir_usuario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4809 (class 2606 OID 16523)
-- Name: seguir_usuario seguir_usuario_usuario_seguido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguir_usuario
    ADD CONSTRAINT seguir_usuario_usuario_seguido_id_fkey FOREIGN KEY (usuario_seguido_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4798 (class 2606 OID 16422)
-- Name: suscripciones suscripciones_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripciones
    ADD CONSTRAINT suscripciones_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.plan(id);


--
-- TOC entry 4799 (class 2606 OID 16417)
-- Name: suscripciones suscripciones_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripciones
    ADD CONSTRAINT suscripciones_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES public.usuarios(id);


-- Completed on 2026-10-01 03:08:19

--
-- PostgreSQL database dump complete
--

\unrestrict 99JVFUrVapHwGWRfaPSMgc4qEIzaTL3Ks14FsvK2XDiHX7jPnvj9DeK32jY3xxW

