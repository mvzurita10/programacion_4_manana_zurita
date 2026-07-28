import 'package:flutter/material.dart';
import 'pantalla_paso1_mp.dart';
import 'pantalla_paso2_mp.dart';
import 'pantalla_paso3_mp.dart';

const int paso = 3;

void main() => runApp(const AppBienestarApi());

class AppBienestarApi extends StatelessWidget {
  const AppBienestarApi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const PantallaPaso1Mp(),
        2 => const PantallaPaso2Mp(),
        3 => const PantallaPaso3Mp(),
        _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}