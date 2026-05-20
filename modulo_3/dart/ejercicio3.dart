import 'dart.io';

void main() {
    int cajas = 1, 
    int totalCajas = 0,
    int empleados = 0, 

    while (cajas > 0) {
        print("Ingrese la cantidad de cajas empaquetadas: ")
        cajas = int.parse(readlineSync()!);

        if (cajas > 0) {
            empleados++;
            totalCajas += cajas; 
        }

        if (cajas < 20) {
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
