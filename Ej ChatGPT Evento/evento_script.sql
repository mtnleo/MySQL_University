CREATE DATABASE Evento;
USE Evento;

CREATE TABLE Personal (
	id_personal int AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    honorarios_hora int,
    telefono VARCHAR(9),
    email VARCHAR(30)
);

CREATE TABLE Actividades (
	id_actividad int AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Participantes (
	id_participante int AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(9),
    email VARCHAR(30)
);

CREATE TABLE Eventos (
	id_evento int AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(40),
    fecha DATETIME,
    ubicacion VARCHAR(40),
    duracion int
);

CREATE TABLE Recursos (
	id_recurso int AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    costo_hora int

);

CREATE TABLE PersonalXEvento (
	id_personal_evento int AUTO_INCREMENT PRIMARY KEY,
    id_evento int,
    id_personal int,
    horas int,
    CONSTRAINT fk_evento_personal_evento FOREIGN KEY (id_evento) REFERENCES Eventos (id_evento),
    CONSTRAINT fk_personal_personal_evento FOREIGN KEY (id_personal) REFERENCES Personal (id_personal)
);

CREATE TABLE ActividadXEvento (
	id_actividad_evento int AUTO_INCREMENT PRIMARY KEY,
    id_evento int,
    id_actividad int,
    CONSTRAINT fk_evento_actividad_evento FOREIGN KEY (id_evento) REFERENCES Eventos (id_evento),
    CONSTRAINT fk_actividad_actividad_evento FOREIGN KEY (id_actividad) REFERENCES Actividades (id_actividad)

);

CREATE TABLE ParticipanteXEvento (
	id_participante_evento int AUTO_INCREMENT PRIMARY KEY,
    id_evento int,
    id_participante int,
    CONSTRAINT fk_evento_participante_evento FOREIGN KEY (id_evento) REFERENCES Eventos (id_evento),
    CONSTRAINT fk_participante_participante_evento FOREIGN KEY (id_participante) REFERENCES Participantes (id_participante)
);

CREATE TABLE RecursoXEvento (
	id_recurso_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_evento int,
    id_recurso int,
    cantidad int,
    horas int,
    CONSTRAINT fk_evento_recurso_evento FOREIGN KEY (id_evento) REFERENCES Eventos (id_evento),
    CONSTRAINT fk_recurso_recurso_evento FOREIGN KEY (id_recurso) REFERENCES Recursos (id_recurso)
);

CREATE TABLE CostoXEvento (
	id_costo_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_evento int,
    id_recurso_evento int,
    id_personal_evento int,
    CONSTRAINT fk_evento_costo_evento FOREIGN KEY (id_evento) REFERENCES Eventos (id_evento),
    CONSTRAINT fk_recurso_evento_costo_evento FOREIGN KEY (id_recurso_evento) REFERENCES RecursoXEvento (id_recurso_evento),
    CONSTRAINT fk_personal_evento_costo_evento FOREIGN KEY (id_personal_evento) REFERENCES PersonalXEvento (id_personal_evento)


);
