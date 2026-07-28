import 'package:flutter/material.dart';
import '../models/servidor_ssh_mp.dart';
import '../widgets/fila_servidor_mp.dart';
import '../widgets/tarjeta_servidor_grid_mp.dart';

class PantallaBusquedaMp extends StatefulWidget {
  const PantallaBusquedaMp({super.key});
  @override
  State<PantallaBusquedaMp> createState() => _PantallaBusquedaMpState();
}

class _PantallaBusquedaMpState extends State<PantallaBusquedaMp> {
  final _registros = [
    RegistroEmocional(id:'1', emocion:'Ansiedad', intensidad:8, desencadenante:'Trabajo', pensamiento:'Tengo demasiadas tareas pendientes', tecnicaAplicada:true, favorito:true),
    RegistroEmocional(id:'2', emocion:'Tristeza', intensidad:5, desencadenante:'Personal', pensamiento:'Extraño a mi familia', tecnicaAplicada:false),
    RegistroEmocional(id:'3', emocion:'Alegría',  intensidad:9, desencadenante:'Social', pensamiento:'Buena salida con amigos', tecnicaAplicada:false),
    RegistroEmocional(id:'4', emocion:'Enojo',    intensidad:7, desencadenante:'Finanzas', pensamiento:'Gastos imprevistos', tecnicaAplicada:true),
  ];

  String _busqueda = '';
  bool   _modoGrid = false;

  List<RegistroEmocional> get _filtrados => _registros
      .where((s) =>
          s.emocion.toLowerCase().contains(_busqueda.toLowerCase()) ||
          s.desencadenante.toLowerCase().contains(_busqueda.toLowerCase()) ||
          s.pensamiento.toLowerCase().contains(_busqueda.toLowerCase()))
      .toList();

  void _toggleFavorito(RegistroEmocional s) =>
      setState(() => s.favorito = !s.favorito);

  void _eliminar(RegistroEmocional s) =>
      setState(() => _registros.removeWhere((x) => x.id == s.id));

  @override
  Widget build(BuildContext context) {
    final cs       = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Buscar en el Diario (${_registros.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:      Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip:   _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por emoción, pensamiento o desencadenante...',
              leading:  const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon:      const Icon(Icons.clear),
                        onPressed: () => setState(() => _busqueda = ''),
                      ),
                    ]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),

          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off,
                            size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text(
                          'Sin resultados para "$_busqueda"',
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => setState(() => _busqueda = ''),
                          child: const Text('Limpiar búsqueda'),
                        ),
                      ],
                    ),
                  )
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:   2,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 8,
                          mainAxisSpacing:  8,
                        ),
                        itemCount:   filtrados.length,
                        itemBuilder: (ctx, i) => TarjetaServidorGridMp(
                          registro:   filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount:        filtrados.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => FilaServidorMp(
                          registro:   filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
