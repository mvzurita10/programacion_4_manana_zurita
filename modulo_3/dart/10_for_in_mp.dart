void main() {

  final emociones = [
    'Felicidad',
    'Calma',
    'Gratitud',
    'Motivación',
    'Confianza'
  ];

  // for-in — recorrer lista de emociones
  for (final emocion in emociones) {
    print(emocion);
  }

  // forEach con lambda
  emociones.forEach(
      (e) => print(e.toLowerCase()));

  // for-in sobre un Map
  final tecnicas = {
    'Respiración Profunda': 10,
    'Meditación': 15,
    'Mindfulness': 20,
    'Diario Emocional': 5,
  };

  for (final entrada in tecnicas.entries) {
    print(
        '${entrada.key} → ${entrada.value} minutos recomendados');
  }

  // for-in sobre caracteres de un String
  for (final caracter in 'TherAppy'.split('')) {
    print(caracter);
  }
}