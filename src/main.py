from funciones import lista_pacientes, MostrarPacienteViaRut, CambioDeCama, CambioDeMedico,insertar_cama,agregar_habitaciones

while True:
    print("\nMenú:")
    print("1. Lista de pacientes")
    print("2. Mostrar paciente por RUT")
    print("3. Cambiar paciente de habitación")
    print("4. Cambiar paciente de médico")
    print("5. Insertar cama")
    print("6. Agregar habitaciones")
    print("7. Salir del programa")

    opcion = input("Elige una opción (1-7): ")

    if opcion == "1":
        lista_pacientes()
    elif opcion == "2":
        MostrarPacienteViaRut()
    elif opcion == "3":
        CambioDeCama()
    elif opcion == "4":
        CambioDeMedico()
    elif opcion =="5":
        insertar_cama()
    elif opcion=="6":
        agregar_habitaciones()
    elif opcion == "7":
        print("¡Hasta luego!")
        break
    else:
        print("Opción inválida. Elige una opción del 1 al 5.")
