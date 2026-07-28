import 'package:flutter/material.dart';
import '../models/servidor_ssh_mp.dart';
import '../widgets/fila_servidor_mp.dart';
import '../widgets/tarjeta_servidor_grid_mp.dart';

class PantallaServidoresMp extends StatefulWidget {
  const PantallaServidoresMp({super.key});
  @override
  State<PantallaServidoresMp> createState() => _PantallaServidoresMpState();
}

class _PantallaServidoresMpState extends State<PantallaServidoresMp> {
  final _registros = [
    RegistroEmocional(id:'1', emocion:'Ansiedad', intensidad:8, desencadenante:'Trabajo', pensamiento:'Tengo demasiadas tareas pendientes', tecnicaAplicada:true, favorito:true),
    RegistroEmocional(id:'2', emocion:'Tristeza', intensidad:5, desencadenante:'Personal', pensamiento:'Extraño a mi familia', tecnicaAplicada:false),
    RegistroEmocional(id:'3', emocion:'Alegría',  intensidad:9, desencadenante:'Social', pensamiento:'Buena salida con amigos', tecnicaAplicada:false),
    RegistroEmocional(id:'4', emocion:'Enojo',    intensidad:7, desencadenante:'Finanzas', pensamiento:'Gastos imprevistos', tecnicaAplicada:true),
  ];

  bool _modoGrid = false;

  void _toggleFavorito(int i) =>
      setState(() => _registros[i].favorito = !_registros[i].favorito);

  void _eliminar(int i) => setState(() => _registros.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Diario Emocional (${_registros.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 0.9, // Ajustado para que el texto encaje mejor
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _registros.length,
              itemBuilder: (ctx, i) => TarjetaServidorGridMp(
                registro:   _registros[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _registros.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidorMp(
                registro:   _registros[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}
