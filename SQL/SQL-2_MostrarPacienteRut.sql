SELECT 
    pa.rut,
    pa.primer_nombre || ' ' || pa.apellido_paterno AS nombre_paciente,
    di.descripcion AS diagnostico,
    me.primer_nombre || ' ' || me.apellido_paterno AS nombre_medico,
    ex.fecha AS fecha_ultimo_examen,
    ha.numero AS numero_habitacion
FROM 
    public."Paciente" pa
INNER JOIN 
    public."Diagnostico" di ON pa.fk_id_diagnostico = di.idagnostico_id
INNER JOIN 
    public."Medico" me ON pa.fk_medico_id = me.medico_id
INNER JOIN 
    public."Examen" ex ON pa.paciente_id = ex.fk_paciente_id
INNER JOIN 
    public."Habitacion" ha ON pa.fk_habitacion_id = ha.habitacion_id
WHERE 
pa.rut = 'rut_del_paciente'
ORDER BY 
    ex.fecha DESC
LIMIT 1,1;
