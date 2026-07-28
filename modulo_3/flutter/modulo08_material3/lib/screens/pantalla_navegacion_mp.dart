import 'package:flutter/material.dart';

class PantallaNavegacionMp extends StatefulWidget {
  const PantallaNavegacionMp({super.key});

  @override
  State<PantallaNavegacionMp> createState() => _PantallaNavegacionMpState();
}

class _PantallaNavegacionMpState extends State<PantallaNavegacionMp> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Centro de Bienestar'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _PantallaDashboard(),
          _PantallaDiario(),
          _PantallaRecursos(),
          _PantallaAjustes(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.tertiaryContainer,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label:        'Resumen',
          ),
          NavigationDestination(
            icon:         Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label:        'Diario',
          ),
          NavigationDestination(
            icon:         Badge(label: Text('1'), child: Icon(Icons.spa_outlined)),
            selectedIcon: Badge(label: Text('1'), child: Icon(Icons.spa)),
            label:        'Técnicas',
          ),
          NavigationDestination(
            icon:         Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label:        'Perfil',
          ),
        ],
      ),
    );
  }
}

class _PantallaDashboard extends StatelessWidget {
  const _PantallaDashboard();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Tu progreso esta semana', style: text.headlineSmall),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Días Seguidos', valor: '5',  icono: Icons.calendar_today, color: cs.primaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Nivel Calma',   valor: 'Alta',  icono: Icons.mood, color: cs.secondaryContainer)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Horas Sueño', valor: '7.5', icono: Icons.nightlight_round, color: cs.tertiaryContainer)),
        ]),
      ],
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color    color;

  const _TarjetaMetrica({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(valor,  style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PantallaDiario extends StatelessWidget {
  const _PantallaDiario();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 4,
      itemBuilder: (ctx, i) => Card(
        child: ListTile(
          leading:  Icon(Icons.edit_note, color: cs.primary),
          title:    Text('Reflexión - Día ${i + 1}'),
          subtitle: Text('Breve nota sobre cómo me sentí hoy...'),
          trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
        ),
      ),
    );
  }
}

class _PantallaRecursos extends StatelessWidget {
  const _PantallaRecursos();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Card(
          color: cs.tertiaryContainer,
          child: ListTile(
            leading: Icon(Icons.self_improvement, color: cs.onTertiaryContainer),
            title: const Text('Respiración 4-7-8', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Para calmar la ansiedad'),
            trailing: const Icon(Icons.play_circle_fill),
          ),
        ),
        Card(
          color: cs.secondaryContainer,
          child: ListTile(
            leading: Icon(Icons.psychology, color: cs.onSecondaryContainer),
            title: const Text('Diario de Gratitud', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Escribe 3 cosas positivas'),
            trailing: const Icon(Icons.edit),
          ),
        ),
      ],
    );
  }
}

class _PantallaAjustes extends StatelessWidget {
  const _PantallaAjustes();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.person_outline),
          title:   Text('Mi Perfil'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.notifications_active_outlined),
          title:   Text('Recordatorios de Meditación'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.lock_outline),
          title:   Text('Privacidad (PIN)'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
