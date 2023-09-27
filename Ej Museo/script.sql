/* Queremos tener un listado de todos las escuelas. */
SELECT * FROM escuelas;

/* Queremos conocer el nombre y apellido de nuestras guias. */
SELECT nombre, apellido FROM guia;

/* Obtener un listado de las visitas */
SELECT * FROM visitas;

/* Obtener un listado de la reserva cuyo código es igual a 2. */
SELECT * FROM reserva WHERE codigo = 2;

/* ¿Existen reservas para este mes? */
SELECT COUNT(*) FROM reserva WHERE mes = 9 AND anio = 2023;

/* Mostrar las escuelas cuyo código es mayor a 3 */
SELECT * FROM escuela WHERE codigo > 3;

/* Mostrar las escuelas cuyo código es igual a 4 */
SELECT * FROM escuela WHERE codigo = 4;

/* Mostrar las escuelas cuyo código está entre 2 y 4 */
SELECT * FROM escuela WHERE codigo >= 2 AND codigo <= 4;

/* Mostrar las escuelas cuyo nombre comienza con E */
SELECT * FROM escuela WHERE nombre LIKE 'E%';

/* Mostrar las escuelas cuyo nombre contenga la ‘a’ o su domicilio comienza con ‘S’ */
SELECT * FROM escuela WHERE domicilio LIKE 'S%' OR nombre LIKE '%a%';

/* Mostrar las escuelas cuyo código es igual a 2 o su nombre termina con S */
SELECT * FROM escuela WHERE codigo = 2 OR nombre LIKE '%S';

/* Mostrar las escuelas cuyo codigo es mayor a 1 y su localidad sea igual a 7600 */
SELECT * FROM escuela WHERE codigo > 1 AND localidad = 7600;