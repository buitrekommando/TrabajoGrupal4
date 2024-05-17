SELECT 
    pa.rut,
    pa.primer_nombre || ' ' || pa.apellido_paterno AS nombre_paciente,
    di.descripcion AS diagnostico,
    me.primer_nombre || ' ' || me.apellido_paterno AS nombre_medico,
    ha.numero AS numero_habitacion
FROM 
    public."Paciente" pa
INNER JOIN 
    public."Diagnostico" di ON pa.fk_id_diagnostico = di.idagnostico_id
INNER JOIN 
    public."Medico" me ON pa.fk_medico_id = me.medico_id
INNER JOIN 
    public."Habitacion" ha ON pa.fk_habitacion_id = ha.habitacion_id;
