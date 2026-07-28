import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router/app_router_mp.dart';
import 'providers/auth_provider_mp.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AppBienestar(),
    ),
  );
}

class AppBienestar extends ConsumerWidget {
  const AppBienestar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchar el estado de autenticación
    ref.watch(authProvider); 
    
    // Configurar router con los guards de privacidad
    final router = appRouterBienestar(ref);

    return MaterialApp.router(
      title:        'Bienestar Mental',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
    );
  }
}