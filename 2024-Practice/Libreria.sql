CREATE DATABASE Libreria;
USE Libreria;
/* INSERT DEL CAMPUS */
CREATE TABLE CLIENTES (
	CLI_ID		INTEGER NOT NULL PRIMARY KEY,
	NOMBRES		VARCHAR(100) NOT NULL,
	APELLIDO	VARCHAR(100) NOT NULL,
	DIRECCION	VARCHAR(300) DEFAULT 'Olavarría 2464',
	EMAIL		VARCHAR(100) DEFAULT 'datoEjemplo@libreria.com'
);

CREATE TABLE LIBROS (
	LIBRO_ID	INTEGER NOT NULL PRIMARY KEY,
	TITULO		VARCHAR(300) NOT NULL,
	COSTO		DECIMAL (7,2),
	IMAGEN		BLOB
);

CREATE TABLE VENTAS (
	VENTA_ID	INTEGER unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	LIBRO_ID	INTEGER NOT NULL,
	CLI_ID		INTEGER NOT NULL,
	CANTIDAD	INTEGER NOT NULL,
	PRECIO		DECIMAL(7,2) NOT NULL,
	FECHA_COMPRA	TIMESTAMP,
	CONSTRAINT FK1	FOREIGN KEY (LIBRO_ID) REFERENCES LIBROS(LIBRO_ID),
	CONSTRAINT FK2	FOREIGN KEY (CLI_ID) REFERENCES CLIENTES(CLI_ID)
);


INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (00001,'MICHAEL','THOMPSON');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (00002,'SALLY','KWAN');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (00003,'JOHN','GEYER');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (00004,'IRVING','STERN');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (00005,'EVA','PULASKI');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (00006,'EILEEN','HENDERSON');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (00007,'THEODORE','SPENSER');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (00008,'VINCENZO','LUCCHESSI');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (00009,'SEAN','O''CONNELL');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000010,'DOLORES','QUINTANA');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000011,'HEATHER','NICHOLLS');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000012,'BRUCE','ADAMSON');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000013,'ELIZABETH','PIANKA');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000014,'MASATOSHI','YOSHIMURA');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000015,'MARILYN','SCOUTTEN');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000016,'JAMES','WALKER');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000017,'DAVID','BROWN');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000018,'WILLIAM','JONES');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000019,'JENNIFER','LUTZ');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000020,'JAMES','JEFFERSON');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000021,'SALVATORE','MARINO');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000022,'DANIEL','SMITH');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000023,'SYBIL','JOHNSON');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000024,'MARIA','PEREZ');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000025,'ETHEL','SCHNEIDER');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000026,'JOHN','PARKER');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000027,'PHILIP','SMITH');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000028,'MAUDE','SETRIGHT');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000029,'RAMLAL','MEHTA');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000030,'WING','LEE');
INSERT INTO CLIENTES (CLI_ID, NOMBRES, APELLIDO) VALUES (000031,'CHRISTINE','HAAS');
COMMIT;


INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80001, 'BOOK1_TITULO', 10.99);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80002, 'BOOK2_TITULO', 13.00);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80003, 'BOOK3_TITULO', 8.99);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80004, 'BOOK4_TITULO', 30.92);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80005, 'BOOK5_TITULO', 33.56);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80006, 'BOOK6_TITULO', 82.12);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80007, 'BOOK7_TITULO', 35.43);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80008, 'BOOK8_TITULO', 103.11);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80009, 'BOOK9_TITULO', 2.00);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80010, 'BOOK10_TITULO', 78.31);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80011, 'BOOK11_TITULO', 19.78);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80012, 'BOOK12_TITULO', 98.21);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80013, 'BOOK13_TITULO', 67.43);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80014, 'BOOK14_TITULO', 34.59);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80015, 'BOOK15_TITULO', 9.23);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80016, 'BOOK16_TITULO', 10.00);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80017, 'BOOK17_TITULO', 15.00);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80018, 'BOOK18_TITULO', 5.65);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80019, 'BOOK19_TITULO', 8.90);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80020, 'BOOK20_TITULO', 23.00);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80021, 'BOOK21_TITULO', 82.99);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80022, 'BOOK22_TITULO', 29.75);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80023, 'BOOK23_TITULO', 73.12);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80024, 'BOOK24_TITULO', 2.99);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80025, 'BOOK25_TITULO', 29.22);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80026, 'BOOK26_TITULO', 43.21);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80027, 'BOOK27_TITULO', 55.23);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80028, 'BOOK28_TITULO', 98.33);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80029, 'BOOK29_TITULO', 32.19);
INSERT INTO LIBROS (LIBRO_ID, TITULO, COSTO) VALUES (80030, 'BOOK30_TITULO', 55.63);
COMMIT;


INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80024, 00001, 1, 4.82, TIMESTAMP('2004-03-30-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80030, 00009, 2, 44.21, TIMESTAMP('2004-03-30-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80001, 000030, 1, 83.42, TIMESTAMP('2004-03-30-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80018, 00002, 1, 44.12, TIMESTAMP('2004-03-30-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80022, 00002, 1, 71.23, TIMESTAMP('2004-03-31-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80006, 000019, 2, 8.43, TIMESTAMP('2004-03-31-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80028, 000021, 1, 19.83, TIMESTAMP('2004-03-31-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80003, 000028, 1, 53.87, TIMESTAMP('2004-03-31-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80026, 000027, 1, 92.41, TIMESTAMP('2004-03-29-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80002, 00008, 1, 81.23, TIMESTAMP('2004-03-29-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80011, 00003, 1, 39.51, TIMESTAMP('2004-03-29-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80009, 000015, 1, 90.32, TIMESTAMP('2004-03-29-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80022, 000013, 1, 19.32, TIMESTAMP('2004-03-29-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80019, 000011, 1, 56.98, TIMESTAMP('2004-03-29-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80026, 000010, 1, 4.98, TIMESTAMP('2004-03-29-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80011, 000018, 1, 9.98, TIMESTAMP('2004-03-28-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80005, 00007, 1, 20.43, TIMESTAMP('2004-03-28-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80009, 00009, 1, 95.32, TIMESTAMP('2004-03-28-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80013, 000027, 1, 41.21, TIMESTAMP('2004-03-27-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80001, 000025, 3, 81.90, TIMESTAMP('2004-03-27-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80022, 000024, 1, 20.99, TIMESTAMP('2004-03-27-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80018, 00001, 1, 76.32, TIMESTAMP('2004-03-27-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80029, 00001, 1, 97.32, TIMESTAMP('2004-03-27-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80014, 000022, 1, 82.41, TIMESTAMP('2004-03-26-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80025, 000018, 2, 67.37, TIMESTAMP('2004-03-26-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80007, 000025, 1, 41.21, TIMESTAMP('2004-03-26-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80030, 00004, 1, 8.98, TIMESTAMP('2004-03-25-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80001, 00001, 1, 9.99, TIMESTAMP('2004-03-25-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80002, 000030, 4, 10.00, TIMESTAMP('2004-03-25-00.00.00.000000'));
INSERT INTO VENTAS (LIBRO_ID, CLI_ID, CANTIDAD, PRECIO, FECHA_COMPRA) VALUES (80024, 00001, 1, 4.82, TIMESTAMP('2004-03-08-00.00.00.000000'));

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+				                    					                 			  +
+				                    					                 			  +
+				                    SUBQUERIES		    							  +
+				                    					                 			  +
+				                    					                 			  +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

-- 1. Listar todos los datos de los clientes que han comprado el producto con mayor precio de la tabla Ventas.
SELECT *
FROM clientes c
INNER JOIN ventas v
ON v.cli_id = c.cli_id
WHERE v.precio = (SELECT MAX(precio) FROM ventas);

-- resolucion
SELECT c.*, v.*
FROM Clientes AS c, Ventas AS v
WHERE c.cli_id = v.cli_id AND v.precio = (SELECT MAX(v.precio) FROM Ventas AS v);
-- 2. Listar todos clientes que no existen en la tabla Ventas.
SELECT * 
FROM clientes c
WHERE c.cli_id NOT IN (SELECT v.cli_id FROM ventas v);

SELECT c.*
FROM Clientes AS c
WHERE c.cli_id NOT IN (SELECT cl.cli_id FROM Clientes AS cl, Ventas AS v WHERE cl.cli_id = v.cli_id)
ORDER BY c.cli_id;
-- 3. Obtener los nombres de los clientes que han realizado compras.
SELECT c.nombres, c.apellido
FROM clientes c
WHERE c.cli_id IN (SELECT v.cli_id FROM ventas v);

-- 4. Encontrar el título de los libros vendidos y su precio de compra para una venta específica.
-- Lo voy a tomar por el ID


-- 5. Obtener el nombre del cliente que realizó la primera compra.
SELECT c.*, v.fecha_compra
FROM ventas v
INNER JOIN clientes c
ON v.cli_id = c.cli_id
WHERE v.fecha_compra = (SELECT MIN(vv.fecha_compra) FROM ventas vv);


-- 6. Encontrar la cantidad total de libros comprados por un cliente específico.
-- Lo voy a tomar por el ID
SELECT v.cli_id, SUM(v.cantidad) AS libros_comprados
FROM ventas v
WHERE v.cli_id = 1;
-- 7. Obtener los libros con un costo mayor al costo promedio de todos los libros.
SELECT l.* 
FROM libros l
WHERE l.costo > (SELECT AVG(lib.costo) FROM libros lib);

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+				                    					                 			  +
+				                    					                 			  +
+ --------------------------  STORED PROCEDURES	 ------------------------------------ +
+				                    					                 			  +
+				                    					                 			  +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

-- a. Que inserte información en la tabla Clientes. Ayuda (recibe parámetros de entrada).




-- b. Que actualice el nombre de un Cliente. Ayuda (recibe dos parámetros, número de cliente de quien se va a actualizar y el nuevo nombre).







-- c. Que elimine un Cliente. Ayuda (recibe un parámetro, número de cliente de quien se va a eliminar).




-- d.	Crear un procedimiento almacenado que registre una nueva venta. Crea un procedimiento almacenado llamado RegistrarVenta
-- que reciba los siguientes parámetros de entrada: CLI_ID (identificador del cliente que realiza la compra), LIBRO_ID (identificador del libro vendido),
-- CANTIDAD (cantidad de libros vendidos) y PRECIO_UNITARIO (precio unitario de cada libro). El procedimiento debe
-- insertar un nuevo registro en la tabla VENTAS con la información proporcionada. Además, si la cantidad vendida es mayor a 5, aplicará un descuento del 10% al precio total de la venta.





-- e.	Crea un procedimiento almacenado llamado ActualizarDireccionCliente que reciba dos parámetros de entrada: CLI_ID (identificador del cliente cuya dirección se actualizará)
-- y NUEVA_DIRECCION (la nueva dirección que se asignará al cliente). El procedimiento debe actualizar la dirección del cliente en la tabla CLIENTES.



-- f.	Crea un procedimiento almacenado llamado EliminarClienteYVentas que reciba un parámetro de entrada: CLI_ID (identificador del cliente que se eliminará).
-- El procedimiento debe eliminar al cliente de la tabla CLIENTES y todas sus ventas asociadas en la tabla VENTAS.



-- g. Crear un sp InsertarClientesDePrueba que inserte una cantidad especificada de clientes de prueba en la tabla CLIENTES. La cantidad se pasará como parámetro.




-- h. Crear el sp RealizarCompraDePrueba el cual reciba los parámetros necesarios (4 en total), para simular una compra y a partir de ellos, registrar la venta en la tabla VENTAS.