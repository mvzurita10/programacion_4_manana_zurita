import 'package:flutter/material.dart';

class PantallaContextoMp extends StatelessWidget {
  const PantallaContextoMp({super.key});

  @override
  Widget build(BuildContext context) {
    final tema    = Theme.of(context);
    final colores = tema.colorScheme;

    final tamanio   = MediaQuery.sizeOf(context);
    final esMovil   = tamanio.width < 600;
    final esRetrato = MediaQuery.orientationOf(context) == Orientation.portrait;

    return Scaffold(
      backgroundColor: colores.surface,
      appBar: AppBar(
        backgroundColor: colores.primaryContainer,
        foregroundColor: colores.onPrimaryContainer,
        title: Text(
          'Dashboard de Bienestar (${esMovil ? "Móvil" : "Tablet"})',
          style: tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Seccion(
            titulo: 'Recomendación Personalizada',
            items: [
              esRetrato 
                ? 'Modo retrato: Ideal para realizar registros rápidos en el diario emocional.'
                : 'Modo paisaje (Lectura amplia): Perfecto para leer reflexiones profundas y meditar.',
              'Dispositivo: ${esMovil ? "Teléfono" : "Tablet o Escritorio"}',
            ],
          ),
          const SizedBox(height: 16),

          _Seccion(titulo: 'Paleta Terapéutica', items: []),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              _ChipColor(nombre: 'Tranquilidad',     color: colores.primary),
              _ChipColor(nombre: 'Calma',            color: colores.primaryContainer),
              _ChipColor(nombre: 'Serenidad',        color: colores.secondary),
              _ChipColor(nombre: 'Fondo suave',      color: colores.surface),
              _ChipColor(nombre: 'Alerta/Ansiedad',  color: colores.error),
            ],
          ),
          const SizedBox(height: 16),

          _Seccion(titulo: 'Tipografía de Bienestar', items: []),
          Text('Titular Grande',  style: tema.textTheme.displaySmall),
          Text('Subtítulo Medio', style: tema.textTheme.headlineMedium),
          Text('Cuerpo de lectura relajante', style: tema.textTheme.bodyLarge),
          Text('Notas pequeñas de pie de página', style: tema.textTheme.labelSmall),
        ],
      ),
    );
  }
}

class _Seccion extends StatelessWidget {
  final String       titulo;
  final List<String> items;
  const _Seccion({required this.titulo, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
        const Divider(),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(item, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15)),
          ),
      ],
    );
  }
}

class _ChipColor extends StatelessWidget {
  final String nombre;
  final Color  color;
  const _ChipColor({required this.nombre, required this.color});

  @override
  Widget build(BuildContext context) {
    final luminancia = color.computeLuminance();
    final textoColor = luminancia > 0.4 ? Colors.black87 : Colors.white;
    return Container(
      padding:    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Text(nombre, style: TextStyle(color: textoColor, fontSize: 13, fontWeight: FontWeight.w600)),
    );
  }
}
