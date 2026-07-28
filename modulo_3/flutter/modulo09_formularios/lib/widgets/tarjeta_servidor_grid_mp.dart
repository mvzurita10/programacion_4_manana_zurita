import 'package:flutter/material.dart';
import '../models/servidor_ssh_mp.dart';

class TarjetaServidorGridMp extends StatelessWidget {
  final RegistroEmocional registro;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaServidorGridMp({
    super.key,
    required this.registro,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    Color colorEmocion;
    if (registro.intensidad >= 8) {
      colorEmocion = Colors.deepOrange;
    } else if (registro.intensidad >= 5) {
      colorEmocion = Colors.orange;
    } else {
      colorEmocion = Colors.teal;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorEmocion.withOpacity(0.3), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(
                Icons.mood,
                color: colorEmocion,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  registro.emocion,
                  style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: colorEmocion),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  registro.favorito ? Icons.favorite : Icons.favorite_border,
                  color: registro.favorito ? Colors.pink : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 8),

            Text(
              '"${registro.pensamiento}"',
              style: text.bodySmall?.copyWith(fontStyle: FontStyle.italic),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
            const Spacer(),

            Row(children: [
              if (registro.tecnicaAplicada)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.self_improvement, size: 14, color: Colors.teal),
                ),
              Expanded(
                child: Text(
                  registro.desencadenante,
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Nivel: ${registro.intensidad}',
                style: text.labelSmall?.copyWith(color: colorEmocion, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
