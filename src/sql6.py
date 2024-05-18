import psycopg2

def agregar_habitaciones():
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

        # Imprimir las habitaciones actuales
        cursor.execute("SELECT * FROM public.\"Habitacion\";")
        habitaciones_actuales = cursor.fetchall()
        print("Habitaciones actuales:")
        for habitacion in habitaciones_actuales:
            print(habitacion)

        while True:
            # Solicitar el valor por teclado
            numero_habitacion = input("Ingresa el número de la habitación: ")

            # Verificar si ya existe el valor en la tabla
            cursor.execute("SELECT 1 FROM public.\"Habitacion\" WHERE numero = %s;", (numero_habitacion,))
            if cursor.fetchone():
                print(f"El número {numero_habitacion} ya existe en la base de datos. Ingresa otro valor.")
            else:
                # Ejecutar la consulta SQL de inserción
                cursor.execute("INSERT INTO public.\"Habitacion\" (numero) VALUES (%s);", (numero_habitacion,))
                conn.commit()
                print(f"Se ha insertado el número {numero_habitacion} correctamente.")
                break

    except (Exception, psycopg2.DatabaseError) as error:
        print("Error al conectar o ejecutar la consulta:", error)

    finally:
        # Cerrar la conexión
        cursor.close()
        conn.close()

# Llamar a la función
agregar_habitaciones()
