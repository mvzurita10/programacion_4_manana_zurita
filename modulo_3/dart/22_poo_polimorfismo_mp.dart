
// Clase abstracta
abstract class ActividadTherAppy {

  String get nombre;

  int calcularDuracion();

}

// Meditación
class Meditacion extends ActividadTherAppy {

  final int minutos;

  Meditacion(this.minutos);

  @override
  String get nombre => 'Meditación';

  @override
  int calcularDuracion() => minutos;
}

// Respiración Profunda
class RespiracionProfunda extends ActividadTherAppy {

  final int minutos;

  RespiracionProfunda(this.minutos);

  @override
  String get nombre => 'Respiración Profunda';

  @override
  int calcularDuracion() => minutos;
}

// Mindfulness
class Mindfulness extends ActividadTherAppy {

  final int minutos;

  Mindfulness(this.minutos);

  @override
  String get nombre => 'Mindfulness';

  @override
  int calcularDuracion() => minutos;
}

// POLIMORFISMO:
// Una sola función funciona con cualquier actividad
void mostrarActividad(ActividadTherAppy actividad) {

  print(
    '${actividad.nombre}: '
    '${actividad.calcularDuracion()} minutos',
  );

}

void main() {

  final actividades = <ActividadTherAppy>[
    Meditacion(15),
    RespiracionProfunda(10),
    Mindfulness(20),
  ];

  // Misma llamada, diferente comportamiento
  for (final actividad in actividades) {
    mostrarActividad(actividad);
  }

  // Actividad con mayor duración
  final actividadMasLarga = actividades.reduce(
    (a, b) =>
        a.calcularDuracion() > b.calcularDuracion()
            ? a
            : b,
  );

  print(
    '\nActividad más larga: '
    '${actividadMasLarga.nombre}',
  );
}