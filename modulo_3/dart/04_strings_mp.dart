void main() {

  final usuario = 'Miky';
  final nivelBienestar = 8;

  // Interpolación con $
  print('Bienvenido a TherAppy, $usuario');

  // Expresión con ${}
  print(
      '${usuario.toUpperCase()} tiene un nivel de bienestar de ${nivelBienestar + 1} esta semana');

  // String multilínea con triple comillas
  final reporte = '''
  Aplicación: TherAppy
  Usuario: $usuario
  Nivel de Bienestar: $nivelBienestar
  Estado Saludable: ${nivelBienestar >= 7 ? 'Sí' : 'No'}
  ''';

  print(reporte);

  // Raw string
  final rutaReportes =
      r'C:\TherAppy\Reportes\Bienestar';

  print(rutaReportes);

  // Concatenación
  final mensaje = 'Hola, ' + usuario + ', gracias por usar TherAppy';

  print(mensaje);

  // Métodos útiles de String
  print('therappy'.toUpperCase());                 // THERAPPY
  print('  Control Emocional  '.trim());          // Control Emocional
  print('Respiracion Profunda'.contains('Prof')); // true
  print('TherAppy'.replaceAll('p', 'P'));         // TherAPPy
  print('Calma,Felicidad,Gratitud'.split(','));   // [Calma, Felicidad, Gratitud]
  print('Mindfulness'.substring(0, 4));           // Mind
  print('TherAppy'.startsWith('Ther'));           // true
  print('7'.padLeft(3, '0'));                     // 007
}