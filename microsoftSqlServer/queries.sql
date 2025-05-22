USE fmendezdb;


-- 1. Paciente con sus médicos tratantes
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

SELECT s.nombre AS NombreSector, COUNT(h.id) AS HabitacionesOcupadas
FROM fmendezdb.dbo.Habitacion h 
INNER JOIN fmendezdb.dbo.Sector s ON s.id = h.idSector
INNER JOIN fmendezdb.dbo.Ingreso i ON i.idHabitacion = h.id
WHERE i.fechaAlta IS NULL
GROUP BY s.nombre;