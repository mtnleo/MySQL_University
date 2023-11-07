/**********************************/
/* CREACION DE DATABASE Y TABLAS */
/********************************/

CREATE DATABASE Museo;
USE Museo;

CREATE TABLE escuelas(
	id_escuela int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    domicilio VARCHAR(100) NOT NULL
);

CREATE TABLE tipovisita(
	id_tipo_visita int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tipovisita VARCHAR(100) NOT NULL,
    arancel int NOT NULL
);

CREATE TABLE guias(
	id_guia int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL	
);

CREATE TABLE escuelastelefonos(
	id_escuelas_telefonos int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    telefono VARCHAR(9) NOT NULL,
    id_escuela int NOT NULL,
    CONSTRAINT fk_escuela FOREIGN KEY (id_escuela) REFERENCES escuelas (id_escuela)
);

CREATE TABLE reservas(
	id_reserva int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fecha DATETIME NOT NULL,
	id_escuela int,
	CONSTRAINT fk_escuela_reserva FOREIGN KEY (id_escuela) REFERENCES escuelas (id_escuela)
);


CREATE TABLE visitas(
	id_visita int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    grado int NOT NULL,
    cant_alumnos int,
    asistencia int,
    arancel int,
	id_reserva int,
    id_tipo_visita int,
    CONSTRAINT fk_reserva_visita FOREIGN KEY (id_reserva) REFERENCES reservas (id_reserva),
    CONSTRAINT fk_tipo_visita_visita FOREIGN KEY (id_tipo_visita) REFERENCES tipovisita (id_tipo_visita)

);


CREATE TABLE visitasguias(
	id_visita_guia int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    responsable VARCHAR (100) NOT NULL,
    id_reserva int,
    id_tipo_visita int,
    id_guia int,
    CONSTRAINT fk_reserva_visitasguias FOREIGN KEY (id_reserva) REFERENCES reservas (id_reserva),
    CONSTRAINT fk_tipo_visita_visitasguias FOREIGN KEY (id_tipo_visita) REFERENCES tipovisita (id_tipo_visita),
    CONSTRAINT fk_guia_visitasguias FOREIGN KEY (id_guia) REFERENCES guias (id_guia)
);


/* DROPS */
-- DROP DATABASE museo;

/********************/
/* CARGAR TABLAS */
/******************/
-- Llenar la tabla "escuelas" con escuelas ficticias
INSERT INTO escuelas (nombre, domicilio)
VALUES
    ('IDRA', 'Cordoba 1111'),
    ('Einstein', 'La Rioja 2222'),
    ('CADS', 'Almafuerte 3333'),
    ('San Alberto', 'Matheu 4444'),
    ('San Agustin', 'Guemes 5555');
    
    
-- Llenar la tabla "tipovisita" con tipos de visita ficticios
INSERT INTO tipovisita (tipovisita, arancel)
VALUES
    ('Animales Marinos', 100),
    ('Animales de Sabana', 150),
    ('Animales Selvaticos', 200),
    ('Serpentario', 80);
    
-- Llenar la tabla "guias" con guías ficticixs
INSERT INTO guias (nombre, apellido)
VALUES
    ('Martin', 'Leo'),
    ('Juana', 'Fuentes'),
    ('Sofia', 'del Puente');
    
-- Llenar la tabla "escuelastelefonos" con números de teléfono ficticios
INSERT INTO escuelastelefonos (telefono, id_escuela)
VALUES
    ('223511111', 1), -- Asociado al IDRA
    ('223322222', 2), -- Asociado al Einstein
    ('223433333', 3), -- Asociado al CADS
    ('223544444', 4), -- Asociado al San Alberto
    ('223512211', 1), -- Asociado al IDRA
    ('223655555', 5); -- Asociado al San Agustin
    
-- Llenar la tabla "reservas" con reservas ficticias
INSERT INTO reservas (fecha, id_escuela)
VALUES
    ('2023-09-01 10:00:00', 1), -- Reserva 1, IDRA
    ('2023-09-02 11:30:00', 2), -- Reserva 2, Einstein
    ('2023-09-03 09:15:00', 3), -- Reserva 3, CADS
    ('2023-09-04 14:00:00', 4), -- Reserva 4, San Alberto
    ('2023-09-04 14:00:00', 5), -- Reserva 4, San Alberto
    ('2023-09-05 09:30:00', 1), -- Reserva 5, IDRA
    ('2023-09-06 13:45:00', 2), -- Reserva 6, Einstein
    ('2023-09-07 15:20:00', 3); -- Reserva 7, CADS}
    
INSERT INTO reservas (fecha, id_escuela)
VALUES
    ('2021-09-01 10:00:00', 1), -- Reserva 1, IDRA
    ('2022-09-02 11:30:00', 2), -- Reserva 2, Einstein
    ('2021-09-03 09:15:00', 3), -- Reserva 3, CADS
    ('2022-09-04 14:00:00', 4), -- Reserva 4, San Alberto
    ('2024-09-04 14:00:00', 5), -- Reserva 4, San Alberto
    ('2024-09-05 09:30:00', 1), -- Reserva 5, IDRA
    ('2025-09-06 13:45:00', 2), -- Reserva 6, Einstein
    ('2026-09-07 15:20:00', 3); -- Reserva 7, CADS}    
    
INSERT INTO reservas (fecha, id_escuela)
VALUES
    ('2023-09-14 09:30:00', 1); -- Reserva 5, IDRA
    
-- agregar más meses
INSERT INTO reservas (fecha, id_escuela)
VALUES
    ('2023-10-01 10:00:00', 1), -- Reserva 1, IDRA
    ('2023-10-02 11:30:00', 2), -- Reserva 2, Einstein
    ('2023-02-03 09:15:00', 3), -- Reserva 3, CADS
    ('2023-11-04 14:00:00', 4), -- Reserva 4, San Alberto
    ('2023-01-04 14:00:00', 5), -- Reserva 4, San Alberto
    ('2023-03-05 09:30:00', 1), -- Reserva 5, IDRA
    ('2023-04-06 13:45:00', 2), -- Reserva 6, Einstein
	('2023-12-01 10:00:00', 1), -- Reserva 1, IDRA
    ('2023-12-02 11:30:00', 2), -- Reserva 2, Einstein
    ('2023-06-03 09:15:00', 3), -- Reserva 3, CADS
    ('2023-07-04 14:00:00', 4), -- Reserva 4, San Alberto
    ('2023-07-04 14:00:00', 5), -- Reserva 4, San Alberto
    ('2023-08-05 09:30:00', 1), -- Reserva 5, IDRA
    ('2023-10-06 13:45:00', 2), -- Reserva 6, Einstein
    ('2023-10-07 15:20:00', 3); -- Reserva 7, CADS}    
    
INSERT INTO visitas (grado, cant_alumnos, asistencia, arancel, id_tipo_visita)
VALUES
    (5, 30, 25, 200, 1),
    (6, 40, 38, 150, 2),
    (4, 20, 18, 100, 3), 
    (5, 30, 25, 200, 4), 
    (6, 40, 38, 150, 4),
    (4, 20, 18, 100, 4),
    (5, 30, 25, 200, 1),
    (6, 40, 38, 150, 1),
    (4, 20, 18, 100, 2), 
    (5, 30, 25, 200, 2),
    (6, 40, 38, 150, 3),
    (4, 20, 18, 100, 2); 
    
-- Llenar la tabla "visitasguias" con datos ficticios, utilizando el nombre del guía como responsable
INSERT INTO visitasguias (responsable, id_guia)
VALUES
    ((SELECT CONCAT(nombre, ' ', apellido) FROM guias WHERE id_guia = 1), 1), -- Visita Guía 1, Reserva 1, Guía 1 (IDRA, Tipo de Visita 1, Martin)
    ((SELECT CONCAT(nombre, ' ', apellido) FROM guias WHERE id_guia = 2), 2), -- Visita Guía 2, Reserva 2, Guía 2 (Einstein, Tipo de Visita 2, Juana)
    ((SELECT CONCAT(nombre, ' ', apellido) FROM guias WHERE id_guia = 3), 3), -- Visita Guía 3, Reserva 3, Guía 3 (CADS, Tipo de Visita 3, Sofia)
    ((SELECT CONCAT(nombre, ' ', apellido) FROM guias WHERE id_guia = 1), 2), -- Visita Guía 4, Reserva 4, Guía 1 (San Alberto, Serpentario, Martin)
    ((SELECT CONCAT(nombre, ' ', apellido) FROM guias WHERE id_guia = 2), 1), -- Visita Guía 5, Reserva 5, Guía 2 (San Alberto, Tipo de Visita 4, Juana)
    ((SELECT CONCAT(nombre, ' ', apellido) FROM guias WHERE id_guia = 3), 2), -- Visita Guía 6, Reserva 6, Guía 3 (IDRA, Tipo de Visita 5, Sofia)
    ((SELECT CONCAT(nombre, ' ', apellido) FROM guias WHERE id_guia = 1), 1), -- Visita Guía 7, Reserva 7, Guía 1 (Einstein, Tipo de Visita 6, Martin)
    ((SELECT CONCAT(nombre, ' ', apellido) FROM guias WHERE id_guia = 2), 2), -- Visita Guía 8, Reserva 1, Guía 2 (IDRA, Tipo de Visita 1, Juana)
    ((SELECT CONCAT(nombre, ' ', apellido) FROM guias WHERE id_guia = 3), 3); -- Visita Guía 9, Reserva 2, Guía 3 (Einstein, Tipo de Visita 2, Sofia)

    
/********************/
/* QUERIES SIMPLES */
/******************/


/* Queremos tener un listado de todos las escuelas. */
SELECT * FROM escuelas;

/* Queremos conocer el nombre y apellido de nuestras guias. */
SELECT nombre, apellido FROM guias;

/* Obtener un listado de las visitas */
SELECT * FROM visitas;

/* Obtener un listado de la reserva cuyo código es igual a 2. */
SELECT * FROM reservas WHERE id_reserva = 2;

/* ¿Existen reservas para este mes? */
SELECT COUNT(*) FROM reserva WHERE MONTH(fechaReserva) = MONTH(now);

/* Mostrar las escuelas cuyo código es mayor a 3 */
SELECT * FROM escuela WHERE codigo > 3;

/* Mostrar las escuelas cuyo código es igual a 4 */
SELECT * FROM escuela WHERE codigo = 4;

/* Mostrar las escuelas cuyo código está entre 2 y 4 */
SELECT * FROM escuela WHERE codigo BETWEEN 2 AND 4;

/* Mostrar las escuelas cuyo nombre comienza con E */
SELECT * FROM escuela WHERE nombre LIKE 'E%';

/* Mostrar las escuelas cuyo nombre contenga la ‘a’ o su domicilio comienza con ‘S’ */
SELECT * FROM escuela WHERE domicilio LIKE 'S%' OR nombre LIKE '%a%';

/* Mostrar las escuelas cuyo código es igual a 2 o su nombre termina con S */
SELECT * FROM escuela WHERE codigo = 2 OR nombre LIKE '%S';

/* Mostrar las escuelas cuyo codigo es mayor a 1 y su localidad sea igual a 7600 */
SELECT e.* FROM escuelas AS e WHERE e.codigo > 1 AND e.localidad = 7600;

/************************/
/* QUERIES INTERMEDIAS */
/************************/

/* Listar la cantidad de Reservas realizadas para cada Escuela, ordenar el resultado por identificador de Escuela. */
SELECT escuelas.nombre, count(reservas.id_escuela)
FROM escuelas
JOIN reservas ON reservas.id_escuela = escuelas.id_escuela
GROUP BY (escuelas.nombre)
ORDER BY escuelas.id_escuela ASC;

/*
SELECT e.nombre, count(r.id_escuelas) 
FROM escuelas AS e
JOIN reservas AS r
ON e.id = r.id_escuelas
GROUP BY (e.nombre)
ORDER BY e.codigo ASC;
*/
/* Listar la cantidad de Reservas realizadas para cada Escuela, en cada mes. */
SELECT COUNT(MONTH(r.fecha)), e.nombre, MONTH(r.fecha)
FROM escuelas as e
JOIN reservas as r
ON e.id_escuela = r.id_escuela
GROUP BY (e.nombre)
ORDER BY (e.nombre) ASC;



-- --------------------------------------------
-- SUBSCONSULTAS ------------------------------
-- --------------------------------------------

--  1. Listar Código y Nombre de cada Escuela, y obtener la cantidad de Reservas realizadas con una subconsulta.
SELECT e.id_escuela, e.nombre, (SELECT COUNT(*) FROM reservas AS r WHERE r.id_escuela = e.id_escuela) AS "cant_reservas"
FROM escuelas AS e;

-- 2. Listar Código y Nombre de cada Escuela, y obtener la cantidad de Reservas realizadas durante el
-- presente año, con una subconsuta. En caso de no haber realizado Reservas, mostrar el número cero.
SELECT e.id_escuela, e.nombre, (SELECT IFNULL(count(*),0) FROM reservas AS r WHERE r.id_escuela = e.id_escuela AND DATE_FORMAT(r.fecha, '%Y') = 2023 GROUP BY e.nombre) AS "Cantidad Reservas 2023"
FROM escuelas AS e;

-- 3. Para cada Tipo de Visita, listar el nombre y obtener con una subconsulta como tabla derivada la cantidad de Reservas realizadas.
-- resoluc
SELECT tv.tipovisita, cantidad
FROM tipovisita TV
INNER JOIN (SELECT Id_Tipo_Visita, count(*) as Cantidad
	FROM Visitas GROUP BY Id_Tipo_Visita) Cant ON TV.Id_Tipo_Visita = Cant.Id_Tipo_Visita;
    
    
-- 4. Para cada Guía, listar el nombre y obtener con una subconsulta como tabla derivada la cantidad de 
-- Visitas en las que participó como Responsable. En caso de no haber participado en ninguna, mostrar el número cero.
SELECT g.nombre, g.apellido, cant
FROM guias AS g, (SELECT COUNT(v_g.id_guia) AS cant FROM visitasguias AS v_g HAVING v_g.id_guia = g.id_guia);

SELECT G.nombre, ifnull(Cantidad, 0) as Cantidad
FROM Guias G 
LEFT JOIN (SELECT Id_Guia, count(*) as 'Cantidad'
	FROM VisitasGuias VG WHERE Responsable = 1 GROUP BY Id_Guia) Cantidades ON G.Id_Guia = Cantidades.Id_Guia;