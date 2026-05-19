void main() {
  // Forma básica
    print('Ingrese la calificación:');
    int numero = int.parse(stdin.readLineSync()!);

    if (numero >= 7) {
        print('Aprobado');
    } else if (numero < 7) {
        print('Reprobado');
    } else {
        print('Resultado desconocido');
    }


}