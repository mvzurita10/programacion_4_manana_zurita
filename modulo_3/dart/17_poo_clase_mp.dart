
class UsuarioTherAppy {

  // 1. Propiedades
  final String id;
  final String nombre;
  String emocionActual;

  bool _sesionActiva = false;

  // 2. Constructor
  UsuarioTherAppy({
    required this.id,
    required this.nombre,
    required this.emocionActual,
  });

  // 3. Getters
  bool get sesionActiva => _sesionActiva;

  String get estadoSesion =>
      _sesionActiva ? 'activa' : 'inactiva';

  // 4. Setter
  set cambiarEstadoSesion(bool valor) {
    _sesionActiva = valor;

    print(
      '$nombre: sesión ${valor ? "iniciada" : "finalizada"}',
    );
  }

  // 5. Métodos
  void iniciarSesion() {
    _sesionActiva = true;

    print(
      '$nombre ha iniciado una sesión de bienestar emocional',
    );
  }

  void finalizarSesion() {
    _sesionActiva = false;

    print(
      '$nombre ha finalizado su sesión',
    );
  }

  String resumen() =>
      'ID: $id | Usuario: $nombre | Emoción: $emocionActual | Estado: $estadoSesion';

  // 6. toString
  @override
  String toString() =>
      'UsuarioTherAppy($nombre, $emocionActual, $estadoSesion)';
}

void main() {

  // Crear instancia
  final usuario = UsuarioTherAppy(
    id: 'USR-001',
    nombre: 'Miky',
    emocionActual: 'Calma',
  );

  // Utilizar métodos y propiedades
  usuario.iniciarSesion();

  print(usuario.estadoSesion);

  print(usuario.resumen());

  print(usuario);

  usuario.cambiarEstadoSesion = false;

  print(usuario.sesionActiva);
}