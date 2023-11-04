CREATE DATABASE GuiaSubconsultasEmpleados;
USE GuiaSubconsultasEmpleados;

CREATE TABLE Empleados (
	codigo_empleado INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nif VARCHAR(9),
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    codigo_departamento INT(10),
    CONSTRAINT fk_departamento FOREIGN KEY (codigo_departamento) REFERENCES Departamentos(codigo_departamento)
);

CREATE TABLE Departamentos (
	codigo_departamento INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    presupuesto DOUBLE
);

INSERT INTO Departamentos (nombre, presupuesto) VALUES
("Sistemas", 23000), #1
("Finanzas", 24000), #2
("Limpieza", 45000), #3
("Ciberseguridad", 20000); #4

INSERT INTO Departamentos (nombre, presupuesto) VALUES ("Empty", 10000); # Empty for 6.

INSERT INTO Empleados (nif, nombre, apellido1, apellido2, codigo_departamento) VALUES
("ASDASD", "Martin", "Leo", "Batti", 1),
("SADSGF", "Victoria", "Reeves", "", 4), 
("SCSDGD", "Facundo", "Grecario", "Ase", 2),
("SCSDGD", "Malena", "Braids", "", 2),
("DDASDSS", "Cross", "Moreno", "Travis", 1),
("DDDDDA", "Fernando", "Cavenaghi", "Suarez", 3), 
("XCZXCV", "Ezequiel", "Leonardi", "Batti", 3),
("BVNTGH", "Sofia", "Del Pez", "", 1),
("KJHGJY", "Herni", "Navarro", "Malevo", 4), 
("VCBTDFG", "Angelina", "Jolie", "Reeves", 2), 
("RETGEG", "Felpa", "Morgan", "Ace", 1),
("JHGKDH", "Long", "Tin", "Cho", 3),
("YUOIK", "Boris", "Batti", "I", 4),
("GHJMNH", "Phillip", "Blake", "", 4), 
("6R5TU", "Ezekiel", "Lionidra", "Stalagmite", 1),
("WERTGFV", "Pumba", "Timmy", "Simbo", 4);

-- ---------------------------------------
########### SUBQUERIES ###################
-- ---------------------------------------

-- Operadores básicos de comparación

-- 1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
SELECT e.codigo_empleado, e.nombre, e.apellido1
FROM Empleados AS e
WHERE e.codigo_departamento = (SELECT d.codigo_departamento FROM Departamentos AS d WHERE nombre LIKE ("%Sistemas%"));
-- 2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada
SELECT d.nombre, d.presupuesto
FROM Departamentos AS d
WHERE d.presupuesto = (SELECT MAX(presupuesto) FROM Departamentos);

-- 3.  Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
SELECT d.nombre, d.presupuesto
FROM Departamentos AS d
WHERE d.presupuesto = (SELECT MIN(presupuesto) FROM Departamentos);

-- Con ALL y ANY

-- 4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT
SELECT d.nombre, d.presupuesto
FROM Departamentos AS d
WHERE d.presupuesto >= ALL (SELECT presupuesto FROM Departamentos);

-- 5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT
SELECT d.nombre, d.presupuesto
FROM Departamentos AS d
WHERE d.presupuesto <= ALL (SELECT presupuesto FROM Departamentos);

-- 6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).
SELECT d.nombre
FROM Departamentos AS d
WHERE d.codigo_departamento = ANY (SELECT codigo_departamento FROM Empleados); # Excluye el departamento "Empty"

-- 7.Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).
SELECT d.nombre
FROM Departamentos AS d
WHERE d.codigo_departamento <> ALL (SELECT codigo_departamento FROM Empleados); # Devuelve el departamento "Empty"

-- Con IN y NOT IN 

-- 8. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN)
SELECT d.nombre
FROM Departamentos AS d
WHERE d.codigo_departamento IN (SELECT codigo_departamento FROM Empleados); # Excluye el departamento "Empty"

-- 9. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN)
SELECT d.nombre
FROM Departamentos AS d
WHERE d.codigo_departamento NOT IN (SELECT codigo_departamento FROM Empleados); # Es solo el departamento "Empty"

-- Con EXISTS y NOT EXISTS

-- 10.  Devuelve los nombres de los departamentos que tienen empleados asociados.
SELECT d.nombre
FROM Departamentos AS d
WHERE EXISTS (SELECT e.codigo_departamento FROM Empleados AS e WHERE d.codigo_departamento = e.codigo_departamento); # Excluye el departamento "Empty"

-- 11. Devuelve los nombres de los departamentos que no tienen empleados asociados.
SELECT d.nombre
FROM Departamentos AS d
WHERE NOT EXISTS (SELECT e.codigo_departamento FROM Empleados AS e WHERE d.codigo_departamento = e.codigo_departamento); # Es solo el departamento "Empty"