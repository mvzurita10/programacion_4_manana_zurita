void main() {
  // Forma básica
    print('Ingrese un número entero:');
    int numero = int.parse(stdin.readLineSync()!);

    if (numero >= 1) {
        print('Positivo');
    } else if (numero == 0) {
        print('Cero');
    } else {
        print('Negativo');
    }


}