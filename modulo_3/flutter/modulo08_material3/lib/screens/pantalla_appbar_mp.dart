import 'package:flutter/material.dart';

class PantallaAppBarMp extends StatelessWidget {
  const PantallaAppBarMp({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar — colapsa al hacer scroll
          SliverAppBar.large(
            title:           const Text('Mi Diario Emocional'),
            pinned:          true,
            backgroundColor: cs.primaryContainer,
            foregroundColor: cs.onPrimaryContainer,
            actions: [
              IconButton(
                icon:      const Icon(Icons.filter_list),
                onPressed: () {},
                tooltip:   'Filtrar',
              ),
              IconButton(
                icon:      const Icon(Icons.search),
                onPressed: () {},
                tooltip:   'Buscar',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [cs.primaryContainer, cs.surface],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 56),
                    Icon(Icons.self_improvement, size: 48, color: cs.primary),
                    const SizedBox(height: 8),
                    Text(
                      '8 entradas este mes',
                      style: TextStyle(color: cs.onPrimaryContainer, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Lista de entradas del diario
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Card(
                  elevation: 0,
                  color: cs.surfaceContainerHighest.withOpacity(0.3),
                  child: ListTile(
                    leading:  Icon(Icons.book, color: cs.primary),
                    title:    Text('Día ${i + 1} de Reflexión'),
                    subtitle: Text('Estado general: Tranquilo'),
                    trailing: Chip(
                      label:           const Text('Leído'),
                      backgroundColor: cs.secondaryContainer,
                      labelStyle:      TextStyle(color: cs.onSecondaryContainer),
                    ),
                    onTap: () {},
                  ),
                ),
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
