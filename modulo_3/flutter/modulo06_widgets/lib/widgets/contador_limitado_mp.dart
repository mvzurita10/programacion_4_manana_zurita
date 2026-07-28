import 'package:flutter/material.dart';

class ContadorLimitadoMp extends StatefulWidget {
  final String       etiqueta;
  final int          limite;
  final Color        color;
  final VoidCallback? onLimite;

  const ContadorLimitadoMp({
    super.key,
    required this.etiqueta,
    this.limite  = 5,
    this.color   = Colors.teal,
    this.onLimite,
  });

  @override
  State<ContadorLimitadoMp> createState() => _ContadorLimitadoMpState();
}

class _ContadorLimitadoMpState extends State<ContadorLimitadoMp> {
  int _valor = 0;

  void _incrementar() {
    if (_valor >= widget.limite) return;
    setState(() => _valor++);
    if (_valor == widget.limite) {
      widget.onLimite?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final enLimite  = _valor >= widget.limite;
    final progreso  = _valor / widget.limite;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.etiqueta,
            style: TextStyle(color: widget.color, fontWeight: FontWeight.w600)),

        const SizedBox(height: 4),

        LinearProgressIndicator(
          value:           progreso,
          color:           enLimite ? Colors.lightGreen : widget.color,
          backgroundColor: widget.color.withOpacity(0.15),
        ),

        const SizedBox(height: 4),

        Text(
          '$_valor / ${widget.limite}',
          style: TextStyle(
            fontSize:   28,
            fontWeight: FontWeight.bold,
            color:      enLimite ? Colors.lightGreen : widget.color,
          ),
        ),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: enLimite ? null : _incrementar,
              icon: const Icon(Icons.self_improvement, size: 18),
              label: const Text('Registrar Sesión'),
              style: FilledButton.styleFrom(backgroundColor: widget.color),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() => _valor = 0),
              child: const Text('Reiniciar'),
            ),
          ],
        ),

        if (enLimite)
          Text('¡Meta diaria de relajación alcanzada!',
              style: TextStyle(fontSize: 12, color: Colors.green.shade700, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
