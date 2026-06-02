void main() {

  // for con índice — recorrer sesiones de bienestar
  for (int i = 1; i <= 5; i++) {
    print('Sesión emocional #$i completada');
  }

  // for con paso distinto — progreso del usuario
  for (int progreso = 0; progreso <= 100; progreso += 25) {
    print('Progreso del plan de bienestar: $progreso%');
  }

  // for decreciente — ejercicios pendientes
  for (int ejerciciosPendientes = 5;
      ejerciciosPendientes >= 1;
      ejerciciosPendientes--) {
    print(
        'Ejercicios de relajación pendientes: $ejerciciosPendientes');
  }
}