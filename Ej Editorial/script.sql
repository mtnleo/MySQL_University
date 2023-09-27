/* UniversoLector */
CREATE  DATABASE UniversoLector;
USE UniversoLector;

/* Tablas */
CREATE TABLE editorial (
	codigo_editorial int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    razon_social VARCHAR(100),
    telefono VARCHAR(100)
);

CREATE TABLE autor (
	codigo_autor int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    apellido VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE libro (
	codigo_libro int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    isbn VARCHAR(13) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    anio_escritura VARCHAR(4),
    anio_edicion VARCHAR(4),
    codigo_editorial int,
    codigo_autor int,
    CONSTRAINT fk_editorial FOREIGN KEY (codigo_editorial) REFERENCES editorial (codigo_editorial),
    CONSTRAINT fk_autor FOREIGN KEY (codigo_autor) REFERENCES autor (codigo_autor)

);

CREATE TABLE volumen (
	codigo_volumen int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    codigo_libro int NOT NULL,
    deteriorado TINYINT(1),
    CONSTRAINT fk_libro FOREIGN KEY (codigo_libro) REFERENCES libro (codigo_libro)
);

CREATE TABLE socio (
	codigo_socio int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    dni int NOT NULL,
    apellido VARCHAR(100) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    localidad VARCHAR(100)
);

CREATE TABLE prestamo (
	codigo_prestamo int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    codigo_socio int NOT NULL,
    fecha DATE NOT NULL,
    fecha_devolucion DATE,
    fecha_tope DATE,
    CONSTRAINT fk_socio FOREIGN KEY (codigo_socio) REFERENCES socio (codigo_socio)
);

CREATE TABLE prestamoXvolumen (
	codigo_prestamoXvolumen int NOT NULL PRIMARY KEY,
    codigo_volumen int NOT NULL,
    codigo_prestamo int NOT NULL,
    CONSTRAINT fk_prestamo FOREIGN KEY (codigo_prestamo) REFERENCES prestamo (codigo_prestamo),
    CONSTRAINT fk_volumen FOREIGN KEY (codigo_volumen) REFERENCES volumen (codigo_volumen)

);

CREATE TABLE telefonoxsocio (
	codigo_telefonoxsocio int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    telefono VARCHAR(100),
    codigo_socio int NOT NULL,
    CONSTRAINT fk_socio_telefono FOREIGN KEY (codigo_socio) REFERENCES socio (codigo_socio)
);



/* DROP PARA CONTROLAR */
drop table libro;
drop table autor;
drop table editorial;