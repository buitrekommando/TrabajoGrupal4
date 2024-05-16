--HABITACION

INSERT INTO "Habitacion" (habitacion_id, numero)
VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107),
(8, 108),
(9, 109),
(10, 110);

--CAMAS
INSERT INTO "Cama" (cama_id, fk_habitacion_id)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);



--COMUNAS
INSERT INTO "Comuna" (nombre_comuna)
VALUES
('Santiago'),
('Providencia'),
('Las Condes'),
('La Reina'),
('Ñuñoa'),
('Macul'),
('Peñalolén'),
('La Florida'),
('Maipú'),
('Pudahuel');


--DIAGNOSTICO
INSERT INTO "Diagnostico" (fecha, descripcion)
VALUES
('2024-04-01', 'Gripe común'),
('2024-03-15', 'Hipertensión leve'),
('2024-04-05', 'Diabetes tipo 2'),
('2024-02-01', 'Asma crónica'),
('2024-03-20', 'Artritis reumatoide'),
('2024-04-10', 'Depresión mayor'),
('2024-03-01', 'Cáncer de mama'),
('2024-04-15', 'Insomnio crónico'),
('2024-02-15', 'Migraña recurrente'),
('2024-04-20', 'Anemia ferropénica');




--ESPECIALIDAD
INSERT INTO "Especialidad" (nombre_especialidad)
VALUES
('Cardiología'),
('Dermatología'),
('Gastroenterología'),
('Neurología'),
('Oftalmología'),
('Pediatría'),
('Psiquiatría'),
('Traumatología'),
('Urología'),
('Endocrinología');


--EXAMEN
INSERT INTO "Examen" (fecha, resultados, fk_paciente_id)
VALUES
( '2024-04-01', 'Presencia de virus de la gripe', 87),
( '2024-03-15', 'Niveles elevados de presión arterial', 88),
( '2024-04-05', 'Glucemia alta indicando diabetes tipo 2', 89),
( '2024-02-01', 'Espasmos bronquiales consistentes con asma', 90),
( '2024-03-20', 'Inflamación articular detectada en artritis', 91),
( '2024-04-10', 'Síntomas clínicos de depresión mayor', 92),
( '2024-03-01', 'Marcadores tumorales positivos para cáncer', 93),
( '2024-04-15', 'Patrones de sueño irregulares indicativos de insomnio', 94),
( '2024-02-15', 'Electroencefalograma que muestra actividad de migraña', 95),
( '2024-04-20', 'Bajo conteo de hemoglobina, sugiere anemia',96);







--INSERTAR 10 medicos

INSERT INTO "Medico" (
  primer_nombre, apellido_paterno, apellido_materno, segundo_nombre, rut, sexo, fecha_nacimiento, telefono, mail, fk_especialidad_id
) VALUES
('Juan', 'Pérez', 'González', 'Carlos', 12345678, TRUE, '1980-06-15', 987654321, 'juan.perez@mail.com', 1),
('María', 'Sánchez', 'López', 'Isabel', 23456789, FALSE, '1992-03-22', 123456789, 'maria.sanchez@mail.com', 2),
('Pedro', 'García', 'Martínez', 'Andrés', 34567890, TRUE, '1975-11-30', 987654321, 'pedro.garcia@mail.com', 3),
('Ana', 'Rodríguez', 'Fernández', 'María', 45678901, FALSE, '1985-07-20', 123456789, 'ana.rodriguez@mail.com', 1),
('Luis', 'Morales', 'Silva', 'Alberto', 56789012, TRUE, '1990-09-10', 987654321, 'luis.morales@mail.com', 2),
('Carmen', 'Vargas', 'Díaz', 'Teresa', 67890123, FALSE, '1988-12-05', 123456789, 'carmen.vargas@mail.com', 3),
('Roberto', 'López', 'Muñoz', 'José', 78901234, TRUE, '1972-05-18', 987654321, 'roberto.lopez@mail.com', 1),
('Daniela', 'Martínez', 'Ruiz', 'Francisca', 89012345, FALSE, '1995-01-25', 123456789, 'daniela.martinez@mail.com', 2),
('Carlos', 'Navarro', 'Quintana', 'Antonio', 90123456, TRUE, '1983-08-30', 987654321, 'carlos.navarro@mail.com', 3),
('Sofía', 'Castillo', 'Bravo', 'Elena', 10234567, FALSE, '1997-04-14', 123456789, 'sofia.castillo@mail.com', 1);


--PREVISION

INSERT INTO "Prevision" (nombre_prevision)
VALUES
( 'Fonasa'),
( 'Banmédica'),
( 'Colmena Golden Cross'),
( 'Consalud'),
( 'Cruz Blanca'),
( 'Nueva Masvida'),
( 'Vida Tres'),
( 'Isapre Óptima'),
( 'Isapre Chuquicamata'),
( 'Isapre Río Blanco');


--REGION
INSERT INTO "Region" (nombre_region)
VALUES
('Arica y Parinacota'),
( 'Tarapacá'),
( 'Antofagasta'),
( 'Atacama'),
( 'Coquimbo'),
( 'Valparaíso'),
( 'Metropolitana de Santiago'),
( 'Libertador General Bernardo O’Higgins'),
( 'Maule'),
( 'Ñuble'),
( 'Biobío'),
( 'La Araucanía'),
( 'Los Ríos'),
( 'Los Lagos'),
( 'Aysén del General Carlos Ibáñez del Campo'),
( 'Magallanes y de la Antártica Chilena');



-- INSERTAR 10 PACIENTES

INSERT INTO "Paciente" (
  primer_nombre, 
	segundo_nombre,
	apellido_paterno, 
	apellido_materno, 
	sexo, 
	fecha_nacimiento, 
	hospitalizado, 
	rut, 
	telefono, 
	mail, 
	calle, 
	numero_casa, 
	fecha_ingreso, 
	fecha_alta, 
	fk_comuna_id,
	fk_habitacion_id, 
	fk_medico_id, 
	"fk_Region_id",
	fk_id_prevision
) VALUES
('Juan', 'Carlos', 'Pérez', 'González', TRUE, '1980-06-15', TRUE, 12345678, 987654321, 'juan.perez@mail.com', 'Los Alerces', '123', '2024-04-01', '2024-04-10', 1, 1, 1, 1,1),
('María', 'Isabel', 'Sánchez', 'López', FALSE, '1992-03-22', FALSE, 23456789, 123456789, 'maria.sanchez@mail.com', 'Las Rosas', '456', '2024-03-15', '2024-03-20', 1, 1, 1, 1,1),
('Pedro', 'Andrés', 'García', 'Martínez', TRUE, '1975-11-30', TRUE, 34567890, 987654321, 'pedro.garcia@mail.com', 'Los Pinos', '789', '2024-04-05', '2024-04-15', 1, 1, 1, 1,1),
('Ana', 'María', 'Rodríguez', 'Fernández', FALSE, '1985-07-20', FALSE, 45678901, 123456789, 'ana.rodriguez@mail.com', 'El Roble', '321', '2024-02-01', '2024-02-10', 1, 1, 1, 1,1),
('Luis', 'Alberto', 'Morales', 'Silva', TRUE, '1990-09-10', TRUE, 56789012, 987654321, 'luis.morales@mail.com', 'Los Laureles', '654', '2024-03-20', '2024-03-30', 1, 1, 1, 1,1),
('Carmen', 'Teresa', 'Vargas', 'Díaz', FALSE, '1988-12-05', TRUE, 67890123, 123456789, 'carmen.vargas@mail.com', 'El Manzano', '987', '2024-04-10', '2024-04-20', 1, 1, 1, 1,1),
('Roberto', 'José', 'López', 'Muñoz', TRUE, '1972-05-18', FALSE, 78901234, 987654321, 'roberto.lopez@mail.com', 'Las Magnolias', '321', '2024-03-01', '2024-03-11', 1, 1, 1, 1,1),
('Daniela', 'Francisca', 'Martínez', 'Ruiz', FALSE, '1995-01-25', TRUE, 89012345, 123456789, 'daniela.martinez@mail.com', 'Los Helechos', '456', '2024-04-15', '2024-04-25', 1, 1, 1,1,1),
('Carlos', 'Antonio', 'Navarro', 'Quintana', TRUE, '1983-08-30', FALSE, 90123456, 987654321, 'carlos.navarro@mail.com', 'El Ciprés', '789', '2024-02-15', '2024-02-25', 1, 1, 1, 1,1),
('Sofía', 'Elena', 'Castillo', 'Bravo', FALSE, '1997-04-14', TRUE, 10234567, 123456789, 'sofia.castillo@mail.com', 'Los Cedros', '123', '2024-04-20', '2024-04-30', 1, 1, 1, 1,1);

SELECT* FROM public."Cama"
SELECT* FROM public."Comuna"
SELECT* FROM public."Diagnostico"
SELECT* FROM public."Enfermedad"
SELECT* FROM public."Especialidad"
SELECT* FROM public."Examen"
SELECT* FROM public."Habitacion"
SELECT* FROM public."Medico"
SELECT* FROM public."Paciente"
SELECT* FROM public."Prevision"
SELECT* FROM public."Region"
