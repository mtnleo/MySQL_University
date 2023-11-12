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
-- Este esta bien :)

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
 /*   Consigna que dio en clase
SELECT a.nyap
FROM Alumnos AS a
WHERE (SELECT AVG(nota_alumno_cursadas)
	   FROM (
			SELECT c.nota_cursada
            FROM Cursadas AS c
            WHERE a.legajo_al = c.leg_al) nota_alumno_cursadas)
		> (
        SELECT AVG(c.nota_cursada)
        FROM Cursadas AS c
        WHERE c.leg_al = a.legajo_al);

*/
-- 3. Listar los nombres de todas aquellas materias que aún no han sido dictadas en la institución.
-- 1 manera
SELECT m.nombre
FROM Materias AS m
WHERE NOT EXISTS
	(SELECT c.leg_materia
     FROM Cursadas AS c
     WHERE c.materia = m.cod_mat);
     
-- 2 manrea
SELECT m.nom_mat
FROM Materias AS m
LEFT JOIN Cursadas AS c
ON m.cod_mat = c.materia
WHERE c.materia IS null;

-- mi manera (creo q no)
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
BEGIN
IF NOT EXISTS (SELECT p.nyap, p.f_nac, p.domicilio, p.cod_post
			   FROM Profesores AS p
               WHERE p.nyap = nyap AND p.f_nac = f_nac AND p.domicilio = domicilio AND p.cod_post = cod_post)
THEN
	INSERT INTO Profesores (nyap, f_nac, domicilio, cod_post)
    VALUES (nyap, f_nac, domicilio, cod_post);
    SET legajo_prof = last_insert_id();  -- (SELECT p.legajo_prof
										 -- FROM Profesores AS p
										 -- WHERE p.nyap = nyap AND p.f_nac = f_nac AND p.domicilio = domicilio AND p.cod_post = cod_post);
ELSE
	SELECT("Ya existe un profesor con esa informacion");
END IF;
END//
DELIMITER ;

CALL agregar_profesor("Adrian Arocca", '15-3-1972', 7600, "Nuñez 91218", @legajo_prof);
SELECT @legajo_prof;

-- 5. Mostrar las 3 materias que tienen mejor promedio en su historial y las 3 materias que tienen el peor promedio en su historial.
-- Como salida tienen que mostrar Nombre de materia y el promedio.

(SELECT m.nombre_mat, AVG(c.nota_cursada)
FROM Materias AS m, Cursadas AS c
WHERE m.cod_materia = c.materia
GROUP BY m.nombre_mat
ORDER BY AVG(c.nota_cursada) DESC
LIMIT 3)
UNION ALL
(SELECT m.nombre_mat, AVG(c.nota_cursada)
FROM Materias AS m, Cursadas AS c
WHERE m.cod_materia = c.materia
GROUP BY m.nombre_mat
ORDER BY AVG(c.nota_cursada) ASC
LIMIT 3);
/*
*
-- -----------------------------------
-- REHACER ---------------------------
-- -----------------------------------
*
*/
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
WHERE YEAR(now()) = (SELECT YEAR(c.fecha_ini_cursada) FROM Cursadas AS c WHERE c.materia = c.cod_mat);

-- 2. Listar legajo y nombre de los alumnos junto con su promedio de notas ,
-- solo para estudiantes que tengan más de 10 cursadas.
SELECT a.legajo_al, a.nyap, AVG(c.nota_cursada) AS promedio_notas
FROM Alumnos AS a, Cursadas AS c
WHERE a.legajo_al = c.leg_al
	  AND
      (SELECT c.nota_cursada, COUNT(*)
       FROM Cursadas AS c
       WHERE c.leg_al = a.legajo_al) >= 10;
       
-- 3. Listar los nombres de todas aquellas materias que aún no han sido dictadas en la institución.
SELECT m.nom_mat
FROM Materias AS m
WHERE NOT EXISTS (SELECT c.materia FROM Cursadas AS c WHERE m.cod_mat = c.materia);

-- 4. Crear un store procedure que de alta un nuevo profesor y nos devuelva el ID como parámetro de salida.
DELIMITER //
CREATE PROCEDURE agregar_profesor_devolver_id (IN nyap_add VARCHAR(30), f_nac_add DATE, domicilio_add VARCHAR(40), cod_post_add INT, OUT legajo_prof INT)
BEGIN
	IF NOT EXISTS
		(SELECT p.leg_prof
         FROM Profesores AS p
         WHERE p.nyap = nyap_add AND p.f_nac = f_nac_add AND p.domicilio = domicilio_add AND p.cod_post = cod_post_add)
	THEN
		INSERT INTO Profesores (nyap, f_nac, domicilio, cod_post_add)
        VALUES (nyap_add, f_nac_add, domicilio_add, cod_post_add);
        SET legajo_prof = last_insert_id();
    ELSE
		SELECT("El profesor ya existe en el sistema");
        SET legajo_prof = (SELECT p.leg_prof
						   FROM Profesores AS p
						   WHERE p.nyap = nyap_add AND p.f_nac = f_nac_add AND p.domicilio = domicilio_add AND p.cod_post = cod_post_add);
	END IF;
END //
DELIMITER ;

CALL agregar_profesor_devolver_id ("Jack Antonoff", "1984-31-03", "Cornelia Street 1331", 98001, @id_jack);
SELECT(@id_jack);

-- 5. Mostrar las 3 materias que tienen mejor promedio en su historial y las 3 materias que tienen el peor promedio en su historial.
-- Como salida tienen que mostrar Nombre de materia y el promedio.
(SELECT m.nombre, AVG(c.nota_cursada)
FROM Materias AS m, Cursadas AS c
WHERE m.cod_materia = c.materia
GROUP BY m.nombre_mat
ORDER BY AVG(c.nota_cursada) DESC
LIMIT 3)
UNION ALL
(SELECT m.nombre, AVG(c.nota_cursada)
FROM Materias AS m, Cursadas AS c
WHERE m.cod_materia = c.materia
GROUP BY m.nombre_mat
ORDER BY AVG(c.nota_cursada) ASC
LIMIT 3)