import 'package:flutter/material.dart';

class CatalogoBotonesMp extends StatelessWidget {
  const CatalogoBotonesMp({super.key});

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Acciones de Bienestar'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Text('Técnicas de Emergencia',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () {},
            child: const Text('Comenzar Respiración 4-7-8'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('Escuchar Sonidos de la Naturaleza'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Escribir en el Diario'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Llamar a un Contacto de Confianza'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: const Text('Más información sobre ansiedad'),
          ),

          const Divider(height: 32),

          Text('Acciones Rápidas (Con Ícono)',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {},
            icon:  const Icon(Icons.favorite),
            label: const Text('Registrar Gratitud'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon:  const Icon(Icons.spa),
            label: const Text('Iniciar Meditación Corta'),
          ),

          const Divider(height: 32),

          Text('Modos Especiales',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: null,               // null = deshabilitado
            child: const Text('Bloqueado (No estás en Crisis)'),
          ),
          const SizedBox(height: 8),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
              minimumSize:     const Size(double.infinity, 48),
            ),
            onPressed: () {},
            child: const Text('BOTÓN DE PÁNICO (Línea de Ayuda)'),
          ),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(
              child: OutlinedButton(onPressed: () {}, child: const Text('Pausar Notificaciones')),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton(onPressed: () {}, child: const Text('Modo Silencio')),
            ),
          ]),
        ],
      ),
    );
  }
}
