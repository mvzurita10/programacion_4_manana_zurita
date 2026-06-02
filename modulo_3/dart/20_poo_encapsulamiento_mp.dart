
class PerfilEmocional {

  final String usuario;

  double _nivelBienestar; // privado

  PerfilEmocional(
    this.usuario,
    double bienestarInicial,
  ) : _nivelBienestar = bienestarInicial;

  // Getter
  double get nivelBienestar => _nivelBienestar;

  // Métodos para modificar el bienestar
  void realizarActividad(double mejora) {

    if (mejora <= 0) {
      throw ArgumentError(
        'La mejora debe ser mayor que cero',
      );
    }

    _nivelBienestar += mejora;

    if (_nivelBienestar > 10) {
      _nivelBienestar = 10;
    }

    print(
      'Actividad completada (+$mejora). '
      'Nuevo nivel de bienestar: $_nivelBienestar',
    );
  }

  void registrarEstres(double reduccion) {

    if (reduccion <= 0) {
      throw ArgumentError(
        'El valor debe ser mayor que cero',
      );
    }

    _nivelBienestar -= reduccion;

    if (_nivelBienestar < 0) {
      _nivelBienestar = 0;
    }

    print(
      'Nivel emocional reducido (-$reduccion). '
      'Nuevo nivel de bienestar: $_nivelBienestar',
    );
  }
}

void main() {

  final perfil = PerfilEmocional(
    'Miky',
    7.0,
  );

  perfil.realizarActividad(2.0);

  perfil.registrarEstres(1.5);

  print(perfil.nivelBienestar);

  // perfil._nivelBienestar = 10; // ERROR: privado
}