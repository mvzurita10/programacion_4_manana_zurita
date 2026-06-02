void main() {

  String estadoEmocional = 'estres_alto';

  switch (estadoEmocional) {
    case 'feliz':
      print('😊 Usuario feliz');
    case 'calma':
      print('😌 Usuario en calma');
    case 'ansiedad':
      print('😟 Usuario con ansiedad');
    case 'estres_moderado':
      print('🟡 Estrés moderado');
    case 'estres_alto':
      print('🔴 Estrés alto');
    case 'agotamiento':
      print('🚨 Agotamiento emocional');
    default:
      print('Estado emocional desconocido');
  }

  estadoEmocional = 'estres_alto';

  String descripcion = switch (estadoEmocional) {
    'feliz' => 'Usuario con emociones positivas',
    'calma' => 'Estado emocional equilibrado',
    'ansiedad' => 'Se recomienda realizar ejercicios de respiración',
    'estres_moderado' => 'Se recomienda una pausa activa',
    'estres_alto' => 'Nivel elevado de estrés detectado',
    'agotamiento' => 'Necesita descanso y apoyo emocional',
    _ => 'Estado emocional no identificado',
  };

  print(descripcion);

  int nivelBienestar = 4;

  // Múltiples valores en una rama
  String categoriaBienestar = switch (nivelBienestar) {
    9 || 10 => 'Excelente bienestar',
    7 || 8 => 'Buen bienestar',
    5 || 6 => 'Bienestar moderado',
    3 || 4 => 'Bienestar bajo',
    1 || 2 => 'Bienestar crítico',
    _ => 'Valor inválido',
  };

  print(categoriaBienestar);

  // Guards — evaluación emocional
  double nivelEstres = 8.3;

  String alerta = switch (nivelEstres) {
    double e when e >= 9.0 =>
      '🚨 CRÍTICO — Se recomienda apoyo profesional',
    double e when e >= 7.0 =>
      '🔴 ESTRÉS ALTO — Realice ejercicios de relajación',
    double e when e >= 4.0 =>
      '🟡 ESTRÉS MODERADO — Tome un descanso',
    double e when e >= 1.0 =>
      '🟢 ESTADO ESTABLE',
    _ =>
      '⚪ SIN DATOS',
  };

  print(alerta);

  // Verificación de tipos con switch
  Object respuestaTherAppy = {
    'usuario': 'Miky',
    'emocion': 'Calma',
    'bienestar': 8.5
  };

  String resultado = switch (respuestaTherAppy) {

    Map<String, dynamic> m when m.containsKey('error') =>
      'Error: ${m['error']}',

    Map<String, dynamic> m =>
      'Usuario: ${m['usuario']} - Emoción: ${m['emocion']} - Bienestar: ${m['bienestar']}',

    List<dynamic> lista =>
      '${lista.length} actividades registradas',

    String texto =>
      'Mensaje recibido: $texto',

    _ =>
      'Respuesta desconocida',
  };

  print(resultado);
}