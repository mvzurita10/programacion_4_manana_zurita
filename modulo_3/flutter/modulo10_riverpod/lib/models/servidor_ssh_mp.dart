class RegistroEmocional {
  final String id;
  final String emocion;
  final int    intensidad;
  final String desencadenante;
  final String pensamiento;
  final bool   tecnicaAplicada;
  bool         favorito;

  RegistroEmocional({
    required this.id,
    required this.emocion,
    required this.intensidad,
    required this.desencadenante,
    required this.pensamiento,
    required this.tecnicaAplicada,
    this.favorito = false,
  });
}
