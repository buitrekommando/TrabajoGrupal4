import psycopg2

def obtener_medicos():
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

        # Ejecutar la consulta SQL para obtener los médicos
        cursor.execute("SELECT medico_id, primer_nombre, apellido_paterno FROM public.\"Medico\";")

        # Obtener los resultados
        medicos = cursor.fetchall()

        # Mostrar la lista de médicos disponibles
        print("Médicos disponibles:")
        for medico in medicos:
            print(f"{medico[0]} - {medico[1]} {medico[2]}")

        return medicos

    except (Exception, psycopg2.DatabaseError) as error:
        print("Error al conectar o ejecutar la consulta:", error)

    finally:
        # Cerrar la conexión
        cursor.close()
        conn.close()

def CambioDeMedico():
    # Obtener la lista de médicos disponibles
    medicos = obtener_medicos()

    # Solicitar la ID del nuevo médico y el RUT del paciente
    print("--Para reasignar médico, indique el RUT del paciente y la ID del nuevo médico--")
    rut_paciente = input("Por favor, ingresa el RUT del paciente: ")
    nuevo_medico_id = input("Por favor, ingresa la ID del nuevo médico: ")

    # Verificar si el médico existe en la lista de médicos disponibles
    medicos_ids = [str(medico[0]) for medico in medicos]
    if nuevo_medico_id not in medicos_ids:
        print(f"No se encontró al médico con ID {nuevo_medico_id}. Ingresa una ID válida.")
        return

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

        # Ejecutar la consulta SQL de actualización
        cursor.execute("""
            UPDATE 
                public."Paciente"
            SET 
                fk_medico_id = %s
            WHERE
                rut = %s;
        """, (nuevo_medico_id, rut_paciente))

        # Confirmar los cambios en la base de datos
        conn.commit()

        # Verificar si la actualización tuvo éxito
        if cursor.rowcount == 0:
            print("No se encontró el paciente con el RUT proporcionado o el médico ya tiene asignado ese RUT.")
        else:
            print(f"El médico con ID {nuevo_medico_id} ha sido asignado al paciente con RUT {rut_paciente}.")

    except (Exception, psycopg2.DatabaseError) as error:
        print("Error al conectar o ejecutar la consulta:", error)

    finally:
        # Cerrar la conexión
        cursor.close()
        conn.close()

# Llamar al método
CambioDeMedico()
