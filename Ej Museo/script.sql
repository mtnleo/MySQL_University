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



);


CREATE TABLE visitas(



);


CREATE TABLE visitasguias(



);


/* DROPS */
DROP DATABASE museo;

/********************/
/* QUERIES SIMPLES */
/******************/


/* Queremos tener un listado de todos las escuelas. */
SELECT * FROM escuelas;

/* Queremos conocer el nombre y apellido de nuestras guias. */
SELECT nombre, apellido FROM guia;

/* Obtener un listado de las visitas */
SELECT * FROM visitas;

/* Obtener un listado de la reserva cuyo código es igual a 2. */
SELECT * FROM reserva WHERE codigo = 2;

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
SELECT * FROM escuela WHERE codigo > 1 AND localidad = 7600;

/************************/
/* QUERIES INTERMEDIAS */
/************************/

/* Listar la cantidad de Reservas realizadas para cada Escuela, ordenar el resultado por identificador de Escuela. */
SELECT Escuelas.nombre, count(Reservas.idEscuela)
FROM Escuelas
JOIN Reservas ON Reservas.IdEscuela = Escuelas.IdEscuela
GROUP BY (Escuelas.nombre)
ORDER BY Escuelas.codigo ASC;

/*
SELECT e.nombre, count(r.id_escuelas) 
FROM escuelas AS e
JOIN reservas AS r
ON e.id = r.id_escuelas
GROUP BY (e.nombre)
ORDER BY e.codigo ASC;
*/
/* Listar la cantidad de Reservas realizadas para cada Escuela, en cada mes. */
SELECT COUNT(r.Fecha.Month), e.nombre
FROM Escuelas as e
JOIN Reservas as r
ON e.id_escuela = r.id_escuela
GROUP BY (e.nombre)
ORDER BY (e.nombre) ASC;
