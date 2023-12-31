CREATE DATABASE cervezas;
USE cervezas;

CREATE TABLE Cervezas (
IdCerveza INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NombreCerveza VARCHAR(30) NOT NULL,
GradoAlcohol smallint NOT NULL);

Alter table Cervezas modify column GradoAlcohol float;

CREATE TABLE Recetas (
IdReceta INT NOT NULL auto_increment PRIMARY KEY,
IdCerveza INT NOT NULL,
NombreReceta VARCHAR(30) NOT NULL,
CONSTRAINT FK_IdCerveza FOREIGN KEY (IdCerveza) references Cervezas(IdCerveza));

CREATE TABLE Ingredientes (
IdIngrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NombreIngrediente VARCHAR(30) NOT NULL);

CREATE TABLE IngredienteXRecetas (
IdIngredienteReceta INT NOT NULL auto_increment PRIMARY KEY,
IdReceta INT NOT NULL,
IdIngrediente INT NOT NULL,
CONSTRAINT FK_Receta FOREIGN KEY (IdReceta) references Recetas(IdReceta),
CONSTRAINT FK_IdIngrediente FOREIGN KEY (IdIngrediente) references Ingredientes(IdIngrediente));

INSERT INTO `Cervezas` ( `NombreCerveza`, `GradoAlcohol` ) VALUES
('Altbier', 4.7),
('Ahumada', 4.8),
('American Pale Ale', 6.0),
('Barley Wine', 8.5 ),
('Bock', 7.2), 
('Brown', 2.8), 
('English Pale Ale', 3.2),
('Irish Red', 6.5),
('Klosch', 5.1),
('Miel', 2.1), 
('Porter', 5.4),
('Scotch', 3.9),
('Stout', 7.0); 
#carga de datos de Tabla Cervezas
#consulta de datos de Cervezas

INSERT INTO `Ingredientes` ( `NombreIngrediente`) VALUES
('Agua'),
('Levadura'),
('Malta'), 
('Lúpulo'), 
('Vino'),
('Irish Red'),
('Whisky'),
('Cereales'), 
('Zumo de fruta'), 
('Jarabe'), 
('Frambuesa'), 
('Cereza'), 
('Lúpulos amargos'),
('Lúpulos aromáticos'),
('Lúpulos mixtos'); 

INSERT INTO `Recetas` ( IdCerveza, `NombreReceta`) VALUES
(1,'Receta 1'),
(1,'Receta 2'),
(2,'Receta 3'),
(3,'Receta 4'),
(4,'Receta 5'),
(5,'Receta 5'),
(6,'Receta 5'),
(6,'Receta 6'),
(7,'Receta 8'),
(8,'Receta 9'),
(9,'Receta 10'),
(12,'Receta 10'),
(13,'Receta 10');

INSERT INTO `IngredienteXRecetas` ( IdReceta, IdIngrediente) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(7, 1),
(8, 1),
(9, 1),
(13, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 2),
(5, 2),
(7, 4),
(8, 5),
(9, 2),
(13, 2),
(1, 4),
(1, 3),
(1, 5),
(1, 6),
(1, 7),
(13, 1),
(11, 1),
(12, 1),
(10, 1);


-- 1. Mostrar la información de todas las cervezas junto con el respectivo nombre de su receta segun corresponda.

SELECT c.nombreCerveza, r.nombreReceta AS Nombre_Receta
FROM Cervezas AS c
JOIN Recetas AS r ON r.IdCerveza = c.IdCerveza;

-- 2. Listar 3 de las recetas que contengan mas de 5 ingredientes

SELECT r.nombreReceta, COUNT(i_x_r.idIngrediente) AS Ingredientes
FROM Recetas AS r
JOIN IngredienteXRecetas AS i_x_r ON i_x_r.IdReceta = r.IdReceta
GROUP BY r.nombreReceta
HAVING COUNT(i_x_r.idIngrediente) > 5
LIMIT 3;

-- 3. ordenar los ingredientes de cada receta junto con el nombre de cada ingrediente de forma descendente.

SELECT i.IdIngrediente, i.nombreIngrediente
FROM Ingredientes AS i
ORDER BY i.IdIngrediente DESC;

-- 4. Consultar el Promedio de ingredientes de todas las recetas.

SELECT r.nombreReceta, AVG(i_x_r.IdIngrediente) AS PromedioIngredientes
FROM Recetas AS r
JOIN IngredienteXRecetas AS i_x_r ON i_x_r.IdReceta = r.IdReceta
JOIN Ingredientes AS i ON i.IdIngrediente = i_x_r.IdIngrediente
GROUP BY r.nombreReceta;

-- 5. Listar toda la informacion de cada una de las recetas y toda la informacion de los ingredientes.

SELECT r.*, i.*
FROM Recetas AS r
JOIN IngredienteXRecetas AS i_x_r ON i_x_r.IdReceta = r.IdReceta
JOIN Ingredientes AS i ON i.IdIngrediente = i_x_r.IdIngrediente;

-- 6. Listar las cervezas que se encuentren entre la letras C y P, junto al nombre de su receta.

SELECT c.*, r.nombreReceta
FROM Cervezas AS c
JOIN Recetas AS r ON r.IdCerveza = c.IdCerveza
WHERE c.NombreCerveza BETWEEN ("C%") AND ("P%");

-- 7. Listar la Receta que mas ingredientes contenga.

SELECT r.NombreReceta, COUNT(i_x_r.IdIngrediente) AS Cant_Ingredientes
FROM Recetas AS r
JOIN IngredienteXRecetas AS i_x_r ON i_x_r.IdReceta = r.IdReceta
GROUP BY r.NombreReceta
LIMIT 1;

-- 8. Listar los 2 ingredientes que menos se utilizan (en menos recetas se encuentre).

SELECT r.NombreReceta, COUNT(i_x_r.IdIngrediente) AS Cant_Ingredientes
FROM Recetas AS r
JOIN IngredienteXRecetas AS i_x_r ON i_x_r.IdReceta = r.IdReceta
GROUP BY r.NombreReceta
ORDER BY COUNT(i_x_r.IdIngrediente) ASC
LIMIT 2;

-- 9. Listar todos los Ingredientes que en Stock tengan mas de 120xx.

-- 10. Listar los Ingredientes que NO se utilicen en ninguna de las Recetas

SELECT r.NombreReceta, COUNT(i_x_r.IdIngrediente) AS Cant_Ingredientes
FROM Recetas AS r
JOIN IngredienteXRecetas AS i_x_r ON i_x_r.IdReceta = r.IdReceta
GROUP BY r.NombreReceta
HAVING COUNT(i_x_r.IdIngrediente) = 0;

-- ------------------------------------------------------------
-- SUBQUERIES -------------------------------------------------
-- ------------------------------------------------------------

-- 1. Mostrar el nombre del ingrediente del que mas cantidad haya.
/*
SELECT i.NombreIngrediente, COUNT(ixr.IdIngredienteReceta)
FROM ingredientes AS i
JOIN IngredienteXRecetas AS ixr ON ixr.IdIngrediente = i.IdIngrediente
GROUP BY i.NombreIngrediente
ORDER BY COUNT(ixr.IdIngredienteReceta) DESC
LIMIT 1;
*/
SELECT i.NombreIngrediente
FROM Ingredientes AS i
WHERE i.id_ingrediente = (SELECT MAX(i_x_r.IdIngrediente) FROM IngredienteXRecetas AS i_x_r);

-- 2. Mostrar las Recetas que contengan un numero igual o menor al promedio total.
SELECT r.*, AVG(i_x_r.IdIngrediente) PROMEDIO_ING
FROM recetas AS r
JOIN IngredienteXRecetas AS i_x_r ON i_x_r.IdReceta = r.IdReceta
GROUP BY r.IdReceta
HAVING AVG(i_x_r.IdIngrediente) <= (SELECT AVG(i_x_r.IdIngrediente) FROM IngredienteXRecetas AS i_x_r);

-- 3. Mostrar las Recetas que contengan en si, los primeros 3 ingredientes.
SELECT r.*
FROM Recetas AS r, (SELECT IdIngrediente FROM Ingredientes LIMIT 3) AS primeros_tres_ingredientes
JOIN  IngredienteXRecetas AS i_x_r ON r.IdReceta = i_x_r.IdReceta
WHERE i_x_r.IdIngrediente IN (primeros_tres_ingredientes);

-- 4. Listar las Cervezas que en su Receta contengan la mayor cantidad de Ingredientes.
SELECT c.NombreCerveza
FROM Cervezas AS c, Recetas AS r
WHERE c.IdCerveza = r.IdCerveza AND
	(SELECT COUNT(*) -- Cuenta los ingredientes
     FROM IngredienteXRecetas AS ir
     WHERE r.IdReceta = ir.IdReceta) = ( -- Compara si son iguales con los maximos
     SELECT MAX(ingreds_receta)
     FROM (SELECT COUNT(*) AS ingreds_receta
		   FROM Recetas AS r
           JOIN IngredienteXRecetas AS ir ON r.IdReceta = ir.IdReceta
			GROUP BY r.IdReceta
	) AS max_ingr_receta);


-- 5. Mostrar las Receta con el ID 3, junto con la cantidad de Ingredientes que posee y en otra columna el promedio de ingredientes General.
SELECT r.IdReceta, (SELECT COUNT(*) FROM IngredienteXRecetas AS ir JOIN Recetas AS r ON r.IdReceta = ir.IdReceta) AS Cant_ingredientes, (SELECT AVG(ingredientes_receta) FROM (SELECT COUNT(*) AS ingreds_receta
		   FROM Recetas AS r
           JOIN IngredienteXRecetas AS ir ON r.IdReceta = ir.IdReceta
			GROUP BY r.IdReceta))
FROM Recetas AS r;

-- Obtener promedio de ingredientes general
SELECT AVG(cant_ingredientes) AS Promedio_Ing
FROM (SELECT COUNT(*) AS cant_ingredientes
	  FROM Recetas AS r
      JOIN IngredienteXRecetas AS ir
      ON ir.IdReceta = r.IdReceta
      GROUP BY ir.IdReceta) AS recetas_con_ingredientes;
-- Obtener cant de ingredientes de las recetas
SELECT r.IdReceta, COUNT(*) AS Cant_Ingredientes
FROM Recetas AS r
JOIN IngredienteXRecetas AS ir ON r.IdReceta = ir.IdReceta   
GROUP BY r.IdReceta;
      
-- Toda la query con subqueries
SELECT 
	r.IdReceta, r.NombreReceta,
	Cant_Ingredientes.cantidad_ingredientes,
    Promedio_Ing.prom_ing
    
FROM
	Recetas AS r, 
    
	(SELECT AVG(cant_ingredientes) AS prom_ing
	 FROM (SELECT COUNT(*) AS cant_ingredientes
	 FROM Recetas AS r
	 JOIN IngredienteXRecetas AS ir
	 ON ir.IdReceta = r.IdReceta
	 GROUP BY ir.IdReceta) AS recetas_con_ingredientes) AS Promedio_Ing,
     
     (SELECT COUNT(*) AS cantidad_ingredientes
	 FROM Recetas AS r
	 JOIN IngredienteXRecetas AS ir ON r.IdReceta = ir.IdReceta   
	 GROUP BY r.IdReceta) AS Cant_Ingredientes

WHERE 
	r.IdReceta = 3;


-- 6. Mostrar las Recetas que superen el Promedio de ingredientes general (Simular Having).
SELECT DISTINCT r.IdReceta, cantidad_ingredientes.cant_ingredientes, Promedio_Ing.prom_ing 
FROM Recetas AS r, (SELECT AVG(cant_ingredientes) AS prom_ing
	 FROM (SELECT COUNT(*) AS cant_ingredientes
	 FROM Recetas AS r
	 JOIN IngredienteXRecetas AS ir
	 ON ir.IdReceta = r.IdReceta
	 GROUP BY ir.IdReceta) AS recetas_con_ingredientes) AS Promedio_Ing,
     (SELECT COUNT(*) AS cant_ingredientes
	 FROM Recetas AS r
	 JOIN IngredienteXRecetas AS ir
	 ON ir.IdReceta = r.IdReceta
	 GROUP BY ir.IdReceta) AS cantidad_ingredientes
WHERE 
	(SELECT COUNT(*) AS cant_ingredientes
	 FROM IngredienteXRecetas AS ir
	 WHERE ir.IdReceta = r.IdReceta) >
     (SELECT AVG(cant_ingredientes) AS prom_ing
	 FROM (SELECT COUNT(*) AS cant_ingredientes
	 FROM Recetas AS r
	 JOIN IngredienteXRecetas AS ir
	 ON ir.IdReceta = r.IdReceta
	 GROUP BY ir.IdReceta) AS recetas_con_ingredientes);
     
select r.IdReceta, r.NombreReceta, cantidades.cant
from recetas r
join (select ir.IdReceta, count(*) as cant
		from  ingredientexrecetas ir
        group by ir.IdReceta
) cantidades
on r.IdReceta = cantidades.IdReceta
where cantidades.cant > (Select avg(CantidadIngrediente)
from (Select  count(*) CantidadIngrediente
from ingredientexrecetas
group by IdReceta) promedio);



SELECT r.IdReceta, r.NombreReceta, cantidades.cant
FROM Recetas AS r
JOIN (SELECT ir.IdReceta, COUNT(*) AS cant
	  FROM IngredienteXRecetas AS ir
      GROUP BY ir.IdReceta) as cantidades
      ON cantidades.IdReceta = r.IdReceta
WHERE
	cantidades.cant > (Select avg(CantidadIngrediente)
from (Select  count(*) CantidadIngrediente
from ingredientexrecetas
group by IdReceta) promedio);