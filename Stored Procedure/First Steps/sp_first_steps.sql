USE cervezas;

DELIMITER //
CREATE PROCEDURE imprimir_numeros_1_a_n(IN n INT)
BEGIN
DECLARE i INT DEFAULT 1;
WHILE i <= n DO
SELECT i;
SET i = i + 1;
END WHILE;
END//
DELIMITER ;

CALL imprimir_numeros_1_a_n(9);

/* INSERTAR CERVEZA STORED PROCEDURE */
DELIMITER //
CREATE PROCEDURE agregar_nueva_cerveza(nombre_cerveza VARCHAR(30), graduacion_alcoholica float)
COMMENT "Agregar una cerveza a la tabla"
BEGIN
IF NOT EXISTS
	(SELECT c.nombreCerveza, c.GradoAlcohol
	FROM Cervezas AS c
	WHERE c.NombreCerveza LIKE nombre_cerveza AND c.GradoAlcohol = graduacion_alcoholica)
THEN
	INSERT INTO Cervezas (NombreCerveza, GradoAlcohol)
	VALUES (nombre_cerveza, graduacion_alcoholica);
ELSE
	SELECT ("Esta cerveza ya existe");
END IF;
END//
DELIMITER ;

-- DROP PROCEDURE IF EXISTS agregar_nueva_cerveza;
-- SHOW CREATE PROCEDURE agregar_nueva_cerveza;

CALL agregar_nueva_cerveza("Stout", 7.0); -- Esta sí existe
CALL agregar_nueva_cerveza("Danish", 3.7); -- Esta no existe

-- Mostrar cervezas cargadas

SELECT c.* 
FROM Cervezas AS c;