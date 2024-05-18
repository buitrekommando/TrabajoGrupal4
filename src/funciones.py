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




def CambioDeMedico():
    # Solicitar la ID del nuevo médico y el RUT del paciente
    print("--Para reasignar medico indique Rut depaciente y ID de médico--")
    rut_paciente = input("Por favor, ingresa el RUT del paciente: ")
    nuevo_medico_id = input("Por favor, ingresa la ID del nuevo médico: ")
    

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




