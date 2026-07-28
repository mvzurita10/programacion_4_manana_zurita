import 'package:flutter/material.dart';

class PantallaTemaMp extends StatelessWidget {
  final ThemeMode themeMode;
  final void Function(ThemeMode) onToggle;

  const PantallaTemaMp({
    super.key,
    required this.themeMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Personaliza tu Espacio'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              'Estilo Visual',
              style: text.labelLarge?.copyWith(color: cs.primary),
            ),
          ),
          ...[
            (label: 'Automático (Sistema)', mode: ThemeMode.system, icon: Icons.brightness_auto),
            (label: 'Día (Claro)',   mode: ThemeMode.light,  icon: Icons.light_mode),
            (label: 'Noche (Oscuro)',  mode: ThemeMode.dark,   icon: Icons.dark_mode),
          ].map((opcion) => RadioListTile<ThemeMode>(
            title:     Text(opcion.label),
            secondary: Icon(opcion.icon),
            value:     opcion.mode,
            groupValue: themeMode,
            onChanged:  (v) => onToggle(v!),
          )),

          const Divider(),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Colores Terapéuticos (Teal)',
                        style: text.labelLarge?.copyWith(color: cs.primary)),
                    const SizedBox(height: 12),
                    Row(children: [
                      _CirculoPreview(color: cs.primary,                label: '1'),
                      _CirculoPreview(color: cs.secondary,              label: '2'),
                      _CirculoPreview(color: cs.tertiary,               label: '3'),
                      _CirculoPreview(color: cs.surfaceContainerHighest, label: 'F'),
                    ]),
                    const SizedBox(height: 16),
                    Row(children: [
                      FilledButton.icon(
                        onPressed: () {},
                        icon:  const Icon(Icons.spa, size: 16),
                        label: const Text('Meditar'),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(onPressed: () {}, child: const Text('Diario')),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CirculoPreview extends StatelessWidget {
  final Color  color;
  final String label;
  const _CirculoPreview({required this.color, required this.label});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 8),
    child: CircleAvatar(
      radius:          16,
      backgroundColor: color,
      child: Text(
        label,
        style: TextStyle(
          color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          fontSize:   10,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
