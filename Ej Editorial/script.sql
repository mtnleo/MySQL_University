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

drop table libro;
drop table autor;
drop table editorial;