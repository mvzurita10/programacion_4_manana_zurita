import 'package:flutter/material.dart';

class FilaEstadoMp extends StatelessWidget {
  final String emocion;
  final String detalle;
  final bool   estadoPositivo;

  const FilaEstadoMp({
    super.key,
    required this.emocion,
    required this.detalle,
    required this.estadoPositivo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Ícono de estado
          Icon(
            estadoPositivo ? Icons.sentiment_satisfied_alt : Icons.sentiment_dissatisfied,
            color: estadoPositivo ? Colors.green : Colors.orange,
            size:  24,
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:       MainAxisSize.min,
              children: [
                Text(emocion,
                    style:    const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    overflow: TextOverflow.ellipsis),
                Text(detalle,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Chip de estado
          Container(
            padding:    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color:        (estadoPositivo ? Colors.green : Colors.orange).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              estadoPositivo ? 'Calma' : 'Alerta',
              style: TextStyle(
                fontSize:   11,
                color:      estadoPositivo ? Colors.green.shade700 : Colors.orange.shade800,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
