void main() {
  // Tipo non-nullable — NUNCA puede ser null.
  String usuario = 'Miky';
  print('Usuario: $usuario');

  // Tipo nullable — puede ser null (usando ?).
  String? emocionActual = null;
  emocionActual = 'Felicidad';
  print('Emoción actual: $emocionActual');

  // Operadores de null safety
  String? tecnicaRecomendada;

  // ?. — safe call (acceso seguro a miembros si el objeto no es null).
  print('Longitud de técnica (null): ${tecnicaRecomendada?.length}');

  // ?? — operador de coalescencia nula (valor por defecto).
  String resultado = tecnicaRecomendada ?? 'No hay técnica recomendada';
  print('Resultado: $resultado');

  // ! — non-null assertion.
  // CORRECCIÓN: Se debe evitar usar "!" cuando la variable puede ser null.
  // En su lugar, usamos una verificación de seguridad o valor por defecto.
  String tecnicaSegura = tecnicaRecomendada ?? 'Técnica por defecto';
  print('Técnica segura: $tecnicaSegura');

  // Null check con if (promoción de tipo).
  // Al verificar != null, Dart permite acceder a las propiedades de la variable.
  if (emocionActual != null) {
    print(
      'La emoción actual es "$emocionActual" y tiene ${emocionActual.length} caracteres.',
    );
  }

  // late — inicialización diferida.
  // Se utiliza cuando sabemos que la variable se inicializará antes de ser leída.
  late String codigoSesion;
  codigoSesion = 'THERAPPY2026';
  print('Código de sesión: $codigoSesion');
}