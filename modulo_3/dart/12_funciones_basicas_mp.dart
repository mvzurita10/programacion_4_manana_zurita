// Mensaje de bienvenida
void bienvenidaTherAppy() {
  print('Bienvenido a TherAppy');
}

// Función sin parámetros
int ejerciciosCompletados() {
  return 5 + 2;
}

// Sintaxis completa
int sumarMinutosMeditacion(int manana, int tarde) {
  return manana + tarde;
}

// Sintaxis de flecha
int calcularBienestar(int animo, int calma) => animo * calma;

// void — no devuelve valor
void mostrarSeccion(String titulo) {
  print('─── $titulo ───');
}

// Con tipo explícito
String formatearNivelBienestar(double nivel) =>
    'Nivel de bienestar: ${nivel.toStringAsFixed(1)}/10';

// Sin tipo explícito
formatearNivelEstres(double nivel) =>
    'Nivel de estrés: ${nivel.toStringAsFixed(1)}/10';

// Parámetro opcional
String generarReporte(String usuario, String emocion, [int? sesiones]) {
  if (sesiones != null) {
    return 'Usuario: $usuario | Emoción: $emocion | Sesiones: $sesiones';
  }
  return 'Usuario: $usuario | Emoción: $emocion';
}

// Parámetro opcional con valor por defecto
String generarReporteV2(
    String usuario,
    String emocion,
    [int sesiones = 1]
) {
  return 'Usuario: $usuario | Emoción: $emocion | Sesiones: $sesiones';
}

void main() {

  bienvenidaTherAppy();

  print(ejerciciosCompletados()); // 7

  print(sumarMinutosMeditacion(15, 20)); // 35

  print(calcularBienestar(2, 4)); // 8

  mostrarSeccion('Resumen Emocional');

  print(formatearNivelBienestar(8.7));

  print(formatearNivelEstres(3.2));

  print(
    generarReporte(
      'Miky',
      'Calma',
    ),
  );

  print(
    generarReporte(
      'Miky',
      'Felicidad',
      5,
    ),
  );

  print(
    generarReporteV2(
      'Miky',
      'Motivación',
    ),
  );
}