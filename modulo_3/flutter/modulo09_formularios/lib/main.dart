// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/formulario_servidor_mp.dart';
import 'models/servidor_ssh_mp.dart';
import 'widgets/fila_servidor_mp.dart';
import 'screens/pantalla_servidores_mp.dart';
import 'screens/pantalla_busqueda_mp.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaServidoresMp(),
    5 => const PantallaBusquedaMp(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 — vive en main.dart ────────────────────────────────────────
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nuevo Registro Emocional'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioServidorMp(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Guardado: ${datos['emocion']} — Intensidad ${datos['intensidad']}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final _registros = [
    RegistroEmocional(id:'1', emocion:'Ansiedad', intensidad:8, desencadenante:'Trabajo', pensamiento:'Tengo demasiadas tareas pendientes', tecnicaAplicada:true, favorito:true),
    RegistroEmocional(id:'2', emocion:'Tristeza', intensidad:5, desencadenante:'Personal', pensamiento:'Extraño a mi familia', tecnicaAplicada:false),
    RegistroEmocional(id:'3', emocion:'Alegría',  intensidad:9, desencadenante:'Social', pensamiento:'Buena salida con amigos', tecnicaAplicada:false),
    RegistroEmocional(id:'4', emocion:'Enojo',    intensidad:7, desencadenante:'Finanzas', pensamiento:'Gastos imprevistos', tecnicaAplicada:true),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Diario Emocional (${_registros.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _registros.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit_note, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin registros en el diario',
                      style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _registros.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidorMp(
                registro:   _registros[i],
                onFavorito: () => setState(() =>
                    _registros[i].favorito = !_registros[i].favorito),
                onEliminar: () => setState(() => _registros.removeAt(i)),
              ),
            ),
    );
  }
}

class _Paso1State extends State<_Paso1> {
  final _ctrlPensamiento = TextEditingController();
  final _ctrlDesencadenante = TextEditingController();
  final _ctrlIntensidad   = TextEditingController(text: '5');
  final _focusDesencadenante = FocusNode();
  final _focusIntensidad  = FocusNode();

  @override
  void dispose() {
    _ctrlPensamiento.dispose();
    _ctrlDesencadenante.dispose();
    _ctrlIntensidad.dispose();
    _focusDesencadenante.dispose();
    _focusIntensidad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Registro Rápido'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlPensamiento,
              decoration:      const InputDecoration(
                labelText:  'Pensamiento Principal',
                hintText:   'Siento presión por la entrega...',
                prefixIcon: Icon(Icons.psychology),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusDesencadenante.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlDesencadenante,
              focusNode:       _focusDesencadenante,
              decoration:      const InputDecoration(
                labelText:  'Desencadenante',
                hintText:   'Trabajo',
                prefixIcon: Icon(Icons.bolt),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusIntensidad.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlIntensidad,
              focusNode:   _focusIntensidad,
              decoration:  const InputDecoration(
                labelText:  'Intensidad (1-10)',
                prefixIcon: Icon(Icons.monitor_heart),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Registrando: ${_ctrlPensamiento.text} '
                      '(Intensidad: ${_ctrlIntensidad.text})',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.save),
              label: const Text('Guardar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlPensamiento.clear();
                _ctrlDesencadenante.clear();
                _ctrlIntensidad.text = '5';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}