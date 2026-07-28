import 'package:flutter/material.dart';
import 'widgets/catalogo_basicos_mp.dart';
import 'widgets/etiqueta_mp.dart';
import 'widgets/servicio_estado_mp.dart';
import 'widgets/contador_limitado_mp.dart';
import 'widgets/reloj_mp.dart';
import 'screens/pantalla_contexto_mp.dart';
import 'widgets/indicador.dart';


// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos.  │
// │  1  Paso 1   StatelessWidget mínimo                              │
// │  2  Paso 1b  Widgets básicos — catálogo                          │
// │  3  Paso 2   StatelessWidget con parámetros                      │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus       │
// │  5  Paso 3b  Parámetros en StatefulWidget                        │
// │  6  Paso 4   Ciclo de vida con Timer                             │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets                              │ 
// └──────────────────────────────────────────────────────────────────┘
const int paso = 8;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  Colors.teal,          // ← cambia aquí
      brightness: Brightness.light,     // ← Brightness.dark para modo oscuro
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicosMp(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            EtiquetaMp(texto: 'Calma',    color: Colors.green),
            EtiquetaMp(texto: 'Crisis',     color: Colors.red,    relleno: true),
            EtiquetaMp(texto: 'Ansiedad', color: Colors.orange),
            EtiquetaMp(texto: 'Alerta Alta',   color: Colors.deepOrange,    fontSize: 16, relleno: true),
            EtiquetaMp(texto: 'Neutro',      color: Colors.blueGrey,   fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstadoMp(nombre: 'Estado Emocional Actual'),
      ),
    ),
    5 => Scaffold(                               // Paso 3b
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitadoMp(
              etiqueta: 'Ejercicios de Respiración',
              limite:   3,
              color:    Colors.teal,
              onLimite: () => debugPrint('¡Meta de respiración alcanzada!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitadoMp(
              etiqueta: 'Reflexiones del Diario',
              limite:   5,
              color:    Colors.indigo,
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(                              // Paso 4
      appBar: AppBar(title: const Text('Temporizador de Respiración')),
      body: const Center(child: RelojMp()),
    ),
    7 => const PantallaContextoMp(),    // Paso 5 — ya tiene su propio Scaffold
    8 => Scaffold(                             // Paso 6
      body: Center(
        child: Wrap(
          spacing:    32,
          runSpacing: 24,
          alignment:  WrapAlignment.center,
          children: const [
            Indicador(label: 'Servidores activos', valor: '8',
                      color: Colors.green, icono: Icons.dns),
            Indicador(label: 'Alertas críticas',   valor: '2',
                      color: Colors.red,   icono: Icons.warning_amber,
                      subtitulo: 'Requieren atención'),
            Indicador(label: 'Tráfico',            valor: '4.2 GB',
                      color: Colors.indigo),
            Indicador(label: 'Uptime',             valor: '99.8%',
                      color: Colors.teal, subtitulo: 'Últimos 30 días'),
          ],
        ),
      ),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {   
    return const Text('La teoría del Big Bang es el modelo cosmológico más aceptado, el cual postula que el universo se originó hace aproximadamente 13.800 millones de años a partir de un punto infinitamente pequeño, caliente y denso. Este núcleo sufrió una rápida expansión y posterior enfriamiento, dando lugar a la creación del espacio, el tiempo y toda la materia.',
    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 4, color: Colors.lightGreen,
    shadows: [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))]),
    textAlign: TextAlign.left,
    overflow: TextOverflow.ellipsis,
    maxLines: 4
    );

  }
}