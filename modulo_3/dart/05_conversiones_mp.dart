void main() {

  // Conversiones numéricas
  int sesionesCompletadas = 42;

  double sesionesDecimal =
      sesionesCompletadas.toDouble(); // 42.0

  String sesionesTexto =
      sesionesCompletadas.toString(); // "42"

  // String → número
  int nivelEstres = int.parse('7');      // 7
  double nivelAnimo = double.parse('8.5'); // 8.5

  // Conversión segura (no lanza excepción)
  int? ejercicios =
      int.tryParse('relajacion'); // null

  double? puntuacion =
      double.tryParse('9'); // 9.0

  // Verificar tipo con is
  Object emocion = 'Felicidad';

  if (emocion is String) {
    print(
        'La emoción "$emocion" tiene ${emocion.length} caracteres');
  }

  // Cast explícito con as
  Object tecnica = 'Mindfulness';

  String tecnicaBienestar =
      tecnica as String;

  print('Técnica recomendada: $tecnicaBienestar');

  // Comprobar nulabilidad
  String? consejoDiario = null;

  int longitudConsejo =
      consejoDiario?.length ?? 0;

  print(longitudConsejo); // 0

  // Números especiales
  print(double.infinity);   // Infinity
  print(double.nan);        // NaN
  print(double.maxFinite);  // Máximo valor double

  // Resultados de ejemplo
  print('Sesiones completadas: $sesionesCompletadas');
  print('Sesiones en decimal: $sesionesDecimal');
  print('Sesiones en texto: $sesionesTexto');
  print('Nivel de estrés: $nivelEstres');
  print('Nivel de ánimo: $nivelAnimo');
  print('Ejercicios convertidos: $ejercicios');
  print('Puntuación convertida: $puntuacion');
}