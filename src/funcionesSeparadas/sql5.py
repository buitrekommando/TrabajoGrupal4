import psycopg2

def insertar_cama():
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

        # Imprimir las camas actuales
        cursor.execute("SELECT * FROM public.\"Cama\";")
        camas_actuales = cursor.fetchall()
        print("Camas actuales:")
        for cama in camas_actuales:
            print(cama)

        while True:
            # Solicitar el valor por teclado
            fk_habitacion_id = input("Ingresa el ID de la habitación: ")

            # Verificar si ya existe el valor en la tabla
            cursor.execute("SELECT 1 FROM public.\"Cama\" WHERE fk_habitacion_id = %s;", (fk_habitacion_id,))
            if cursor.fetchone():
                print(f"El valor {fk_habitacion_id} ya existe en la base de datos. Ingresa otro valor.")
            else:
                # Ejecutar la consulta SQL de inserción
                cursor.execute("INSERT INTO public.\"Cama\" (fk_habitacion_id) VALUES (%s);", (fk_habitacion_id,))
                conn.commit()
                print(f"Se ha insertado el valor {fk_habitacion_id} correctamente.")
                break

    except (Exception, psycopg2.DatabaseError) as error:
        print("Error al conectar o ejecutar la consulta:", error)

    finally:
        # Cerrar la conexión
        cursor.close()
        conn.close()

# Llamar a la función
insertar_cama()
