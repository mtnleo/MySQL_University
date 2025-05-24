USE fmendezdb;


-- 1. Paciente con sus médicos tratantes
-- Perdon por las 700 subqueries
CREATE OR ALTER VIEW V_PacientesPorMedicos
AS
SELECT p.nombre AS NombrePaciente, p.apellido AS ApellidoPaciente, m.nombre AS NombreMedico, m.apellido AS ApellidoMedico, m.especialidad AS Especialidad
FROM (SELECT emp.id AS idMedico, p.nombre, p.apellido, esp.nombre AS especialidad
	  FROM  fmendezdb.dbo.Persona AS p
	  INNER JOIN fmendezdb.dbo.Empleado AS emp ON p.id = emp.idPersona
	  INNER JOIN fmendezdb.dbo.MedicoEspecialidad AS medEsp ON emp.id = medEsp.idMedico
	  INNER JOIN fmendezdb.dbo.Especialidad AS esp ON medEsp.idEspecialidad = esp.id
	  ) AS m
JOIN fmendezdb.dbo.Consulta AS con ON con.idMedico = m.idMedico
JOIN (
		SELECT pac.id AS idPaciente, per.nombre, per.apellido
		FROM fmendezdb.dbo.Persona per
		INNER JOIN fmendezdb.dbo.Paciente pac ON per.id = pac.idPersona
		) AS p ON con.idPaciente = p.idPaciente;

/* 
	2.  Internaciones actuales
Salida:
Nombre completo del paciente
Fecha de ingreso
Nombre de la habitación
Nombre del sector */

CREATE OR ALTER VIEW V_InternacionesActuales
AS
SELECT p.nombre AS Nombre, p.apellido AS Apellido, i.fechaIngreso AS FechaIngreso, h.numero AS NumeroHabitacion, s.nombre AS Sector
FROM fmendezdb.dbo.Persona AS p
INNER JOIN fmendezdb.dbo.Paciente pac ON p.id = pac.idPersona
INNER JOIN fmendezdb.dbo.Ingreso i ON i.idPaciente = pac.id
INNER JOIN fmendezdb.dbo.Habitacion h ON i.idHabitacion = h.id
INNER JOIN fmendezdb.dbo.Sector s ON h.idSector = s.id;

/* 3. Resumen de consultas médicas por especialidad
Salida:
Nombre de la especialidad
Cantidad de consultas */

CREATE OR ALTER VIEW V_ConsultasPorEspecialidad
AS
SELECT e.nombre, COUNT(c.id) AS NumeroConsultas
FROM fmendezdb.dbo.Consulta AS c
LEFT JOIN fmendezdb.dbo.Especialidad AS e ON e.id = c.idEspecialidad
GROUP BY e.nombre;

/* 
	4. Médicos con cantidad de pacientes atendidos
Salida:
Nombre completo del médico
Cantidad de pacientes atendidos
 */
 
CREATE OR ALTER VIEW V_MedicosPorPacientesAtendidos
AS
SELECT p.nombre AS Nombre, p.apellido AS Apellido, COUNT(pac.id) AS PacientesAtendidos
FROM fmendezdb.dbo.Persona p 
JOIN fmendezdb.dbo.Empleado emp ON p.id = emp.idPersona
INNER JOIN fmendezdb.dbo.MedicoEspecialidad me ON me.idMedico = emp.id
INNER JOIN fmendezdb.dbo.Paciente pac ON p.id = pac.idPersona
INNER JOIN fmendezdb.dbo.Consulta c ON (pac.id = c.idPaciente AND me.idMedico = c.idMedico)
GROUP BY p.nombre, p.apellido;

SELECT fmendezdb.dbo.V_MedicosPacientesAtendidos;


/* 5. Habitaciones ocupadas por sector
Salida:
Nombre del sector
Cantidad de habitaciones ocupadas
 */

CREATE OR ALTER VIEW V_HabitacionesOcupadasPorSector
AS
SELECT s.nombre AS NombreSector, COUNT(h.id) AS HabitacionesOcupadas
FROM fmendezdb.dbo.Habitacion h 
INNER JOIN fmendezdb.dbo.Sector s ON s.id = h.idSector
INNER JOIN fmendezdb.dbo.Ingreso i ON i.idHabitacion = h.id
WHERE i.fechaAlta IS NULL
GROUP BY s.nombre;

/* 6. Pacientes con más de un ingreso
Salida:
ID del paciente
Nombre
Apellido
Cantidad de ingresos
 */
CREATE OR ALTER VIEW V_PacientesPorIngreso
AS
SELECT pac.id AS ID, p.nombre AS Nombre, p.apellido AS Apellido, COUNT(i.id) AS CantidadIngresos
FROM fmendezdb.dbo.Persona p 
INNER JOIN fmendezdb.dbo.Paciente pac ON pac.idPersona = p.id
LEFT JOIN fmendezdb.dbo.Ingreso i ON i.idPaciente = pac.id
GROUP BY pac.id, p.nombre, p.apellido;

/* 7. Ingresos con alta posterior a 10 días
Salida:
Todos los campos del ingreso
Días de internación

 */

CREATE OR ALTER VIEW V_IngresosMayoresDiezDias
AS
SELECT i.*, DATEDIFF(day, i.fechaIngreso, i.fechaAlta) AS DiasIngresado
FROM fmendezdb.dbo.Ingreso AS i
WHERE DATEDIFF(day, i.fechaIngreso, i.fechaAlta) >= 10;

/* 8. Médicos sin ingresos
Salida:
Todos los campos del médico
Cantidad de ingresos (debe ser 0)
 */
CREATE OR ALTER VIEW V_MedicosSinIngresos
AS
SELECT e.id, e.idPersona, e.idCargo, e.idTipoEmpleado, e.idDependencia, e.idUsuario, COUNT(i.id) AS CantidadIngresos
FROM fmendezdb.dbo.Empleado e
INNER JOIN fmendezdb.dbo.MedicoEspecialidad me ON e.id = me.idMedico
LEFT JOIN fmendezdb.dbo.Ingreso i ON i.idMedicoTratante = e.id
GROUP BY e.id, e.idPersona, e.idCargo, e.idTipoEmpleado, e.idDependencia, e.idUsuario
HAVING  COUNT(i.id) = 0;

/* 9. Habitaciones desocupadas
Salida:
Todos los campos de la habitación 
Cantidad de ingresos activos (debe ser 0) */

CREATE OR ALTER VIEW HabitacionesDesocupadas
AS

SELECT  h.id, h.numero, h.idSector, h.descripcion, h.capacidad, COUNT(i.idHabitacion) AS CantidadIngresosActivos
FROM fmendezdb.dbo.Ingreso i
JOIN fmendezdb.dbo.Habitacion h ON i.idHabitacion = h.id
GROUP BY h.id, h.numero, h.idSector, h.descripcion, h.capacidad
HAVING COUNT(i.idHabitacion) = 0

