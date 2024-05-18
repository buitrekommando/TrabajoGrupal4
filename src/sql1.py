import psycopg2

def lista_pacientes():
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
        cursor.execute('SELECT \
            pa.rut, pa.primer_nombre || \' \' || pa.apellido_paterno AS nombre_paciente, \
            di.descripcion AS diagnostico, \
            m.primer_nombre || \' \' || m.apellido_paterno AS nombre_medico, \
            ha.numero AS numero_habitacion \
        FROM \
            public."Paciente" pa \
        INNER JOIN \
            public."Diagnostico" di ON pa.fk_id_diagnostico = di.idagnostico_id \
        INNER JOIN \
            public."Medico" m ON pa.fk_medico_id = m.medico_id \
        INNER JOIN \
            public."Habitacion" ha ON pa.fk_habitacion_id = ha.habitacion_id')

        # Mostrar los resultados
        print("A continuación se encuentra la lista de pacientes:")
        print("RUT     |   Nombre paciente   | Diagnóstico | Medico | Habitación")
        for rut, nombre_paciente, diagnostico, nombre_medico, numero_habitacion in cursor.fetchall():
            print(rut, "|", nombre_paciente, "|", diagnostico, "|", nombre_medico, "|", numero_habitacion)

    except (Exception, psycopg2.DatabaseError) as error:
        print("Error al conectar o ejecutar la consulta:", error)

    finally:
        # Cerrar la conexión
        cursor.close()
        conn.close()

# Llamar a la función
lista_pacientes()
