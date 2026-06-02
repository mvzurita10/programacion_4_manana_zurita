// required → el parámetro es obligatorio
// sin required → es opcional (debe tener valor por defecto o ser nullable)

void configurarSesion({
  required String usuario,
  required String emocion,
  bool notificacionesActivas = true,
  int duracionMinutos = 15,
}) {

  final estadoNotificaciones =
      notificacionesActivas ? 'Activadas' : 'Desactivadas';

  print(
    'Sesión iniciada para $usuario '
    '(Emoción: $emocion, '
    'Duración: ${duracionMinutos} min, '
    'Notificaciones: $estadoNotificaciones)',
  );
}

void main() {

  // Los parámetros nombrados pueden enviarse en cualquier orden
  configurarSesion(
    usuario: 'Miky',
    emocion: 'Estrés',
    notificacionesActivas: false,
    duracionMinutos: 30,
  );

  // Solo los obligatorios
  configurarSesion(
    usuario: 'Andrea',
    emocion: 'Calma',
  );
}