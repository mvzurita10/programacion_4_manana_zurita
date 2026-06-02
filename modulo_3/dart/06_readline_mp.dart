import 'dart:io';

void main() {

  print('=== Bienvenido a TherAppy ===');

  print('Ingrese su nombre:');
  String? nombre = stdin.readLineSync();

  print('Hola, $nombre. Gracias por utilizar TherAppy.');

  print('\nIngrese su nivel de estrés actual (1 - 10):');
  int nivelEstres = int.parse(stdin.readLineSync()!);

  print('Nivel de estrés registrado: $nivelEstres');

  print('\nIngrese su nivel de bienestar emocional (1.0 - 10.0):');
  double bienestar = double.parse(stdin.readLineSync()!);

  print('Nivel de bienestar registrado: $bienestar');

  print('\nIngrese los minutos de meditación realizados hoy:');
  int meditacion = int.parse(stdin.readLineSync()!);

  print('Ingrese los minutos de respiración consciente realizados hoy:');
  int respiracion = int.parse(stdin.readLineSync()!);

  int tiempoTotal = meditacion + respiracion;

  print('\n===== REPORTE THERAPPY =====');
  print('Usuario: $nombre');
  print('Nivel de estrés: $nivelEstres');
  print('Nivel de bienestar: $bienestar');
  print('Tiempo total de actividades de relajación: $tiempoTotal minutos');
}