CREATE DATABASE partido;
USE partido;

/* HARDCODE DIRECTO DE LA GUIA -------------------------------
*/
create table equipos(
	id_equipo int unsigned auto_increment,
	nombre_equipo varchar(50),
	constraint pk_equipos primary key (id_equipo)
);

create table jugadores(
	id_jugador int unsigned auto_increment,
	id_equipo int unsigned,
	nombre_jugador varchar(50),
	apellido varchar (50),
	constraint pk_id_jugador primary key (id_jugador),
	constraint fk_id_equipo foreign key (id_equipo) references equipos (id_equipo)
);

create table partidos(
	id_partido int unsigned auto_increment,
	id_equipo_local int unsigned,
	id_equipo_visitante int unsigned,
	fecha datetime,
	constraint pk_id_partido primary key (id_partido),
	constraint fk_local foreign key (id_equipo_local) references equipos (id_equipo),
	constraint fk_visitante foreign key (id_equipo_visitante) references equipos (id_equipo),
	constraint check (id_equipo_local <> id_equipo_visitante)
);

create table jugadores_x_equipo_x_partido(
	id_jugador int unsigned,
	id_partido int unsigned,
	puntos int unsigned,
	rebotes int unsigned,
	asistencias int unsigned,
	minutos int unsigned,
	faltas int unsigned,
	constraint pk_jugador_partido primary key (id_jugador, id_partido),
	constraint fk_id_jugador foreign key (id_jugador) references jugadores (id_jugador),
	constraint fk_id_partido foreign key (id_partido) references partidos (id_partido)
);

INSERT INTO equipos(nombre_equipo) VALUES ('River'), ('Boca');
INSERT INTO equipos(nombre_equipo) VALUES ('Atletico Tucuman'), ('San Lorenzo'),
('Racing');
INSERT INTO equipos(nombre_equipo) VALUES ('Patronato');
INSERT INTO equipos(nombre_equipo) VALUES ('Atletica Patronato');

INSERT INTO jugadores (id_equipo, nombre_jugador, apellido) VALUES
(1, 'Pablo', 'Fino'), (1, 'Matias', 'Tassara'),
(1, 'Fausto', 'Moya'), (1, 'Lisandro', 'Canueto'),
(1, 'Mariela', 'Cagnoli'), (2, 'Veronica', 'Tomich'),
(2, 'Ana', 'Nibio'), (2, 'Karina', 'Felice'), (2, 'Antonela', 'Bertarini'),
(3, 'Demi','Lovato'), (3, 'Selena', 'Gomez'), (3, 'Taylor', 'Switz'),
(3, 'Megan', 'Merkle'), (3, 'Principe', 'Harry'),
(4, 'Principe', 'Francescoli'), (4, 'Juampy', 'Sorin'),
(4, 'Marcelo', 'Gallardo'), (4, 'Javier', 'Saviola'), (4, 'Pablo', 'Aimar'),
(4, 'Burrito', 'Ortega');
INSERT INTO jugadores (id_equipo, nombre_jugador, apellido) VALUES
(6, 'Juan', 'Perez');
INSERT INTO jugadores (id_equipo, nombre_jugador, apellido) VALUES
(1, 'Bart', 'Simp'), (1, 'Lisa', 'Simp'),
(1, 'Hom', 'Simp'), (1, 'Flanders', 'Apu'),
(1, 'Garguir', 'Sergio'), (1, 'Marito', 'utn'),
(1, 'Mati', 'Tesou'), (1, 'Seba', 'DeLaF'),(2, 'Veronica', 'Castro'),
(2, 'Enrique', 'Iglesias'), (2, 'Esteban', 'Quito'), (2, 'Machu', 'Pichu'),
(3, 'Demi','Lovato');
INSERT INTO jugadores (id_equipo, nombre_jugador, apellido) VALUES
(2, 'Lorena', 'Paola'), (2, 'Pepe', 'Argento'),
(2, 'Pep', 'Guardiola'), (2, 'Pulga', 'Messi'),
(2, 'Florencio', 'Varela'), (2, 'Maria', 'Curi'),
(2, 'Martin', 'Rodriguez');
select *
from jugadores;
INSERT INTO partidos (id_equipo_local, id_equipo_visitante, fecha)
VALUES (1, 2, '2018-11-01'), (3, 4, '2018-11-02'),
(1, 3, '2018-11-03'), (2, 4, '2018-11-04'),
(1, 4, '2018-11-05'), (2, 3, '2018-11-06');

INSERT INTO jugadores_x_equipo_x_partido(id_jugador, id_partido, puntos, rebotes,
asistencias,
minutos, faltas) VALUES
(1,1,3,5,20,56,2), (2,1,6,7,12,90,4),(3,1,4,7,15,90,7),(4,3,8,4,3,45,1), (5,5,8,6,15,90,0),
(6,4,5,9,15,80,4), (7,6,6,7,8,25,2), (8,4,4,6,6,90,8), (9,6,7,8,9,41,6), (10,2,6,6,6,90,16),
(11,2,7,9,5,53,8), (12,2,5,6,2,82,6), (13,2,5,6,5,15,6), (14,2,8,5,6,40,13);
INSERT INTO jugadores_x_equipo_x_partido(id_jugador, id_partido, puntos, rebotes,
asistencias,
minutos, faltas) VALUES
(1,3,8,9,9,90,9), (2,3,8,7,15,46,9),(3,3,6,7,15,90,7),(4,1,2,9,9,90,8), (5,3,6,8,56,85,12),
(6,6,8,8,5,15,1), (7,4,8,17,4,90,5), (8,6,5,9,5,45,6), (9,4,5,6,9,90,3);
/* HARDCODE DIRECTO DE LA GUIA -------------------------------
*/
-- 1 - Listar los jugadores y a que equipo pertenecen (nombre, apellido, nombre_equipo).
SELECT jugadores.nombre_jugador, jugadores.apellido, equipos.nombre_equipo
FROM jugadores
JOIN equipos ON jugadores.id_equipo = equipos.id_equipo
ORDER BY jugadores.apellido;

-- 2 - Listar los equipos cuyo nombre comience con la letra P.
SELECT *
FROM equipos AS e
WHERE e.nombre_equipo LIKE "P%";

-- 3 - Listar los jugadores que pertenezcan a un equipo que contenga una “Atletico” o “Atlética” en su nombre (Por ej : Atletico Tucuman o Asociacion Atletica Patronato”)
SELECT j.nombre_jugador, j.apellido, e.nombre_equipo
FROM jugadores AS j
JOIN equipos as e ON j.id_equipo = e.id_equipo
WHERE e.nombre_equipo LIKE "%atletica%" OR e.nombre_equipo LIKE "%atletico%"
ORDER BY e.nombre_equipo DESC;

-- 4 - Listar los jugadores y su equipo siempre y cuando el jugador haya jugado al menos un partido.
SELECT j.nombre_jugador, j.apellido, e.nombre_equipo, jxexp.minutos
FROM jugadores AS j
JOIN equipos AS e ON j.id_equipo = e.id_equipo
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
WHERE jxexp.minutos > 0;

-- 5 - Listar los partidos con su fecha y los nombres de los equipos local y visitante.
SELECT p.fecha, e_l.nombre_equipo, e_v.nombre_equipo
FROM partidos AS p
JOIN equipos AS e_l ON p.id_equipo_local = e_l.id_equipo
JOIN equipos AS e_v ON p.id_equipo_visitante = e_v.id_equipo; 

-- 6 - Listar los equipos y la cantidad de jugadores que tiene.
SELECT e.nombre_equipo, COUNT(j.id_equipo)
FROM equipos AS e
JOIN jugadores AS j ON e.id_equipo = j.id_equipo
GROUP BY e.nombre_equipo;

-- 7 - Listar los jugadores y la cantidad de partidos que jugó.
SELECT j.nombre_jugador, j.apellido, COUNT(jxexp.id_jugador) as Cant_Partidos
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
GROUP BY j.id_jugador;

-- 8 - Elaborar un ranking con los jugadores que más puntos hicieron en el torneo


