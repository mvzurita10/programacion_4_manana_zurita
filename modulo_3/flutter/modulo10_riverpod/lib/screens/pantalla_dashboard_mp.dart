import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pantalla_metricas_mp.dart';
// Para el paso 5, idealmente importarías la pantalla de lista/historial que en Riverpod suele 
// construirse con los Providers. Como no me han dado una pantalla específica para integrar en dashboard,
// crearé un placeholder rápido o importaré la de métricas nuevamente (o si existe 'pantalla_servidores_mp.dart', la usaríamos).
// Para cumplir el plan con Riverpod, hacemos el dashboard simple:

final indiceTabProvider = StateProvider<int>((ref) => 0);

class PantallaDashboardMp extends ConsumerWidget {
  const PantallaDashboardMp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indice = ref.watch(indiceTabProvider);

    return Scaffold(
      body: switch (indice) {
        0 => const PantallaMetricasMp(), // Idealmente la lista del diario
        1 => const PantallaMetricasMp(),
        _ => const PantallaMetricasMp(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex:         indice,
        onDestinationSelected: (i) =>
            ref.read(indiceTabProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label:        'Mi Diario',
          ),
          NavigationDestination(
            icon:         Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights),
            label:        'Estadísticas',
          ),
        ],
      ),
    );
  }
}
