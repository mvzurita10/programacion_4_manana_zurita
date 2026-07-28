import 'package:flutter/material.dart';

// Este archivo tenía el mismo contenido que avatar_badge originalmente.
// Lo adaptaremos para que sea un espaciador personalizado de respiración
class CustomizedSizeBoxMp extends StatelessWidget {
  final double height;
  final String mensaje;

  const CustomizedSizeBoxMp({
    super.key,
    required this.height,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Text(
          mensaje,
          style: TextStyle(
            color: Colors.teal.shade300,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
