
class SesionBienestar {

  final String usuario;
  final String emocion;
  final int duracionMinutos;
  final bool completada;

  // Constructor principal
  SesionBienestar({
    required this.usuario,
    required this.emocion,
    required this.duracionMinutos,
    this.completada = false,
  });

  // Constructor nombrado
  SesionBienestar.rapida()
      : usuario = 'Invitado',
        emocion = 'Calma',
        duracionMinutos = 5,
        completada = false;

  // Constructor nombrado
  SesionBienestar.recomendada({
    required this.usuario,
    required this.emocion,
  })
      : duracionMinutos = 15,
        completada = false;

  // Constructor factory
  factory SesionBienestar.desdeEstado(String estado) {

    switch (estado.toLowerCase()) {

      case 'estres':
        return SesionBienestar(
          usuario: 'Usuario',
          emocion: 'Estrés',
          duracionMinutos: 20,
        );

      case 'ansiedad':
        return SesionBienestar(
          usuario: 'Usuario',
          emocion: 'Ansiedad',
          duracionMinutos: 25,
        );

      default:
        return SesionBienestar(
          usuario: 'Usuario',
          emocion: 'Calma',
          duracionMinutos: 10,
        );
    }
  }

  @override
  String toString() =>
      'Sesión de $duracionMinutos min | Emoción: $emocion | Usuario: $usuario';
}

void main() {

  final s1 = SesionBienestar(
    usuario: 'Miky',
    emocion: 'Felicidad',
    duracionMinutos: 30,
  );

  final s2 = SesionBienestar.rapida();

  final s3 = SesionBienestar.recomendada(
    usuario: 'Miky',
    emocion: 'Estrés',
  );

  final s4 = SesionBienestar.desdeEstado(
    'ansiedad',
  );

  print(s1);
  print(s2);
  print(s3);
  print(s4);
}