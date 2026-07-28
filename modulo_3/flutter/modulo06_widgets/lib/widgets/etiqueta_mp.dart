import 'package:flutter/material.dart';

class EtiquetaMp extends StatelessWidget {
  final String  texto;
  final Color   color;
  final double  fontSize;
  final bool    relleno;

  const EtiquetaMp({
    super.key,
    required this.texto,
    required this.color,
    this.fontSize = 13,
    this.relleno  = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:        color.withOpacity(relleno ? 0.4 : 0.15),
        border:       Border(bottom: BorderSide(color: color.withOpacity(0.8), width: 2)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:      color.withOpacity(0.1),
            blurRadius: 4,
            offset:     const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        texto,
        style: TextStyle(
          color:      color.withOpacity(0.9),
          fontWeight: FontWeight.bold,
          fontSize:   fontSize,
        ),
      ),
    );
  }
}
