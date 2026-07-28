import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistroEmocionalMock {
  final String id;
  final String emocion;
  final int intensidad;
  final String desencadenante;
  final String pensamiento;
  final String analisisCognitivo;

  RegistroEmocionalMock({
    required this.id, required this.emocion, required this.intensidad, 
    required this.desencadenante, required this.pensamiento, required this.analisisCognitivo
  });
}

final registrosSimulados = [
  RegistroEmocionalMock(
    id: '1', emocion: 'Ansiedad', intensidad: 8, desencadenante: 'Trabajo', 
    pensamiento: 'Siento que no podré terminar a tiempo...', 
    analisisCognitivo: 'Distorsión: Pensamiento catastrófico.'
  ),
];

class PantallaDetalleMp extends StatelessWidget {
  final String id;

  const PantallaDetalleMp({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final srv = registrosSimulados.where((s) => s.id == id).firstOrNull;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Análisis: ${srv?.emocion ?? id}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: srv == null
          ? Center(child: Text('Registro $id no encontrado'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Fila('Emoción', srv.emocion),
                  _Fila('Intensidad', '${srv.intensidad} / 10'),
                  _Fila('Origen', srv.desencadenante),
                  const SizedBox(height: 16),
                  Text('Pensamiento:', style: TextStyle(color: cs.primary, fontWeight: FontWeight.bold)),
                  Text('"${srv.pensamiento}"', style: const TextStyle(fontStyle: FontStyle.italic)),
                  const SizedBox(height: 16),
                  Text('Análisis Terapéutico:', style: TextStyle(color: cs.primary, fontWeight: FontWeight.bold)),
                  Text(srv.analisisCognitivo, style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 24),
                  Row(children: [
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon:  const Icon(Icons.arrow_back),
                      label: const Text('Volver al Historial'),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}

class _Fila extends StatelessWidget {
  final String label;
  final String valor;
  const _Fila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        SizedBox(
          width: 85,
          child: Text(label,
              style: TextStyle(color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600, fontSize: 13)),
        ),
        Expanded(child: Text(valor, style: const TextStyle(fontSize: 15))),
      ]),
    );
  }
}
