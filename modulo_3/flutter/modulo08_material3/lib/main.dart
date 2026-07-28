// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/pantalla_tema_mp.dart';
import 'screens/pantalla_appbar_mp.dart';
import 'widgets/catalogo_botones_mp.dart';
import 'screens/pantalla_navegacion_mp.dart';
import 'screens/pantalla_dialogs_mp.dart';

const int paso = 6;

void main() => runApp(const AppBienestar());

class AppBienestar extends StatefulWidget {
  const AppBienestar({super.key});
  @override
  State<AppBienestar> createState() => _AppBienestarState();
}

class _AppBienestarState extends State<AppBienestar> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    const seedColor = Colors.teal;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => PantallaTemaMp(
       themeMode: _themeMode,
       onToggle:  (mode) => setState(() => _themeMode = mode),
     ),
        3 => const PantallaAppBarMp(),
        4 => const CatalogoBotonesMp(),
        5 => const PantallaNavegacionMp(),
        6 => const PantallaDialogsMp(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

// ─── Paso 1 — vive en main.dart ────────────────────────────────────────
class _Paso1 extends StatelessWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Bienestar Mental'),
        backgroundColor: cs.tertiaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.favorite_outline), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.self_improvement, size: 96, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Toma un Respiro',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Estás en un lugar seguro',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon:  const Icon(Icons.play_arrow),
              label: const Text('Iniciar Relajación'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}