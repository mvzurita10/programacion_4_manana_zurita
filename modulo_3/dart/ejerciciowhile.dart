import 'dart.io';

void main() {
    int totalSillas = 1, 
    int empleados = 0,
    int sillas = 0,

    while (horas > 0) {
        print("Ingrese las horas trabajadas: ")
        horas = double.parse(readlineSync()); 

        if (horas > 0) {
            print("Ingrese la cantidad de sillas fabricadas: ")
            sillas = int.parse(readLineSync());

            empleados ++; 
            totalSillas += sillas; 

            double sillasPorHora = sillas / horas; 
            
            if (sillas

        }

        if (sillas < 20) {
            print("Rendimiento Bajo");
        } else if (cajas >= 20 && cajas <=50) { 
            print("Rendimiento Normal");
        } else {
            print("Rendimiento Excelente")
        }
    }


    print("Total de cajas empacadas: $totalCajas");
    print("Total de empleado registrados: $empleados"); 

    if (empleados > 0) {
        double promedio = totalCajas / empleados;
        print("Promedio de cajas por empleados: $promedio"); 
    } else {
        print("No existen empleados registrados"): 
    }

}
