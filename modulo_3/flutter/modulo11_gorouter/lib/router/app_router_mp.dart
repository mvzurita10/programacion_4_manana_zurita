import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider_mp.dart';
import '../screens/pantalla_detalle_mp.dart';

// Screens simuladas para el flujo de bienestar
class PantallaInicioBienestar extends StatelessWidget {
  const PantallaInicioBienestar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienestar Mental')),
      body: Center(
        child: FilledButton(
          onPressed: () => context.go('/diario'),
          child: const Text('Ir a mi Diario'),
        ),
      ),
    );
  }
}

class PantallaLoginBienestar extends ConsumerWidget {
  const PantallaLoginBienestar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Acceso Privado')),
      body: Center(
        child: auth is Cargando
            ? const CircularProgressIndicator()
            : FilledButton(
                onPressed: () => ref.read(authProvider.notifier).login('usuario', 'paz123'),
                child: const Text('Iniciar Sesión (usuario/paz123)'),
              ),
      ),
    );
  }
}

class PantallaDiario extends StatelessWidget {
  const PantallaDiario({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial del Diario')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Ansiedad (8/10)'),
            subtitle: const Text('Trabajo'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.push('/diario/1'),
          ),
        ],
      ),
    );
  }
}

GoRouter appRouterBienestar(WidgetRef ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isAuth = authState is Autenticado;
      final isGoingToLogin = state.matchedLocation == '/login';
      final isGoingToPrivate = state.matchedLocation.startsWith('/diario');

      if (!isAuth && isGoingToPrivate) return '/login';
      if (isAuth && isGoingToLogin) return '/diario';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'inicio',
        builder: (context, state) => const PantallaInicioBienestar(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const PantallaLoginBienestar(),
      ),
      GoRoute(
        path: '/diario',
        name: 'diario',
        builder: (context, state) => const PantallaDiario(),
        routes: [
          GoRoute(
            path: ':id',
            name: 'diario_detalle',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return PantallaDetalleMp(id: id);
            },
          ),
        ],
      ),
    ],
  );
}
