import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/pantalla_metricas_mp.dart';
import 'screens/pantalla_dashboard_mp.dart';

const int paso = 5;

final contadorProvider = StateProvider<int>((ref) => 1);

void main() {
  runApp(const ProviderScope(child: AppBienestar()));
}

class AppBienestar extends StatelessWidget {
  const AppBienestar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        // Pantallas simuladas de los pasos intermedios, para mantener la lógica original pero adaptada
        2 => const Scaffold(body: Center(child: Text('Diario con NotifierProvider'))),
        3 => const Scaffold(body: Center(child: Text('Búsqueda Filtrada'))),
        4 => const PantallaMetricasMp(),
        5 => const PantallaDashboardMp(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

class _Paso1 extends ConsumerWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(contadorProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Respiraciones Guiadas'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$count', style: Theme.of(context).textTheme.displayLarge?.copyWith(color: cs.primary)),
            const Text('ciclos completados', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => ref.read(contadorProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'rem',
            onPressed: () {
              if (ref.read(contadorProvider) > 0) {
                ref.read(contadorProvider.notifier).state--;
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}