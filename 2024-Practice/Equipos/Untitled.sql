-- CREATE DATABASE partidos;
-- USE partidos;
/*
CREATE TABLE equipos (
	id_equipo INT UNSIGNED auto_increment,
    nombre_equipo VARCHAR(50),
    CONSTRAINT pk_equipos PRIMARY KEY (id_equipo)
);

CREATE TABLE jugadores (
	id_jugador INT UNSIGNED AUTO_INCREMENT,
    id_equipo INT UNSIGNED,
    nombre_jugador VARCHAR(50),
    apellido VARCHAR(50),
    CONSTRAINT pk_id_jugador PRIMARY KEY (id_jugador),
    CONSTRAINT fk_id_equipo FOREIGN KEY (id_equipo) REFERENCES equipos (id_equipo)

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


INSERT INTO partidos (id_equipo_local, id_equipo_visitante, fecha)
VALUES (1, 2, '2018-11-01'), (3, 4, '2018-11-02'),
(1, 3, '2018-11-03'), (2, 4, '2018-11-04'),
(1, 4, '2018-11-05'), (2, 3, '2018-11-06');
INSERT INTO partidos (id_equipo_local, id_equipo_visitante, fecha)
VALUES (1, 2, '2023-04-01'), (3, 4, '2023-12-02'),
(1, 3, '2023-10-03'), (2, 4, '2023-11-04'),
(1, 4, '2023-11-05'), (2, 3, '2023-11-06');

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
*/
-- HARDCODE TERMINA

-- 1 - Listar los jugadores y a que equipo pertenecen (nombre, apellido, nombre_equipo).
SELECT j.nombre_jugador, j.apellido, e.nombre_equipo
FROM jugadores j
INNER JOIN equipos AS e
ON e.id_equipo = j.id_equipo;

-- 2 - Listar los equipos cuyo nombre comience con la letra P.
SELECT *
FROM equipos
WHERE nombre_equipo LIKE 'P%';

-- 3 - Listar los jugadores que pertenezcan a un equipo que contenga una “Atletico” o “Atlética” en su nombre (Por ej : Atletico Tucuman o Asociacion Atletica Patronato”)
SELECT * 
FROM jugadores j
JOIN equipos AS e
ON e.id_equipo = j.id_equipo
WHERE e.nombre_equipo LIKE '%Atl_tic_%';

-- 4 - Listar los jugadores y su equipo siempre y cuando el jugador haya jugado al menos un partido.
SELECT j.nombre_jugador, j.apellido, e.nombre_equipo
FROM jugadores j
INNER JOIN equipos e 
ON e.id_equipo = j.id_equipo
WHERE j.id_jugador IN (
	SELECT jxep.id_jugador
    FROM jugadores_x_equipo_x_partido jxep
    WHERE jxep.minutos > 0);

-- 5 - Listar los partidos con su fecha y los nombres de los equipos local y visitante. 
SELECT p.fecha, e_l.nombre_equipo AS local, e_v.nombre_equipo AS visitante
FROM partidos p 
JOIN equipos e_l ON e_l.id_equipo = p.id_equipo_local
JOIN equipos e_v ON e_v.id_equipo = p.id_equipo_visitante;

-- 6 - Listar los equipos y la cantidad de jugadores que tiene.
SELECT e.nombre_equipo, COUNT(j.id_jugador) AS canitdad_jugadores
FROM equipos e
INNER JOIN jugadores j ON j.id_equipo = e.id_equipo
GROUP BY e.nombre_equipo;

-- 7 - Listar los jugadores y la cantidad de partidos que jugó.
SELECT j.*, COUNT(jxep.minutos) AS partidos_jugados
FROM jugadores j
INNER JOIN jugadores_x_equipo_x_partido jxep
ON j.id_jugador = jxep.id_jugador
GROUP BY j.nombre_jugador
HAVING COUNT(jxep.minutos) > 0;

-- 8 - Elaborar un ranking con los jugadores que más puntos hicieron en el torneo
SELECT j.nombre_jugador, j.apellido, SUM(jxep.puntos) AS cantidad_puntos
FROM jugadores j 
INNER JOIN jugadores_x_equipo_x_partido jxep
ON j.id_jugador = jxep.id_jugador
GROUP BY j.apellido
ORDER BY SUM(jxep.puntos) DESC;

-- 9 - Elaborar un ranking con los jugadores que más promedio de puntos tienen en el torneo.
SELECT j.nombre_jugador, j.apellido, AVG(jxep.puntos) AS promedio_puntos
FROM jugadores j 
INNER JOIN jugadores_x_equipo_x_partido jxep
ON j.id_jugador = jxep.id_jugador
GROUP BY j.apellido
ORDER BY AVG(jxep.puntos) DESC;

-- 10 - Para cada jugador, mostrar la fecha del primer y último partido que jugó
SELECT j.*, MIN(p.fecha) AS primer_partido, MAX(p.fecha) AS ultimo_partido
FROM jugadores j
INNER JOIN jugadores_x_equipo_x_partido jxep
ON j.id_jugador = jxep.id_jugador
INNER JOIN partidos p
ON p.id_partido = jxep.id_partido
GROUP BY j.id_jugador;

-- 11 - Listar los equipos que tengan registrados mas de 10 jugadores
SELECT e.nombre_equipo, COUNT(j.id_jugador) AS cant_jugadores
FROM equipos e
INNER JOIN jugadores j
ON e.id_equipo = j.id_equipo
GROUP BY e.nombre_equipo
HAVING COUNT(j.id_jugador) > 10;

-- 12 - Listar los jugadores que hayan jugado más de 5 partidos y promediado más de 10 puntos por partido. 
SELECT j.nombre_jugador, j.apellido, SUM(jxep.id_partido) AS partidos_jugados, AVG(jxep.puntos) AS promedio_puntos
FROM jugadores j
INNER JOIN jugadores_x_equipo_x_partido jxep
ON j.id_jugador = jxep.id_jugador
GROUP BY j.nombre_jugador, j.apellido
HAVING SUM(jxep.id_partido) > 6 AND AVG(jxep.puntos) > 5;

-- 13 - Listar los jugadores que en promedio tengan más de 10 puntos , 10 asistencias y 10 rebotes por partido.
/*INGRESAR MAS INFO PARA HACER EL HAVING CON LA INFO QUE SE PIDE*/
SELECT j.nombre_jugador, j.apellido, AVG(jxep.puntos) AS prom_puntos, AVG(jxep.asistencias) AS prom_asistencias, AVG(jxep.rebotes) AS prom_rebotes
FROM jugadores j
INNER JOIN jugadores_x_equipo_x_partido jxep
ON jxep.id_jugador = j.id_jugador
GROUP BY j.nombre_jugador, j.apellido
HAVING prom_puntos > 5 AND prom_asistencias > 5 AND prom_rebotes > 5;

-- 14 - Dado un equipo y un partido, devolver cuantos puntos hizo cada equipo en cada uno de los partidos que jugó como local.
SELECT e.nombre_equipo, p.fecha, SUM(jxep.puntos) AS puntos_hechos
FROM equipos e
INNER JOIN partidos p
ON e.id_equipo = p.id_equipo_local
INNER JOIN jugadores_x_equipo_x_partido jxep
ON jxep.id_partido = p.id_partido
GROUP BY e.nombre_equipo;

-- 15 - Listar los equipos que hayan jugado como local más de 3 partidos. 
SELECT e.nombre_equipo, COUNT(p.id_partido) AS partidos_local
FROM equipos e
INNER JOIN partidos p
ON p.id_equipo_local = e.id_equipo
GROUP BY e.nombre_equipo
HAVING partidos_local > 3;

/********************************************************************
---------------------------------------------------------------------
||||||||||||||||| GUIA PROCEDIMIENTOS ALMACENADOS |||||||||||||||||||
*********************************************************************
---------------------------------------------------------------------*/

-- -----------------------------------------------------------------
-- 1. Generar un Stored Procedure que permite ingresar un equipo. --
-- -----------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE spAgregarEquipo (IN nuevoNombreEquipo VARCHAR(40))
BEGIN
	IF NOT EXISTS (
		SELECT nombre_equipo
        FROM equipos
        WHERE nombre_equipo = nuevoNombreEquipo
        )
	THEN
		INSERT INTO equipos (nombre_equipo) VALUES (nuevoNombreEquipo);
    ELSE
		SELECT "El equipo ya existe";
	END IF;
END//
DELIMITER ;


CALL spAgregarEquipo ("Inter Miami");
CALL spAgregarEquipo ("River Plate");

-- --------------------------------------------------------------------------------------------------------------------
-- 2. Generar un Stored Procedure que permita agregar un jugador pero se debe pasar el nombre del equipo y no el Id. --
-- --------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE spAgregarJugador (IN ins_nombre_equipo VARCHAR(40), IN nuevo_nombre_jugador VARCHAR(40), IN nuevo_apellido_jugador VARCHAR(40))
COMMENT "Agregar jugador"
BEGIN
	IF NOT EXISTS (
		SELECT id_equipo
        FROM equipos
        WHERE nombre_equipo = ins_nombre_equipo
    ) -- no existe el equipo lo agrega
    THEN
		INSERT INTO equipos (nombre_equipo)
        VALUES (ins_nombre_equipo);
        
        INSERT INTO jugadores (id_equipo, nombre_jugador, apellido)
        VALUES (LAST_INSERT_ID(), nuevo_nombre_jugador, nuevo_apellido_jugador);
    ELSE
		INSERT INTO jugadores (id_equipo, nombre_jugador, apellido)
        VALUES (
			(SELECT id_equipo FROM equipos WHERE nombre_equipo = ins_nombre_equipo)
			, nuevo_nombre_jugador, nuevo_apellido_jugador);
	END IF;
END //
DELIMITER ;


CALL agregar_jugador("River Plate", "Fernando", "Cavenaghi"); -- El equipo existe
CALL agregar_jugador("Real Madrid", "Facundo", "Campazzo"); -- El equipo no existe
CALL agregar_jugador("Patronato", "Julian", "Dominguez"); -- El equipo existe

-- ---------------------------------------------------------------------------------------------------------------------------------------
-- 3. Generar un Stored Procedure que permita dar de alta un equipo y sus jugadores. Devolver en un parámetro output el id del equipo.. --
-- ---------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE spAgregarJugadorDevolverIdEquipo(IN ins_nombre_equipo VARCHAR(40), IN n_nombre_jugador VARCHAR(40), IN n_apellido_jugador VARCHAR(40), OUT idEquipo INT)
COMMENT "Agregar un jugador y devolver ID del equipo"
BEGIN
	IF NOT EXISTS (
		SELECT id_equipo
        FROM equipos
        WHERE nombre_equipo = ins_nombre_equipo
	)
    THEN
		INSERT INTO equipos (nombre_equipo)
        VALUES (ins_nombre_equipo);
        
        SET idEquipo = LAST_INSERT_ID();
        
        INSERT INTO jugadores (id_equipo, nombre_jugador, apellido)
        VALUES (LAST_INSERT_ID(), n_nombre_jugador, n_apellido_jugador);
        
    ELSE
		SET idEquipo = (SELECT id_equipo FROM equipos WHERE nombre_equipo = ins_nombre_equipo);
    
		INSERT INTO jugadores (id_equipo, nombre_jugador, apellido)
        VALUES (
			(SELECT id_equipo FROM equipos WHERE nombre_equipo = ins_nombre_equipo),
			n_nombre_jugador, n_apellido_jugador);
    END IF;

END//
DELIMITER ;

CALL spAgregarJugadorDevolverIdEquipo("Real Madrid", "Facundo", "Campazzo", @idRM);
SELECT (@idRM);

-- ----------------------------------------------------------------------------------------------
-- 4. Generar un Stored Procedure que liste los partidos de un mes y año, pasado por parametro.--
-- ----------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE spListarPartidosMesAnio(IN mes INT, IN anio INT)
COMMENT "Listar partidos segun mes y anio"
BEGIN	
	SELECT fecha, e_l.nombre_equipo AS Local, e_v.nombre_equipo AS Visitante
    FROM partidos p
    INNER JOIN equipos AS e_l
    ON e_l.id_equipo = p.id_equipo_local
    INNER JOIN equipos AS e_v
    ON e_v.id_equipo = p.id_equipo_visitante
    WHERE MONTH(fecha) = mes AND YEAR(fecha) = anio;

END //
DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Generar un Stored Procedure que devuelva el resultado de un partido pasando por parámetro los nombres de los equipos. El resultado debe ser devuelto en dos variables output --
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE spDevolverResultadoPartido (IN nombre_equipo_local VARCHAR(40), IN nombre_equipo_visitante VARCHAR(40), OUT resultado_local INT, OUT resultado_visitante INT)
BEGIN
	IF NOT EXISTS (
		SELECT id_partido
        FROM partidos
        INNER JOIN equipos e_l
        ON e_l.id_equipo = p.id_equipo_local
        INNER JOIN equipos e_v
        ON e_v.id_equipo = p.id_equipo_visitante
        )
	THEN
		SELECT "No existe tal partido";
	ELSE
		SET resultado_local = (
			SELECT SUM(jxep.puntos) AS puntos_local
			FROM partidos
			INNER JOIN jugadores_x_equipo_x_partido jxep
			ON jxep.id_partido = p.id_partido
			GROUP BY id_equipo_local
			HAVING id_equipo_local = (SELECT e.id_equipo FROM equipos e WHERE nombre_equipo = nombre_equipo_local)
			);
        
        SET resultado_visitante = (
			SELECT SUM(jxep.puntos) AS puntos_visitante
			FROM partidos
			INNER JOIN jugadores_x_equipo_x_partido jxep
			ON jxep.id_partido = p.id_partido
			GROUP BY id_equipo_visitante
			HAVING id_equipo_visitante = (SELECT e.id_equipo FROM equipos e WHERE nombre_equipo = nombre_equipo_visitante)
			);
        
	END IF;
END //
DELIMITER ;

