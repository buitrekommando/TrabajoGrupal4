SET check_function_bodies = false
;

CREATE TABLE "Cama"(cama_id integer NOT NULL, fk_habitacion_id integer NOT NULL, CONSTRAINT "Cama_pkey" PRIMARY KEY(cama_id));

CREATE TABLE "Comuna"(comuna_id integer NOT NULL, nombre_comuna character varying NOT NULL, CONSTRAINT "Comuna_pkey" PRIMARY KEY(comuna_id));

CREATE TABLE "Diagnostico"(
  idagnostico_id integer NOT NULL,
  fecha date,
  descripcion text,
  CONSTRAINT "Diagnostico_pkey" PRIMARY KEY(idagnostico_id)
);

CREATE TABLE "Enfermedad"(enfermedad_id character varying NOT NULL, CONSTRAINT "Enfermedad_pkey" PRIMARY KEY(enfermedad_id));

CREATE TABLE "Especialidad"(especialidad_id character varying NOT NULL, CONSTRAINT "Especialidad_pkey" PRIMARY KEY(especialidad_id));

CREATE TABLE "Examen"(
  examen_id integer NOT NULL,
  fecha date NOT NULL,
  resultados text NOT NULL,
  fk_paciente_id integer NOT NULL,
  CONSTRAINT "Examen_pkey" PRIMARY KEY(examen_id)
);

CREATE TABLE "Habitacion"(habitacion_id integer NOT NULL, numero integer NOT NULL, CONSTRAINT "Habitacion_pkey" PRIMARY KEY(habitacion_id));

CREATE TABLE "Medico"(
  medico_id integer NOT NULL,
  primer_nombre character varying NOT NULL,
  apellido_paterno character varying NOT NULL,
  apellido_materno character varying,
  segundo_nombre character varying,
  rut integer NOT NULL,
  sexo bool NOT NULL,
  fecha_nacimiento date NOT NULL,
  telefono integer NOT NULL,
  mail character varying NOT NULL,
  fk_especialidad_id character varying NOT NULL,
  CONSTRAINT "Medico_pkey" PRIMARY KEY(medico_id)
);

CREATE TABLE "Paciente"(
  paciente_id integer NOT NULL,
  primer_nombre character varying NOT NULL,
  segundo_nombre character varying,
  apellido_paterno character varying NOT NULL,
  apellido_materno character varying,
  sexo bool NOT NULL,
  fecha_nacimiento date NOT NULL,
  hospitalizado bool NOT NULL,
  rut integer NOT NULL,
  telefono integer NOT NULL,
  mail character varying NOT NULL,
  calle character varying NOT NULL,
  numero_casa character varying,
  fecha_ingreso date NOT NULL,
  fecha_alta date NOT NULL,
  fk_comuna_id integer NOT NULL,
  fk_habitacion_id integer NOT NULL,
  fk_medico_id integer NOT NULL,
  "fk_Region_id" integer NOT NULL,
  fk_id_prevision character varying NOT NULL,
  CONSTRAINT "Paciente_pkey" PRIMARY KEY(paciente_id)
);

CREATE TABLE "Prevision"(id_prevision character varying NOT NULL, CONSTRAINT "Prevision_pkey" PRIMARY KEY(id_prevision));

CREATE TABLE "Region"(id integer NOT NULL, nombre_region integer NOT NULL, CONSTRAINT "Region_pkey" PRIMARY KEY(id));

ALTER TABLE "Paciente" ADD CONSTRAINT "Paciente_fk_comuna_id_fkey" FOREIGN KEY (fk_comuna_id) REFERENCES "Comuna" (comuna_id);

ALTER TABLE "Paciente" ADD CONSTRAINT "Paciente_fk_habitacion_id_fkey" FOREIGN KEY (fk_habitacion_id) REFERENCES "Habitacion" (habitacion_id);

ALTER TABLE "Cama" ADD CONSTRAINT "Cama_fk_habitacion_id_fkey" FOREIGN KEY (fk_habitacion_id) REFERENCES "Habitacion" (habitacion_id);

ALTER TABLE "Examen" ADD CONSTRAINT "Examen_fk_paciente_id_fkey" FOREIGN KEY (fk_paciente_id) REFERENCES "Paciente" (paciente_id);

ALTER TABLE "Diagnostico" ADD CONSTRAINT "Diagnostico_idagnostico_id_fkey" FOREIGN KEY (idagnostico_id) REFERENCES "Examen" (examen_id);

ALTER TABLE "Enfermedad" ADD CONSTRAINT "Enfermedad_enfermedad_id_fkey" FOREIGN KEY (enfermedad_id) REFERENCES "Diagnostico" (idagnostico_id);

ALTER TABLE "Paciente" ADD CONSTRAINT "Paciente_fk_medico_id_fkey" FOREIGN KEY (fk_medico_id) REFERENCES "Medico" (medico_id);

ALTER TABLE "Paciente" ADD CONSTRAINT "Paciente_fk_Region_id_fkey" FOREIGN KEY ("fk_Region_id") REFERENCES "Region" (id);

ALTER TABLE "Paciente" ADD CONSTRAINT "Paciente_fk_id_prevision_fkey" FOREIGN KEY (fk_id_prevision) REFERENCES "Prevision" (id_prevision);

ALTER TABLE "Medico" ADD CONSTRAINT "Medico_fk_especialidad_id_fkey" FOREIGN KEY (fk_especialidad_id) REFERENCES "Especialidad" (especialidad_id);
