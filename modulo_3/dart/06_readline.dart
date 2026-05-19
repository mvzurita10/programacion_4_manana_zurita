import 'dart:io';

void main() {
    print('Ingrese su nombre:');
    String? nombre = stdin.readLineSync();  // lee una línea de la consola
    print('Hola, $nombre');

    print('Ingrese un número entero:');
    int numero = int.parse(stdin.readLineSync()!);  // lee y convierte a int
    print('Número: $numero');

    print('Ingrese un número decimal:');
    double valor = double.parse(stdin.readLineSync()!);  // lee y convierte a double
    print('valor: $valor');

    print('Ingrese el primer numero:');
    int a = int.parse(stdin.readLineSync()!);  // lee y convierte a int

    print('Ingrese el segundo numero:');
    int b = int.parse(stdin.readLineSync()!);  // lee y convierte a int

    int suma = a + b;
    print('La suma es: $suma');
}