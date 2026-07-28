import 'package:flutter/material.dart';

class TarjetaLogMp extends StatelessWidget {
  final String   tipo;        // CRISIS, REGISTRO, LOGRO, TECNICA
  final String   contexto;
  final String   mensaje;
  final DateTime timestamp;

  const TarjetaLogMp({
    super.key,
    required this.tipo,
    required this.contexto,
    required this.mensaje,
    required this.timestamp,
  });

  Color get _colorTipo => switch (tipo) {
    'REGISTRO' => Colors.grey,
    'LOGRO'    => Colors.teal,
    'TECNICA'  => Colors.blue,
    'CRISIS'   => Colors.deepOrange,
    _          => Colors.grey,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:        _colorTipo.withOpacity(0.10),
        borderRadius: BorderRadius.circular(12),
        border:       Border(left: BorderSide(color: _colorTipo, width: 6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize:       MainAxisSize.max,
        children: [
          Row(
            children: [
              Container(
                padding:    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _colorTipo, borderRadius: BorderRadius.circular(6)),
                child: Text(tipo,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              Text(contexto,
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
              const Spacer(),
              Text(
                '${timestamp.hour.toString().padLeft(2, '0')}:'
                '${timestamp.minute.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(mensaje, style: TextStyle(fontSize: 14, color: Colors.grey.shade800, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
