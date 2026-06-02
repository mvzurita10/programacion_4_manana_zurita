void main() {

  // while — comprueba la condición ANTES de ejecutar
  int actividadesCompletadas = 0;
  int minutosDisponibles = 60;

  while (minutosDisponibles > 0) {

    final tiempoActividad =
        minutosDisponibles > 15 ? 15 : minutosDisponibles;

    actividadesCompletadas++;
    minutosDisponibles -= tiempoActividad;

    print(
        'Actividad $actividadesCompletadas: $tiempoActividad minutos '
        '(restante: $minutosDisponibles minutos)');
  }

  // do-while — ejecuta AL MENOS UNA VEZ
  int intentosRespiracion = 0;
  bool estadoCalma = false;

  do {
    intentosRespiracion++;

    print(
        'Ejercicio de respiración #$intentosRespiracion...');

    // Simular que alcanza la calma en el tercer intento
    if (intentosRespiracion == 3) {
      estadoCalma = true;
    }

  } while (!estadoCalma && intentosRespiracion < 5);

  print(
    estadoCalma
        ? 'Estado de calma alcanzado tras $intentosRespiracion ejercicios'
        : 'Se recomienda continuar con más ejercicios',
  );
}