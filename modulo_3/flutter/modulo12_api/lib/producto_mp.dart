import 'producto_dto_mp.dart';

class FraseRelajacion {
  final String texto;
  final String autor;

  FraseRelajacion({required this.texto, required this.autor});

  factory FraseRelajacion.fromDTO(FraseDTO dto) {
    return FraseRelajacion(
      texto: dto.content,
      autor: dto.author,
    );
  }
}
