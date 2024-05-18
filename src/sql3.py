import psycopg2

def CambioDeCama():
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

        # Crear un cursor para ejecutar las consultas
        cursor = conn.cursor()

        while True:
            # Solicitar el RUT del paciente y el nuevo número de habitación
            rut_paciente = input("Ingresa el RUT del paciente: ")
            numero_habitacion = input("Ingresa el nuevo número de habitación: ")

            # Verificar si el paciente existe en la base de datos
            cursor.execute("SELECT 1 FROM public.\"Paciente\" WHERE rut = %s;", (rut_paciente,))
            if cursor.fetchone():
                # Ejecutar la consulta SQL de actualización
                cursor.execute("UPDATE public.\"Paciente\" SET fk_habitacion_id = %s WHERE rut = %s;", (numero_habitacion, rut_paciente))
                conn.commit()
                print(f"Se ha cambiado la habitación del paciente con RUT {rut_paciente} al número {numero_habitacion}.")
                break
            else:
                print(f"No se encontró al paciente con RUT {rut_paciente}. Ingresa un RUT válido.")

    except (Exception, psycopg2.DatabaseError) as error:
        print("Error al conectar o ejecutar la consulta:", error)

    finally:
        # Cerrar la conexión
        cursor.close()
        conn.close()

# Llamar a la función
CambioDeCama()
