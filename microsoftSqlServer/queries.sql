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

/* 2.  Internaciones actuales
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

