import 'package:flutter/material.dart';

class AvatarBadgeMp extends StatelessWidget {
  final String iniciales;
  final int    tareasPendientes;
  final bool   estadoCalma;

  const AvatarBadgeMp({
    super.key,
    required this.iniciales,
    required this.tareasPendientes,
    required this.estadoCalma,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Avatar — capa inferior
        Container(
          width:  56,
          height: 56,
          decoration: BoxDecoration(
            color:        estadoCalma ? Colors.teal.shade50 : Colors.deepOrange.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              iniciales.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:   18,
                color:      estadoCalma ? Colors.teal : Colors.deepOrange,
              ),
            ),
          ),
        ),

        // Punto de estado emocional — esquina inferior derecha
        Positioned(
          bottom: 0, right: 0,
          child: Container(
            width:  14,
            height: 14,
            decoration: BoxDecoration(
              color:  estadoCalma ? Colors.green : Colors.red,
              shape:  BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),

        // Badge de tareas de bienestar — capa superior, solo si las hay
        if (tareasPendientes > 0)
          Positioned(
            top: -4, right: -4,
            child: Container(
              padding:     const EdgeInsets.all(4),
              decoration:  const BoxDecoration(color: Colors.indigo, shape: BoxShape.circle),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                tareasPendientes > 9 ? '9+' : '$tareasPendientes',
                style: const TextStyle(
                    color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
