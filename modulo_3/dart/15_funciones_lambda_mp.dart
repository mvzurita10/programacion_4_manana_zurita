
void main() {

  // Lambda asignada a una variable
  final aumentarBienestar = (int nivel) => nivel + 2;

  print(aumentarBienestar(7)); // 9

  // Lambda de cuerpo completo
  final calcularNivelCalma = (
    double nivelActual,
    double mejora,
  ) {
    final resultado = nivelActual + mejora;

    return resultado > 10 ? 10 : resultado;
  };

  print(calcularNivelCalma(7.0, 2.5)); // 9.5

  // Lambda en línea — pasada directamente como argumento
  final emociones = [
    'Estrés',
    'Calma',
    'Ansiedad',
    'Felicidad',
    'Gratitud'
  ];

  emociones.sort(
    (a, b) => a.compareTo(b),
  );

  print(emociones);

}