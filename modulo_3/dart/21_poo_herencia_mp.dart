
// Clase base — comportamiento común
class ActividadBienestar {

  final String nombre;
  final int duracionMinutos;

  ActividadBienestar(
    this.nombre,
    this.duracionMinutos,
  );

  // Método que las subclases especializarán
  String beneficio() => 'Bienestar general';

  // Método común
  void presentarse() {
    print(
      'Actividad: $nombre, duración: $duracionMinutos min, beneficio: ${beneficio()}',
    );
  }
}

// HERENCIA: Meditación y Respiración reutilizan ActividadBienestar

class Meditacion extends ActividadBienestar {

  Meditacion(
    super.nombre,
    super.duracionMinutos,
  );

  @override
  String beneficio() => 'Reduce el estrés y mejora la concentración';

  void iniciarMeditacion() {
    print('$nombre inicia una sesión de meditación 🧘');
  }
}

class RespiracionProfunda extends ActividadBienestar {

  RespiracionProfunda(
    super.nombre,
    super.duracionMinutos,
  );

  @override
  String beneficio() => 'Ayuda a controlar la ansiedad';

  void comenzarEjercicio() {
    print('$nombre inicia ejercicios de respiración 🌬️');
  }
}

void main() {

  final meditacion = Meditacion(
    'Meditación Guiada',
    15,
  );

  final respiracion = RespiracionProfunda(
    'Respiración Profunda',
    10,
  );

  meditacion.presentarse();

  respiracion.presentarse();

  meditacion.iniciarMeditacion();

  respiracion.comenzarEjercicio();
}