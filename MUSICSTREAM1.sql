-- tablas:

CREATE TABLE usuarios (
id INTEGER PRIMARY KEY,
nombre CHARACTER VARYING(20) NOT NULL,
correo CHARACTER VARYING (30) NOT NULL,
contrasena VARCHAR (255) NOT NULL,
fechaNacimiento DATE,
fechaRegistro DATE NOT NULL 
);

CREATE TABLE plan (
id INTEGER PRIMARY KEY,
nombre CHARACTER VARYING(15) NOT NULL,
precio NUMERIC(15,2) NOT NULL,
caracteristicas TEXT
);

CREATE TABLE suscripciones (
id INTEGER PRIMARY KEY,
usuarios_id INTEGER NOT NULL,
plan_id INTEGER NOT NULL,
fechaInicio DATE NOT NULL,
fechaFin DATE,
estado TEXT NOT NULL,
FOREIGN KEY (usuarios_id) 
REFERENCES usuarios (id),
FOREIGN KEY (plan_id)
REFERENCES plan (id)
);

CREATE TABLE artistas (
id INTEGER PRIMARY KEY,
nombreArtistico CHARACTER VARYING(15) NOT NULL,
biografia TEXT,
pais TEXT NOT NULL,
fechaDebut DATE NOT NULL
);

CREATE TABLE albumes (
id INTEGER PRIMARY KEY,
artista_id INTEGER NOT NULL,
titulo TEXT NOT NULL,
tipo TEXT,
fechaLanzamiento DATE NOT NULL,
imagenPortada TEXT,
FOREIGN KEY (artista_id)
REFERENCES artistas (id)
);

CREATE TABLE canciones (
id INTEGER PRIMARY KEY,
album_id INTEGER NOT NULL,
titulo TEXT NOT NULL,
duracion INTEGER NOT NULL,
anoLanzamiento DATE NOT NULL,
genero_principal TEXT NOT NULL,
archivo_audio TEXT NOT NULL,
FOREIGN KEY (album_id)
REFERENCES albumes (id)
);

CREATE TABLE playlist (
id INTEGER PRIMARY KEY,
usuarios_id INTEGER NOT NULL,
nombre TEXT NOT NULL,
descripcion TEXT,
fecha_creacion DATE NOT NULL,
es_publica BOOLEAN DEFAULT FALSE,
FOREIGN KEY (usuarios_id)
REFERENCES usuarios (id)
);

CREATE TABLE reproducciones (
id INTEGER PRIMARY KEY,
usuarios_id INTEGER NOT NULL,
cancion_id INTEGER NOT NULL,
fecha_hora TIMESTAMP NOT NULL,
duracion_escucha INTEGER,
FOREIGN KEY (usuarios_id)
REFERENCES usuarios (id),
FOREIGN KEY (cancion_id)
REFERENCES canciones (id)
);

CREATE TABLE me_gusta (
id INTEGER PRIMARY KEY,
usuarios_id INTEGER NOT NULL,
tipo_entidad TEXT, 
id_entidad INTEGER NOT NULL,
fecha DATE,
FOREIGN KEY (usuarios_id)
REFERENCES usuarios (id)
);

CREATE TABLE seguir_artista (
id INTEGER PRIMARY KEY,
usuarios_id INTEGER NOT NULL,
artista_id INTEGER NOT NULL,
fecha DATE,
FOREIGN KEY (usuarios_id)
REFERENCES usuarios (id),
FOREIGN KEY (artista_id)
REFERENCES artistas (id)
);

CREATE TABLE seguir_usuario (
id INTEGER PRIMARY KEY,
usuario_id INTEGER NOT NULL,
usuario_seguido_id INTEGER NOT NULL,
fecha DATE NOT NULL,
FOREIGN KEY (usuario_id) 
REFERENCES usuarios (id),
FOREIGN KEY (usuario_seguido_id) 
REFERENCES usuarios (id)
);


-- Datos:

INSERT INTO usuarios (id, nombre, correo, contrasena, fechanacimiento, fecharegistro) 
VALUES (1111, 'benja', 'benjagz@gmail.com', 'benja123', '2003-10-23', '2026-07-20');
INSERT INTO usuarios (id, nombre, correo, contrasena, fechanacimiento, fecharegistro)
VALUES (2222, 'pedro', 'pedrito123@gmail.com', 'pedrito67', '2001-09-23', '2026-02-20');
INSERT INTO usuarios (id, nombre, correo, contrasena, fechanacimiento, fecharegistro)
VALUES (3333, 'sol', 'solcito@gmail.com', 'sol6767', '2009-09-23', '2026-09-20');

--
-- 

INSERT INTO plan (id, nombre, precio, caracteristicas)
VALUES (4444, 'plan basico', 9000.00, 'hasta 2 dispositivos simultaneos, sin anuncios');
INSERT INTO plan (id, nombre, precio, caracteristicas)
VALUES (5555, 'plan intermedio', 12000.00, 'hasta 3 dispositivos simultaneos, sin anuncios');
INSERT INTO plan (id, nombre, precio, caracteristicas)
VALUES (6666, 'plan premium', 14000.00, 'hasta 4 dispositivos simultaneos, sin anuncios y descargas offline');

--
-- 

INSERT INTO suscripciones (id, usuarios_id, plan_id, fechainicio, fechafin, estado)
VALUES (6666, 1111, 4444, '2026-10-01', '2026-11-01', 'activo');
INSERT INTO suscripciones (id, usuarios_id, plan_id, fechainicio, fechafin, estado)
VALUES (7777, 2222, 5555, '2026-08-26', '2026-09-26', 'vencido');
INSERT INTO suscripciones (id, usuarios_id, plan_id, fechainicio, fechafin, estado)
VALUES (8888, 3333, 6666, '2026-09-26', '2026-10-26', 'activo');

--
-- 

INSERT INTO artistas (id, nombreartistico, biografia, pais, fechadebut)
VALUES (8001, 'slimesanti', 'trapero joven argentino', 'Argentina', '2023-03-29');
INSERT INTO artistas (id, nombreartistico, biografia, pais, fechadebut)
VALUES (8002, 'zell', 'joven balling', 'Argentina', '2018-10-15');
INSERT INTO artistas (id, nombreartistico, biografia, pais, fechadebut)
VALUES (8003, 'la mona jimenez', 'el rey del cuarteto', 'Argentina', '1967-05-22');

--
--

INSERT INTO albumes (id, artista_id, titulo, tipo, fechalanzamiento, imagenportada)
( VALUES (8004, 8001, 'friendzone', 'trap', '2026-05-16', 'slime.jpg');
INSERT INTO albumes (id, artista_id, titulo, tipo, fechalanzamiento, imagenportada)
( VALUES (8005, 8002, 'wowstar', 'trap', '2019-07-24', 'zell.jpg');
INSERT INTO albumes (id, artista_id, titulo, tipo, fechalanzamiento, imagenportada)
( VALUES (8006, 8003, 'gracias a dios', 'cuarteto', '2018-02-27', 'lamona.jpg');
