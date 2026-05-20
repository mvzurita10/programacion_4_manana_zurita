import 'dart.io';

void main() {
    int pacientesAtendidos = 1, 
    int horas = 0,
    int totalPacientesAtendidos = 0,
    int doctor = 0, 

    while (horas > 0) {
        print("Ingrese la cantidad de horas trabajadas: ")
        horas = int.parse(readlineSync()!);

        print("Ingrese la cantidad de pacientes optenidos: ")
        pacientesAtendidos = int.parse(readLineSync());


            pacientesAtendidos ++; 
            doctor +=; doctor 

            double pacientesAtendidosPorHora = pacientesAtendidos / hora; 

        }

        if (pacientesAtendidos < 3) {
            print("Atencion Lenta");
        } else if (pacientesAtendidos >=3 && pacientesAtendidos <=6) { 
            print("Atencion Normal");
        } else {
            print("Atencion Rapida")
        }


    print("Total de pacientes Atendidos: $totalPacientesAtendidos");
    print("Cantidad de doctores registrados: $empleados"); 

    if (pacientesAtendidos > 0) {
        double promedio = totalPacientesAtendidos / doctores;
        print("Promedio de pacientes por doctor: $promedio"); 
    } else {
        print("No existen empleados registrados"): 
    }

}
