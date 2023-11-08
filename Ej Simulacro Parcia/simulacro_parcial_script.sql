CREATE DATABASE simulacroParcial;
USE simulacroParcial;

/*
ALUMNOS (legajo_al, nyap, f_nac, , domicilio, cod_post)
PROFESORES (legajo_prof, nyap, f_nac, , domicilio, cod_post)
CURSADAS (leg_al, leg_prof, materia, fecha_ini_cursada, nota_cursada)
MATERIAS (cod_mat, nom_mat, tipo_mat, anio_carrera_mat)
TIPO_MAT (cod_tipo, descrip_tipo)
*/

-- 1. Listar los nombres de las materias (nom_mat) que se dictaron durante el corriente año (2023)
SELECT m.nom_mat
FROM Materias AS m
WHERE YEAR(now()) = (SELECT YEAR(c.fecha_ini_cursada) FROM Cursadas AS c WHERE c.materia = m.cod_mat);

-- 2. Listar legajo y nombre de los alumnos junto con su promedio de notas , solo para estudiantes que tengan más de 10 cursadas.
SELECT
	a.legajo_al,
    a.nyap,
    AVG(c.nota_cursada)
FROM
	Alumnos AS a,
	Cursada AS c
WHERE
	a.legajo_al = c.leg_al AND
	(SELECT c.leg_al, COUNT(*) AS cant
    FROM Cursadas AS c
    GROUP BY c.leg_al) > 10;

-- 3. Listar los nombres de todas aquellas materias que aún no han sido dictadas en la institución.
SELECT
	m.cod_mat,
    m.nom_mat
FROM
	Materias AS m,
    Cursadas AS c 
WHERE (m.cod_mat = c.materia) AND c.fecha_ini_cursada > now();

-- 4. Crear un store procedure que de alta un nuevo profesor y nos devuelva el ID como parámetro de salida.
DELIMITER //
CREATE PROCEDURE agregar_profesor(IN nyap VARCHAR(30), f_nac DATE, domicilio VARCHAR(40), cod_post INT, OUT legajo_prof INT)
COMMENT "Agregar Profesor"
IF NOT EXISTS (SELECT p.nyap, p.f_nac, p.domicilio, p.cod_post
			   FROM Profesores AS p
               WHERE p.nyap = nyap AND p.f_nac = f_nac AND p.domicilio = domicilio AND p.cod_post = cod_post)
THEN
	INSERT INTO Profesores (nyap, f_nac, domicilio, cod_post)
    VALUES (nyap, f_nac, domicilio, cod_post);
    SET legajo_prof =  (SELECT p.nyap, p.f_nac, p.domicilio, p.cod_post
						FROM Profesores AS p
						WHERE p.nyap = nyap AND p.f_nac = f_nac AND p.domicilio = domicilio AND p.cod_post = cod_post);
ELSE
	SELECT("Ya existe un profesor con esa informacion");
END IF//
DELIMITER ;

CALL agregar_profesor("Adrian Arocca", '15-3-1972', 7600, "Nuñez 91218", @legajo_prof);
SELECT legajo_prof;

-- 5. Mostrar las 3 materias que tienen mejor promedio en su historial y las 3 materias que tienen el peor promedio en su historial.
-- Como salida tienen que mostrar Nombre de materia y el promedio.

(SELECT m.nombre_mat, AVG(c.nota_cursada)
FROM Materias AS m, Cursadas AS c
WHERE m.cod_materia = c.materia
GROUP BY m.nombre_mat
ORDER BY AVG(c.nota_cursada) DESC
LIMIT 3)
UNION
(SELECT m.nombre_mat, AVG(c.nota_cursada)
FROM Materias AS m, Cursadas AS c
WHERE m.cod_materia = c.materia
GROUP BY m.nombre_mat
ORDER BY AVG(c.nota_cursada) ASC
LIMIT 3)
