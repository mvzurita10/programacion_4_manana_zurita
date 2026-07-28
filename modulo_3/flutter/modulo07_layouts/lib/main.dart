// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/tarjeta_log_mp.dart';
import 'widgets/fila_estado_mp.dart';
import 'widgets/avatar_badge_mp.dart';
import 'widgets/customized_sized_box_mp.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => _paso1(),
    2 => Scaffold(
      appBar: AppBar(title: const Text('Historial de Bienestar')),
      body: ListView(
        children: [
          TarjetaLogMp(tipo: 'CRISIS', contexto: 'Ansiedad Social',
              mensaje:   'Me sentí muy abrumado en la reunión.',
              timestamp: DateTime.now()),
          TarjetaLogMp(tipo: 'TECNICA',  contexto: 'Respiración 4-7-8',
              mensaje:   'Completé 5 ciclos. Me siento más tranquilo.',
              timestamp: DateTime.now().subtract(const Duration(minutes: 30))),
          TarjetaLogMp(tipo: 'LOGRO',  contexto: 'Meditación',
              mensaje:   'Racha de 3 días meditando.',
              timestamp: DateTime.now().subtract(const Duration(hours: 5))),
          TarjetaLogMp(tipo: 'REGISTRO', contexto: 'Diario general',
              mensaje:   'Hoy me desperté con buen ánimo.',
              timestamp: DateTime.now().subtract(const Duration(hours: 8))),
        ],
      ),
    ),
    3 => Scaffold(
      appBar: AppBar(title: const Text('Estado Actual')),
      body: const Column(
        children: [
          FilaEstadoMp(emocion: 'Calma',   detalle: 'Relajado tras meditar',          estadoPositivo: true),
          Divider(height: 1),
          FilaEstadoMp(emocion: 'Alegría',    detalle: 'Nivel 8/10',           estadoPositivo: true),
          Divider(height: 1),
          FilaEstadoMp(emocion: 'Ansiedad', detalle: 'Nivel 7/10 - Nervioso por examen', estadoPositivo: false),
          Divider(height: 1),
          FilaEstadoMp(emocion: 'Gratitud',
                     detalle: 'Por mi familia', estadoPositivo: true),
          FilaEstadoMp(emocion: 'Enojo',
                     detalle: 'Discusión en el trabajo', estadoPositivo: false),
        ],
      ),
    ),
    4 => Scaffold(
      appBar: AppBar(title: const Text('Perfiles de Pacientes / Usuarios')),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarBadgeMp(iniciales: 'mz', tareasPendientes: 2,  estadoCalma: true),
            SizedBox(width: 24),
            AvatarBadgeMp(iniciales: 'an',  tareasPendientes: 0,  estadoCalma: true),
            SizedBox(width: 24),
            AvatarBadgeMp(iniciales: 'jr', tareasPendientes: 0,  estadoCalma: false),
            SizedBox(width: 24),
            AvatarBadgeMp(iniciales: 'lm',  tareasPendientes: 5, estadoCalma: false),
          ],
        ),
      ),
    ),
    5 => Scaffold(
      appBar: AppBar(title: const Text('Técnicas de Relajación')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // SizedBox — espaciado fijo
          const Text('Espaciado con SizedBox', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          const CustomizedSizeBoxMp(height: 60, mensaje: 'Inhala profundamente...'),
          const SizedBox(height: 16),          
          const CustomizedSizeBoxMp(height: 60, mensaje: 'Exhala lentamente...'),

          const Divider(height: 32),

          // Padding — espacio alrededor de un hijo
          const Text('Contenedor de Ejercicio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Container(
            color: Colors.teal.shade50,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child:   Text('Técnica de la Burbuja: Imagina que estás dentro de una burbuja de paz que te protege.'),
            ),
          ),

          const Divider(height: 32),

          // Align — posicionar dentro del espacio disponible
          const Text('Acciones Rápidas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,
            child: FloatingActionButton.extended(
              onPressed: null,
              icon: Icon(Icons.favorite),
              label: Text('Botón SOS'),
              backgroundColor: Colors.deepOrange,
            )
          ),

          const Divider(height: 32),

          // Wrap — flujo automático de elementos
          const Text('Emociones Identificadas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Wrap(
            spacing:    8,
            runSpacing: 8,
            children: ['Ansiedad', 'Estrés', 'Alegría', 'Paz', 'Cansancio', 'Gratitud', 'Enojo']
                .map((t) => Chip(
                  label: Text(t),
                  backgroundColor: Colors.teal.shade50,
                  side: BorderSide(color: Colors.teal.shade200),
                ))
                .toList(),
          ),
        ],
      ),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 — Container (vive aquí en main.dart) ─────────────────────
Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width:   double.infinity,
      height:  80,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color:        Colors.teal.shade50,
        borderRadius: BorderRadius.circular(16),
        border:       Border(left: BorderSide(color: Colors.teal, width: 6)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset:     const Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.self_improvement, color: Colors.teal, size: 32),
          SizedBox(width: 16),
          Text('Respiración Guiada',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.teal)),
        ],
      ),
    ),
  ),
);