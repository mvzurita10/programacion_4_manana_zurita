import 'package:flutter/material.dart';
import '../models/servidor_ssh_mp.dart';

class FilaServidorMp extends StatelessWidget {
  final RegistroEmocional registro;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaServidorMp({
    super.key,
    required this.registro,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Color colorEmocion;
    if (registro.intensidad >= 8) {
      colorEmocion = Colors.deepOrange;
    } else if (registro.intensidad >= 5) {
      colorEmocion = Colors.orange;
    } else {
      colorEmocion = Colors.teal;
    }

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: colorEmocion.withOpacity(0.2),
        child: Icon(
          Icons.mood,
          color: colorEmocion,
        ),
      ),
      title: Text(
        '${registro.emocion} (Intensidad: ${registro.intensidad}/10)',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        'Desencadenante: ${registro.desencadenante}\n"${registro.pensamiento}"',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      isThreeLine: true,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              registro.favorito ? Icons.favorite : Icons.favorite_border,
              color: registro.favorito ? Colors.pink : cs.outline,
            ),
            onPressed:     onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip:       registro.favorito ? 'Quitar destacado' : 'Destacar registro',
          ),
          IconButton(
            icon:          Icon(Icons.delete_outline, color: cs.error),
            onPressed:     onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip:       'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
