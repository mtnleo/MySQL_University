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

-- Más practica

UPDATE equipos SET nombre_equipo = "Boca Junior" WHERE id_equipo = (SELECT id_equipo FROM equipos WHERE nombre_equipo LIKE "BOCA");
UPDATE equipos SET nombre_equipo = "River Plate" WHERE id_equipo = (SELECT id_equipo FROM equipos WHERE nombre_equipo LIKE "RIV%");

/* HARDCODE DIRECTO DE LA GUIA -------------------------------
*/
-- 1 - Listar los jugadores y a que equipo pertenecen (nombre, apellido, nombre_equipo).
SELECT j.nombre_jugador, j.apellido, e.nombre_equipo
FROM jugadores AS j
JOIN equipos AS e ON j.id_equipo = e.id_equipo;

SELECT jugadores.nombre_jugador, jugadores.apellido, equipos.nombre_equipo
FROM jugadores
JOIN equipos ON jugadores.id_equipo = equipos.id_equipo
ORDER BY jugadores.apellido;

-- 2 - Listar los equipos cuyo nombre comience con la letra P.
SELECT e.nombre_equipo
FROM equipos AS e
WHERE e.nombre_equipo LIKE ("P%");

SELECT *
FROM equipos AS e
WHERE e.nombre_equipo LIKE "P%";

-- 3 - Listar los jugadores que pertenezcan a un equipo que contenga una “Atletico” o “Atlética” en su nombre (Por ej : Atletico Tucuman o Asociacion Atletica Patronato”)
SELECT j.nombre_jugador, j.apellido, e.nombre_equipo
FROM jugadores AS j
JOIN equipos AS e ON j.id_equipo = e.id_equipo
WHERE e.nombre_equipo LIKE ("%atletico%") OR e.nombre_equipo LIKE ("%atletica%");


SELECT j.nombre_jugador, j.apellido, e.nombre_equipo
FROM jugadores AS j
JOIN equipos as e ON j.id_equipo = e.id_equipo
WHERE e.nombre_equipo LIKE "%atletica%" OR e.nombre_equipo LIKE "%atletico%"
ORDER BY e.nombre_equipo DESC;

-- 4 - Listar los jugadores y su equipo siempre y cuando el jugador haya jugado al menos un partido.
SELECT j.nombre_jugador, j.apellido, COUNT(jxexp.id_partido) AS "Partidos Jugados"
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON j.id_jugador = jxexp.id_jugador
GROUP BY j.nombre_jugador, j.apellido
HAVING COUNT(jxexp.id_partido) > 0; 


SELECT j.nombre_jugador, j.apellido, e.nombre_equipo, jxexp.minutos
FROM jugadores AS j
JOIN equipos AS e ON j.id_equipo = e.id_equipo
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
WHERE jxexp.minutos > 0;

-- 5 - Listar los partidos con su fecha y los nombres de los equipos local y visitante.
SELECT p.fecha, e1.nombre_equipo AS "Local", e2.nombre_equipo AS "Visitante"
FROM partidos AS p
JOIN equipos AS e1 ON p.id_equipo_local = e1.id_equipo
JOIN equipos AS e2 ON p.id_equipo_visitante = e2.id_equipo
ORDER BY p.fecha DESC;


SELECT p.fecha, e_l.nombre_equipo, e_v.nombre_equipo
FROM partidos AS p
JOIN equipos AS e_l ON p.id_equipo_local = e_l.id_equipo
JOIN equipos AS e_v ON p.id_equipo_visitante = e_v.id_equipo; 

-- 6 - Listar los equipos y la cantidad de jugadores que tiene.
SELECT e.nombre_equipo, COUNT(j.id_equipo) AS "Jugadores"
FROM equipos AS e
JOIN jugadores AS j ON e.id_equipo = j.id_equipo
GROUP BY e.nombre_equipo
ORDER BY COUNT(j.id_equipo);


SELECT e.nombre_equipo, COUNT(j.id_equipo)
FROM equipos AS e
JOIN jugadores AS j ON e.id_equipo = j.id_equipo
GROUP BY e.nombre_equipo;

-- 7 - Listar los jugadores y la cantidad de partidos que jugó.
SELECT j.nombre_jugador, j.apellido, COUNT(jxexp.id_partido) AS "Partidos Jugados"
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON j.id_jugador = jxexp.id_jugador
GROUP BY j.nombre_jugador, j.apellido;


SELECT j.nombre_jugador, j.apellido, COUNT(jxexp.id_jugador) as Cant_Partidos
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
GROUP BY j.id_jugador;



-- 8 - Elaborar un ranking con los jugadores que más puntos hicieron en el torneo
SELECT j.nombre_jugador, j.apellido, SUM(jxexp.puntos) AS "Puntos hechos"
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
GROUP BY j.nombre_jugador, j.apellido
ORDER BY SUM(jxexp.puntos) DESC;


SELECT j.nombre_jugador, j.apellido, SUM(jxexp.puntos) AS puntos_totales
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
GROUP BY j.nombre_jugador, j.apellido
ORDER BY SUM(jxexp.puntos) DESC;

-- 9 - Elaborar un ranking con los jugadores que más promedio de puntos tienen en el torneo.
SELECT j.nombre_jugador, j.apellido, AVG(jxexp.puntos) AS "Promedio puntos"
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
GROUP BY j.nombre_jugador, j.apellido
ORDER BY AVG(jxexp.puntos) DESC;


SELECT j.nombre_jugador, j.apellido, AVG(jxexp.puntos) AS Prom_puntos
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
GROUP BY j.nombre_jugador, j.apellido
ORDER BY AVG(jxexp.puntos) DESC;

-- 10 - Para cada jugador, mostrar la fecha del primer y último partido que jugó
SELECT j.nombre_jugador, j.apellido, MIN(p.fecha) AS "Primer Partido", MAX(p.fecha) AS "Ultimo Partido"
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
JOIN partidos AS p ON jxexp.id_partido = p.id_partido
GROUP BY j.nombre_jugador, j.apellido;




SELECT j.nombre_jugador, j.apellido, jxexp.id_partido, MIN(p.fecha) AS primera_fecha, MAX(p.fecha) AS ultima_fecha
FROM jugadores as j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
JOIN partidos AS p ON p.id_partido = jxexp.id_partido
GROUP BY j.nombre_jugador, j.apellido;

-- 11 - Listar los equipos que tengan registrados mas de 10 jugadores
SELECT e.nombre_equipo, COUNT(j.id_equipo) AS "Cantidad Jugadores"
FROM equipos AS e
JOIN jugadores AS j ON e.id_equipo = j.id_equipo
GROUP BY e.nombre_equipo
HAVING COUNT(j.id_equipo) > 10;

SELECT e.nombre_equipo, COUNT(j.id_jugador) AS cant_jugadores
FROM equipos AS e
JOIN jugadores AS j ON e.id_equipo = j.id_equipo
GROUP BY e.nombre_equipo
HAVING COUNT(j.id_jugador) > 10;

-- 12 - Listar los jugadores que hayan jugado más de 5 partidos y promediado más de 10 puntos por partido. *
SELECT j.nombre_jugador, j.apellido, COUNT(jxexp.id_partido), AVG(jxexp.puntos)
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
GROUP BY j.nombre_jugador, j.apellido
HAVING COUNT(jxexp.id_partido) > 1 AND AVG(jxexp.puntos) > 4;


SELECT j.nombre_jugador, j.apellido, AVG(jxexp.puntos) AS promedio_puntos, COUNT(jxexp.id_jugador) AS partidos
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
JOIN partidos AS p ON p.id_partido = jxexp.id_partido
GROUP BY j.nombre_jugador, j.apellido
HAVING AVG(jxexp.puntos) > 5 AND COUNT(jxexp.id_jugador) > 1
ORDER BY AVG(jxexp.puntos) desc;

-- 13 - Listar los jugadores que en promedio tengan más de 10 puntos , 10 asistencias y 10 rebotes por partido.
/*INGRESAR MAS INFO PARA HACER EL HAVING CON LA INFO QUE SE PIDE*/
SELECT j.nombre_jugador, j.apellido, AVG(jxexp.puntos) AS puntos, AVG(jxexp.asistencias) AS asistencias, AVG(jxexp.rebotes) as rebotes
FROM jugadores AS j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
GROUP BY j.nombre_jugador, j.apellido
HAVING AVG(jxexp.puntos) > 5 AND AVG(jxexp.asistencias) > 5 AND AVG(jxexp.rebotes) > 5;


SELECT j.nombre_jugador, j.apellido, AVG(jxexp.puntos) AS prom_puntos, AVG(jxexp.asistencias) AS prom_asist, AVG(jxexp.rebotes) AS prom_rebotes
FROM jugadores as j
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
GROUP BY j.nombre_jugador, j.apellido
HAVING AVG(jxexp.puntos) > 5 AND AVG(jxexp.asistencias) > 5 AND AVG(jxexp.rebotes) > 5; -- Puse 5 para que exista, y no tener que hardcodear por siempre lxs otrxs jugadores

-- 14 - Dado un equipo y un partido, devolver cuantos puntos hizo cada equipo en cada uno de los partidos que jugó como local.
SELECT e.nombre_equipo, p.fecha, SUM(jxexp.puntos) AS puntos
FROM equipos AS e
JOIN partidos AS p ON p.id_equipo_local = e.id_equipo
JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_partido = p.id_partido
GROUP BY e.nombre_equipo;

-- 15 - Listar los equipos que hayan jugado como local mas de 3 partidos.
SELECT e.nombre_equipo, COUNT(p.id_equipo_local) partidos_local
FROM equipos AS e
JOIN partidos AS p ON e.id_equipo = p.id_equipo_local
GROUP BY e.nombre_equipo
HAVING COUNT(p.id_equipo_local) >= 2;



/********************************************************************
---------------------------------------------------------------------
||||||||||||||||| GUIA PROCEDIMIENTOS ALMACENADOS |||||||||||||||||||
*********************************************************************
---------------------------------------------------------------------*/

-- -----------------------------------------------------------------
-- 1. Generar un Stored Procedure que permite ingresar un equipo. --
-- -----------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE ingresar_equipo(IN nombre_equipo_ingresado VARCHAR(40))
COMMENT "Agregar un equipo a la tabla"
BEGIN
IF NOT EXISTS (
	SELECT e.nombre_equipo
    FROM Equipos AS e
    WHERE nombre_equipo_ingresado LIKE e.nombre_equipo
)
THEN
	INSERT INTO Equipos (nombre_equipo) VALUES (nombre_equipo_ingresado);
ELSE
	SELECT("El equipo ya existe");
END IF;
END//
DELIMITER ;

CALL ingresar_equipo("River Plate"); -- Está en la tabla
CALL ingresar_equipo("Excursionistas"); -- No está en la tabla

-- MOSTRAR TODOS LOS EQUIPOS
SELECT e.nombre_equipo
FROM Equipos AS e;

-- --------------------------------------------------------------------------------------------------------------------
-- 2. Generar un Stored Procedure que permita agregar un jugador pero se debe pasar el nombre del equipo y no el Id. --
-- --------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE agregar_jugador(nombre_equipo_agregar VARCHAR(40), nombre_jugador_agregar VARCHAR(40), apellido_jugador_agregar VARCHAR(40))
COMMENT "Agregar un jugador a la tabla"
BEGIN
	-- Chequeo si existe el equipo
	IF NOT EXISTS (
		SELECT e.nombre_equipo
        FROM Equipos AS e
        WHERE e.nombre_equipo LIKE nombre_equipo_agregar)
	THEN
		CALL ingresar_equipo(nombre_equipo_agregar);
	END IF;
	
    -- No chequeo si existe el jugador porque puede que existan dos con el mismo nombre/apellido
	INSERT INTO Jugadores (id_equipo, nombre_jugador, apellido)
    VALUES (
    (SELECT e.id_equipo
    FROM Equipos AS e
    WHERE e.nombre_equipo LIKE nombre_equipo_agregar), nombre_jugador_agregar, apellido_jugador_agregar);
END//
DELIMITER ;

DROP PROCEDURE agregar_jugador;

CALL agregar_jugador("River Plate", "Fernando", "Cavenaghi"); -- El equipo existe
CALL agregar_jugador("Real Madrid", "Facundo", "Campazzo"); -- El equipo no existe
CALL agregar_jugador("Patronato", "Julian", "Dominguez"); -- El equipo existe

-- Mostrar jugadores y sus equipos
SELECT j.nombre_jugador, j.apellido, e.nombre_equipo
FROM Jugadores AS j
JOIN Equipos AS e ON j.id_equipo = e.id_equipo
ORDER BY e.nombre_equipo;

-- ---------------------------------------------------------------------------------------------------------------------------------------
-- 3. Generar un Stored Procedure que permita dar de alta un equipo y sus jugadores. Devolver en un parámetro output el id del equipo.. --
-- ---------------------------------------------------------------------------------------------------------------------------------------
-- Es muy parecido al que hice en el 2 pero ahora tengo que devolver el ID del equipo.
DELIMITER //
CREATE PROCEDURE agregar_jugador_equipo(nombre_equipo_agregar VARCHAR(40), nombre_jugador_agregar VARCHAR(40), apellido_jugador_agregar VARCHAR(40), OUT id_equipo_out INT)
COMMENT "Agregar un jugador y un equipo a la tabla"
BEGIN
	-- Chequeo si existe el equipo
	IF NOT EXISTS (
		SELECT e.nombre_equipo
        FROM Equipos AS e
        WHERE e.nombre_equipo LIKE nombre_equipo_agregar)
	THEN
		CALL ingresar_equipo(nombre_equipo_agregar);
	END IF;
	
    -- No chequeo si existe el jugador porque puede que existan dos con el mismo nombre/apellido
    SET id_equipo_out = (SELECT e.id_equipo
    FROM Equipos AS e
    WHERE e.nombre_equipo LIKE nombre_equipo_agregar);
    
	INSERT INTO Jugadores (id_equipo, nombre_jugador, apellido)
    VALUES (id_equipo_out, nombre_jugador_agregar, apellido_jugador_agregar);
END//
DELIMITER ;

CALL agregar_jugador_equipo("Dallas Mavericks", "Luka", "Doncic", @equipo_retorno); 
SELECT @equipo_retorno;
CALL agregar_jugador_equipo("Boston Celtics", "Jason", "Tatum", @equipo_retorno);
SELECT @equipo_retorno;
CALL agregar_jugador_equipo("Boston Celtics", "Al", "Horford", @equipo_retorno); 
SELECT @equipo_retorno;
CALL agregar_jugador_equipo("Boston Celtics", "Jaylen", "Brown", @equipo_retorno);
SELECT @equipo_retorno;
CALL agregar_jugador_equipo("Denver Nuggets", "Nikola", "Jokic", @equipo_retorno); 
SELECT @equipo_retorno;

-- ----------------------------------------------------------------------------------------------
-- 4. Generar un Stored Procedure que liste los partidos de un mes y año, pasado por parametro.--
-- ----------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE show_partidos_mes_anio(mes_target INT, anio_target INT)
BEGIN
	SELECT e_l.nombre_equipo AS Equipo_Local, e_v.nombre_equipo AS Equipo_Visitante, p.fecha AS Fecha
    FROM Partidos AS p
    JOIN Equipos AS e_l ON p.id_equipo_local = e_l.id_equipo
    JOIN Equipos AS e_v ON p.id_equipo_visitante = e_v.id_equipo
    WHERE date_format(p.fecha, '%Y-%m') = CONCAT(anio_target, '-', LPAD(mes_target, 2, '0')) -- Combina año y mes en el formato 'YYYY-MM'
    ORDER BY p.fecha DESC;
END// 
DELIMITER ;

-- DROP PROCEDURE show_partidos_mes_anio;

CALL show_partidos_mes_anio(11, 2023);
CALL show_partidos_mes_anio(10, 2023);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Generar un Stored Procedure que devuelva el resultado de un partido pasando por parámetro los nombres de los equipos. El resultado debe ser devuelto en dos variables output --
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE devolver_resultado_partido(nombre_equipo_local VARCHAR(40), nombre_equipo_visitante VARCHAR(40), OUT resultado_local INT, OUT resultado_visitante INT)
BEGIN
	IF EXISTS (SELECT e_l.nombre_equipo, e_v.nombre_equipo
		FROM Partidos AS p
		JOIN Equipos AS e_l ON p.id_equipo_local = e_l.id_equipo
		JOIN Equipos AS e_v ON p.id_equipo_visitante = e_v.id_equipo)
    THEN
		SET resultado_local =   (SELECT SUM(jxexp.puntos)
								FROM Partidos AS p
								JOIN Equipos AS e_l ON p.id_equipo_local = e_l.id_equipo
								JOIN Equipos AS e_v ON p.id_equipo_visitante = e_v.id_equipo
                                JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_partido = p.id_partido
                                WHERE e_l.nombre_equipo LIKE nombre_equipo_local
                                GROUP BY e_l.id_equipo
                                );
		SET resultado_visitante =   (SELECT SUM(jxexp.puntos)
									FROM Partidos AS p
									JOIN Equipos AS e_l ON p.id_equipo_local = e_l.id_equipo
									JOIN Equipos AS e_v ON p.id_equipo_visitante = e_v.id_equipo
									JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_partido = p.id_partido
                                    WHERE e_v.nombre_equipo LIKE nombre_equipo_visitante
									GROUP BY e_v.id_equipo
                                    
                                );
    ELSE
		SELECT("No existe un partido entre esos dos equipos");
	END IF;
END//
DELIMITER ;

-- DROP PROCEDURE devolver_resultado_partido;

CALL devolver_resultado_partido("River Plate", "San Lorenzo", @resultado_local, @resultado_visitante);
SELECT @resultado_local AS "River Plate", @resultado_visitante AS "San Lorenzo";

CALL devolver_resultado_partido("River Plate", "Boca Junior", @resultado_local, @resultado_visitante);
SELECT @resultado_local AS "River Plate", @resultado_visitante AS "Boca Junior";

-- ------------------------------------------------------------------------------------------------------
-- 6. Generar un stored procedure que muestre las estadisticas promedio de los jugadores de un equipo. --
-- ------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE mostrar_estadisticas_jugadores(nombre_equipo_mostrar VARCHAR(40))
BEGIN
	SELECT j.nombre_jugador, j.apellido, AVG(jxexp.puntos) AS PUNTOS, AVG(jxexp.rebotes) AS REBOTES, AVG(jxexp.minutos) AS MINUTOS, AVG(jxexp.asistencias) AS ASISTENCIAS, AVG(jxexp.faltas) AS FALTAS
    FROM Equipos AS e
    JOIN Jugadores AS j ON j.id_equipo = e.id_equipo
    JOIN jugadores_x_equipo_x_partido AS jxexp ON jxexp.id_jugador = j.id_jugador
    WHERE e.nombre_equipo LIKE nombre_equipo_mostrar
    GROUP BY j.nombre_jugador, j.apellido;
END //
DELIMITER ;

-- DROP PROCEDURE mostrar_estadisticas_jugadores;

CALL mostrar_estadisticas_jugadores("River Plate");
CALL mostrar_estadisticas_jugadores("Boca Junior");


/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+                                                               +
+				   SUBQUERIES DE NUEVO                          +
+                                                               +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

-- -----------------------------------------------------------------
-- 1. Generar un Stored Procedure que permite ingresar un equipo. --
-- -----------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE agregar_equipo_1(IN nombre_equipo_add VARCHAR(50))
COMMENT "Agregar un equipo a la base de datos"
BEGIN
	IF NOT EXISTS
		(SELECT e.nombre_equipo
         FROM Equipos AS e
         WHERE e.nombre_equipo LIKE nombre_equipo_add)
	THEN
		INSERT Equipos(nombre_equipo)
        VALUES (nombre_equipo_add);
	ELSE
		SELECT("El equipo ya existe en la base de datos");
	END IF;
END //
DELIMITER ;

CALL agregar_equipo_1("River Plate");
CALL agregar_equipo_1("Dallas Mavericks");
CALL agregar_equipo_1("Taylor Swift FC");


-- --------------------------------------------------------------------------------------------------------------------
-- 2. Generar un Stored Procedure que permita agregar un jugador pero se debe pasar el nombre del equipo y no el Id. --
-- --------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE agregar_jugador_nombre_equipo_1(IN nombre_jugador_add VARCHAR(50), apellido_jugador_add VARCHAR(50), nombre_equipo_add VARCHAR(50))
BEGIN
-- Chequeo si existe el equipo
	IF NOT EXISTS (
		SELECT e.nombre_equipo
        FROM Equipos AS e
        WHERE e.nombre_equipo LIKE nombre_equipo_add)
	THEN
		CALL ingresar_equipo(nombre_equipo_add);
	END IF;

	INSERT INTO Jugadores(id_equipo, nombre_jugador, apellido)
    VALUES ((SELECT e.id_equipo
			 FROM Equipos AS e
             WHERE e.nombre_equipo LIKE (nombre_equipo_add)),
             nombre_jugador_add,
			 apellido_jugador_add
				);
END //
DELIMITER ;


-- DROP PROCEDURE agregar_jugador_nombre_equipo_1;

CALL agregar_jugador_nombre_equipo_1("Taylor Alison", "Swift", "River Plate");

SELECT e.nombre_equipo, j.nombre_jugador, j.apellido
FROM Equipos AS e, Jugadores AS j
WHERE e.id_equipo = j.id_equipo AND e.nombre_equipo LIKE ("River Plate");

-- ---------------------------------------------------------------------------------------------------------------------------------------
-- 3. Generar un Stored Procedure que permita dar de alta un equipo y sus jugadores. Devolver en un parámetro output el id del equipo.. --
-- ---------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE agregar_jugador_nombre_equipo_devolver_id_equipo(IN nombre_jugador_add VARCHAR(50), apellido_jugador_add VARCHAR(50), nombre_equipo_add VARCHAR(50), OUT id_equipo_add int)
BEGIN
-- Chequeo si existe el equipo
	IF NOT EXISTS (
		SELECT e.nombre_equipo
        FROM Equipos AS e
        WHERE e.nombre_equipo LIKE nombre_equipo_add)
	THEN
		CALL ingresar_equipo(nombre_equipo_add);
        SET id_equipo_add = last_insert_id();
	ELSE 
		SET id_equipo_add = (
		SELECT e.id_equipo
        FROM Equipos AS e
        WHERE e.nombre_equipo LIKE nombre_equipo_add);
	END IF;

	INSERT INTO Jugadores(id_equipo, nombre_jugador, apellido)
    VALUES ((SELECT e.id_equipo
			 FROM Equipos AS e
             WHERE e.nombre_equipo LIKE (nombre_equipo_add)),
             nombre_jugador_add,
			 apellido_jugador_add
				);
END //
DELIMITER ;

CALL agregar_jugador_nombre_equipo_devolver_id_equipo("Travis", "Kelce", "Kansas City Chiefs", @id_equipo_kelce);
CALL agregar_jugador_nombre_equipo_devolver_id_equipo("Male", "Bri", "Argentina FC", @id_equipo_male);

SELECT e.id_equipo, e.nombre_equipo
FROM Equipos AS e
WHERE e.id_equipo = @id_equipo_male;

-- ----------------------------------------------------------------------------------------------
-- 4. Generar un Stored Procedure que liste los partidos de un mes y año, pasado por parametro.--
-- ----------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE mostrar_partidos_mm_yy(anio_partido INT, mes_partido INT)
BEGIN
	SELECT p.fecha, e_l.nombre_equipo AS Equipo_local, e_v.nombre_equipo AS Equipo_visitante
    FROM Partidos AS p
    JOIN Equipos AS e_l ON p.id_equipo_local = e_l.id_equipo
    JOIN Equipos AS e_v ON p.id_equipo_visitante = e_v.id_equipo
    WHERE YEAR(p.fecha) = anio_partido AND MONTH(p.fecha) = mes_partido;
END //
DELIMITER ;

-- DROP PROCEDURE mostrar_partidos_mm_yy;

CALL mostrar_partidos_mm_yy(2023, 11);
CALL mostrar_partidos_mm_yy(2023, 10);
CALL mostrar_partidos_mm_yy(2018, 11);

/********************************************************************
---------------------------------------------------------------------
|||||||||||||||| PROCEDIMIENTOS ALMACENADOS AGAIN |||||||||||||||||||
*********************************************************************
---------------------------------------------------------------------*/

-- 1. Generar un stored procedure que te permita agregar un equipo
DELIMITER //
CREATE PROCEDURE agregar_equipo_3 (IN nombre_equipo_add VARCHAR(50))
BEGIN
	IF NOT EXISTS
	(SELECT e.id_equipo
     FROM Equipos AS e
     WHERE e.nombre_equipo LIKE nombre_equipo_add)
     THEN
		INSERT INTO Equipos (nombre_equipo)
        VALUES (nombre_equipo_add);
     ELSE   
		SELECT ("El equipo ya existe");
	END IF;
END//
DELIMITER ;

CALL agregar_equipo_3 ("UTN FC");

SELECT nombre_equipo FROM Equipos;

-- 2. Generar un Stored Procedure que permita agregar un jugador pero se debe pasar el nombre del equipo y no el Id. 
DELIMITER //
CREATE PROCEDURE agregar_jugador_3 (IN nombre_jugador_add VARCHAR(50), apellido_jugador_add VARCHAR(50), nombre_equipo_add_to VARCHAR(50))
BEGIN
	IF EXISTS
    (SELECT e.id_equipo
     FROM Equipos AS e
     WHERE e.nombre_equipo LIKE nombre_equipo_add_to)
    THEN
		INSERT INTO Jugadores (id_equipo, nombre_jugador, apellido)
		VALUES ((SELECT e.id_equipo
				FROM Equipos AS e
				WHERE e.nombre_equipo LIKE nombre_equipo_add_to)
			   , nombre_jugador_add
			   , apellido_jugador_add);
	ELSE
		INSERT INTO Equipos (nombre_equipo)
        VALUES (nombre_equipo_add_to);
		INSERT INTO Jugadores (id_equipo, nombre_jugador, apellido)
		VALUES ( last_insert_id()
			   , nombre_jugador_add
			   , apellido_jugador_add);
	END IF;
END //
DELIMITER ;

CALL agregar_jugador_3 ("Malena", "Brie", "UTN FC");
CALL agregar_jugador_3 ("John", "Doe", "Cookie Dough");

SELECT j.* FROM Equipos AS e, Jugadores AS j WHERE j.id_equipo = e.id_equipo AND e.nombre_equipo LIKE ("Cookie Dough");

-- 3. Generar un Stored Procedure que permita dar de alta un equipo y sus jugadores. Devolver en un parámetro output el id del equipo.
DELIMITER //
CREATE PROCEDURE agregar_jugadores_devolver_equipo_3 (IN nombre_jugador_add VARCHAR(50), apellido_jugador_add VARCHAR(50), nombre_equipo_add_to VARCHAR(50), OUT id_equipo_agregado INT)
BEGIN
	IF EXISTS
    (SELECT e.id_equipo
     FROM Equipos AS e
     WHERE e.nombre_equipo LIKE nombre_equipo_add_to)
    THEN
		INSERT INTO Jugadores (id_equipo, nombre_jugador, apellido)
		VALUES ((SELECT e.id_equipo
				FROM Equipos AS e
				WHERE e.nombre_equipo LIKE nombre_equipo_add_to)
			   , nombre_jugador_add
			   , apellido_jugador_add);
               
		SET id_equipo_agregado = (SELECT e.id_equipo
				FROM Equipos AS e
				WHERE e.nombre_equipo LIKE nombre_equipo_add_to);
	ELSE
		INSERT INTO Equipos (nombre_equipo)
        VALUES (nombre_equipo_add_to);
        
		INSERT INTO Jugadores (id_equipo, nombre_jugador, apellido)
		VALUES ( last_insert_id()
			   , nombre_jugador_add
			   , apellido_jugador_add);
               
		SET id_equipo_agregado = last_insert_id();
	END IF;
END //
DELIMITER ;

CALL agregar_jugadores_devolver_equipo_3 ("Fulano", "De Tal", "Cookie Dough", @id_equipo_agregado);

SELECT j.* FROM Equipos AS e, Jugadores AS j WHERE j.id_equipo = e.id_equipo AND e.nombre_equipo LIKE ("Cookie Dough");
SELECT (@id_equipo_agregado);

CALL agregar_jugadores_devolver_equipo_3 ("John", "De La Fuente", "Margaritas FC", @id_equipo_agregado_2);
SELECT j.* FROM Equipos AS e, Jugadores AS j WHERE j.id_equipo = e.id_equipo AND e.nombre_equipo LIKE ("Margaritas FC");
SELECT (@id_equipo_agregado_2);

-- 4. Generar un Stored Procedure que liste los partidos de un mes y año, pasado por parametro.
DELIMITER //
CREATE PROCEDURE show_partido_mes_año_3 (IN anio INT, mes INT)
BEGIN
	SELECT e_l.nombre_equipo AS "Local", e_v.nombre_equipo AS "Visitante", p.fecha
    FROM Partidos AS p
    JOIN Equipos AS e_l ON p.id_equipo_local = e_l.id_equipo
    JOIN Equipos AS e_v ON p.id_equipo_visitante = e_v.id_equipo
    WHERE MONTH(p.fecha) = mes AND YEAR(p.fecha) = anio;
END //
DELIMITER ;

CALL show_partido_mes_año_3 (2023, 11);
CALL show_partido_mes_año_3 (2018, 10);
CALL show_partido_mes_año_3 (2018, 11);

-- 5. Generar un Stored Procedure que devuelva el resultado de un partido pasando por
-- parámetro los nombres de los equipos. El resultado debe ser devuelto en dos variables output
DELIMITER //
CREATE PROCEDURE get_resultado_partido_3(IN equipo_local_get VARCHAR(50), equipo_visitante_get VARCHAR(50), OUT puntaje_local INT, OUT puntaje_visitante INT)
BEGIN
	SET puntaje_local = (SELECT SUM(jep.puntos) 
						 FROM jugadores_x_equipo_x_partido AS jep
                         JOIN Partidos AS p ON p.id_partido = jep.id_partido
                         JOIN Jugadores AS j ON j.id_jugador = jep.id_jugador
                         GROUP BY jep.id_partido
                         HAVING j.id_equipo = (SELECT e.id_equipo FROM Equipos AS e WHERE e.nombre_equipo LIKE equipo_local_get)
                         LIMIT 1);
	SET puntaje_visitante = (SELECT SUM(jep.puntos) 
						 FROM jugadores_x_equipo_x_partido AS jep
                         JOIN Partidos AS p ON p.id_partido = jep.id_partido
                         JOIN Jugadores AS j ON j.id_jugador = jep.id_jugador
                         GROUP BY jep.id_partido
                         HAVING j.id_equipo = (SELECT e.id_equipo FROM Equipos AS e WHERE e.nombre_equipo LIKE equipo_visistante_get)
                         LIMIT 1);

END //
DELIMITER ;

DROP PROCEDURE get_resultado_partido_3;

CALL get_resultado_partido_3 ("River Plate", "Boca Junior", @resultado_river, @resultado_boca);
SELECT @resultado_river AS River, @resultado_boca AS Boca;

-- 6. Generar un stored procedure que muestre las estadisticas promedio de los jugadores de un equipo. 

DELIMITER //
CREATE PROCEDURE show_statistics_player_team(IN nombre_equipo_show VARCHAR(50))
BEGIN
	SELECT j.nombre_jugador, j.apellido, AVG(jep.puntos) AS Puntos, AVG(jep.rebotes) AS Rebotes, AVG(jep.asistencias) AS Asistencias, AVG(jep.minutos) AS Minutos, AVG(jep.faltas) AS Faltas
    FROM Equipos AS e, Jugadores AS j
    JOIN jugadores_x_equipo_x_partido AS jep ON jep.id_jugador = j.id_jugador
    WHERE e.id_equipo = j.id_equipo AND e.id_equipo = (SELECT eq.id_equipo FROM Equipos AS eq WHERE eq.nombre_equipo = nombre_equipo_show)
    GROUP BY j.id_jugador;
    
END //
DELIMITER ;

DROP PROCEDURE show_statistics_player_team;

CALL show_statistics_player_team ("River Plate");