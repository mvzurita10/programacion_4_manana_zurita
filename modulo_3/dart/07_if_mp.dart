void main() {

  // Forma básica
  int nivelEstres = 8;

  if (nivelEstres >= 8) {
    print('Estrés alto');
  } else if (nivelEstres >= 4) {
    print('Estrés moderado');
  } else {
    print('Estrés bajo');
  }

  // Operador ternario
  String estado =
      nivelEstres >= 8 ? 'Necesita apoyo emocional' : 'Estado estable';

  print(estado);

  // null-aware con ternario
  String? tecnicaRecomendada;

  String display = tecnicaRecomendada != null
      ? tecnicaRecomendada.toUpperCase()
      : 'Sin técnica recomendada';

  print(display);

  // Forma más concisa con ??
  String display2 =
      tecnicaRecomendada?.toUpperCase() ??
      'Sin técnica recomendada';

  print(display2);

  String? emocionActual;

  // Sin verificar — error de compilación
  // print(emocionActual.length);

  // Forma 1 — verificación explícita
  if (emocionActual != null) {
    print(emocionActual.length);
  }

  // Forma 2 — operador ?.
  print(emocionActual?.length);

  // Forma 3 — valor por defecto
  int longitud = emocionActual?.length ?? 0;

  print(longitud);

  // Ejemplo adicional de TherAppy
  int bienestar = 9;

  String mensaje = bienestar >= 8
      ? 'Excelente bienestar emocional'
      : 'Se recomienda realizar ejercicios de relajación';

  print(mensaje);
}