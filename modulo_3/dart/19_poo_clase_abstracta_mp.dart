
// Clase abstracta: define qué puede hacer cualquier actividad
abstract class ActividadBienestar {

  String get nombre;

  int calcularDuracion();

  int calcularImpacto();

  // Método concreto
  void describir() {
    print(
      '$nombre — duración: ${calcularDuracion()} min, '
      'impacto emocional: ${calcularImpacto()}/10',
    );
  }
}

// Actividad: Meditación
class Meditacion extends ActividadBienestar {

  final int minutos;

  Meditacion(this.minutos);

  @override
  String get nombre => 'Meditación';

  @override
  int calcularDuracion() => minutos;

  @override
  int calcularImpacto() => 8;
}

// Actividad: Respiración Profunda
class RespiracionProfunda extends ActividadBienestar {

  final int minutos;

  RespiracionProfunda(this.minutos);

  @override
  String get nombre => 'Respiración Profunda';

  @override
  int calcularDuracion() => minutos;

  @override
  int calcularImpacto() => 6;
}

void main() {

  final actividades = <ActividadBienestar>[
    Meditacion(15),
    RespiracionProfunda(10),
  ];

  for (final actividad in actividades) {
    actividad.describir();
  }
}