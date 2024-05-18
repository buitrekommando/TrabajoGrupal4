import psycopg2

def MostrarPacienteViaRut():
    while True:
        # Solicitar el RUT del paciente
        rut_paciente = input("Por favor, ingresa el RUT del paciente: ")

        # Parámetros de conexión a la base de datos
        db_params = {
            "host": "localhost",
            "database": "Clinica",
            "user": "postgres",
            "password": "adobe16"
        }

        try:
            # Conectarse a la base de datos
            conn = psycopg2.connect(**db_params)
            print("Conexión exitosa a la base de datos.")

            # Crear un cursor para ejecutar la consulta
            cursor = conn.cursor()

            # Ejecutar la consulta SQL
            cursor.execute("""
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
                    pa.rut = %s
            """, (rut_paciente,))

            # Obtener los resultados
            records = cursor.fetchall()

            # Imprimir los resultados
            for row in records:
                print(row)

            # Salir del bucle si se encontraron resultados
            if records:
                break
            else:
                print("No se encontró ningún paciente con ese RUT. Inténtalo nuevamente.")

        except (Exception, psycopg2.DatabaseError) as error:
            print("Error al conectar o ejecutar la consulta:", error)

        finally:
            # Cerrar la conexión
            cursor.close()
            conn.close()

# Llamar al método
MostrarPacienteViaRut()
