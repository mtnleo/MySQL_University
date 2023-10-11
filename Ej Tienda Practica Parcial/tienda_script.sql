-- Practica de Base de Datos sin una tabla que seguir
CREATE DATABASE TiendaPractica;
USE TiendaPractica;

/* CREAR TABLAS */
CREATE TABLE telefonos (
	id_telefono INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    marca VARCHAR(30),
    modelo VARCHAR(30),
    precio INT,
    id_empresa INT,
    CONSTRAINT fk_empresa FOREIGN KEY (id_empresa) REFERENCES empresas (id_empresa)
);

CREATE TABLE empresas (
	id_empresa INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(40),
    razon_social VARCHAR(50)
);

-- Insertar datos

INSERT INTO empresas (nombre, razon_social) VALUES ("Claro", "Claro SRL"), ("Personal", "Personal España"), ("Movistar", "Personal España");

INSERT INTO telefonos (marca, modelo, precio, id_empresa) VALUES
("Apple", "iPhone 15", 900, 1), -- iPhone 15 Claro
("Apple", "iPhone 15 Pro Max", 1400, 2), -- iPhone 15 pro max Personal
("Apple", "iPhone 15 Pro Max", 1400, 3), -- iPhone 15 pro max Movistar
("Samsung", "S22", 750, 1), -- S22 Claro
("Samsung", "S22", 750, 2), -- S22 Personal
("Xiaomi", "Redmi Note 12", 550, 3), -- RN12 Movistar
("Xiaomi", "Redmi Note 12", 550, 2), -- RN12 Personal
("Samsung", "Galaxy Fold 3", 1800, 1), -- Galaxy Fold Claro
("Moto", "G42", 340, 1), -- G42 Claro
("Moto", "G42", 340, 3); -- G42 Movistar

INSERT INTO telefonos (marca, modelo, precio, id_empresa) VALUES
("Xiaomi", "Mi 12 Pro", 1250, 3),
("Xiaomi", "Mi 12 Pro", 1250, 2);

ALTER TABLE empresas ADD pais_origen VARCHAR(20);

UPDATE empresas SET pais_origen = "España" WHERE id_empresa = (SELECT id_empresa FROM empresas WHERE razon_social LIKE ("%ESPAÑA%") AND nombre LIKE ("%C%"));
UPDATE empresas SET pais_origen = "España" WHERE id_empresa = (SELECT id_empresa FROM empresas WHERE razon_social LIKE ("%ESPAÑA%") AND nombre LIKE ("%P%"));
UPDATE empresas SET pais_origen = "Argentina" WHERE id_empresa = (SELECT id_empresa FROM empresas WHERE nombre LIKE ("%CLARO%"));

/* -------------------------
			Queries
   ------------------------- */
-- Ver todos los celulares
SELECT * FROM telefonos;

-- Ver celulares con Claro
SELECT t.marca, t.modelo, e.nombre AS "Empresa"
FROM telefonos AS t
JOIN empresas AS e ON t.id_empresa = e.id_empresa
WHERE e.nombre LIKE ("%CLARO%");

-- Ver celulares de menos de 600 dólares, ordenar precio de mayor a menor
SELECT t.marca, t.modelo, t.precio, e.nombre
FROM telefonos AS t
JOIN empresas AS e ON t.id_empresa = e.id_empresa
WHERE t.precio <= 600
ORDER BY t.precio DESC;

-- Listar la cantidad de telefonos que ofrece cada empresa
SELECT e.nombre, COUNT(t.id_empresa) AS cant_telef
FROM empresas AS e
JOIN telefonos AS t ON e.id_empresa = t.id_empresa
GROUP BY e.nombre
ORDER BY COUNT(t.id_empresa) DESC;

-- Listar todas los telefonos que vende Telefonica España (razon social) de arriba de 400 dolares con una marca que no contenga la letra "X"
SELECT t.marca, t.modelo, t.precio, e.nombre, e.razon_social
FROM telefonos AS t
JOIN empresas AS e ON t.id_empresa = e.id_empresa
WHERE e.razon_social LIKE ("%Personal España%") AND t.precio > 400 AND t.marca NOT LIKE ("%X%")
ORDER BY t.marca ASC;

-- Ver de que pais son las empresas que venden celulares arriba de 800usd
SELECT t.modelo, t.precio, e.pais_origen  
FROM telefonos AS t
JOIN empresas AS e ON t.id_empresa = e.id_empresa
WHERE t.precio > 800;
