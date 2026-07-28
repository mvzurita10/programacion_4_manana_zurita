import 'package:flutter/material.dart';

class CatalogoBasicosMp extends StatelessWidget {
  const CatalogoBasicosMp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Técnicas de Calma y Relajación')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Recomendación actual: Meditación Guiada',
            style: TextStyle(
              fontSize:      20,
              fontWeight:    FontWeight.bold,
              color:         Colors.teal,
              letterSpacing: 0.5,
              shadows: [Shadow(color: Colors.black26, blurRadius: 2, offset: Offset(1,1))]
            ),
          ),
          const SizedBox(height: 8),
          
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Tómate un momento para respirar profundo y reconectar contigo mismo.',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow:  TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),

          const Text.rich(
            TextSpan(children: [
              TextSpan(text: 'Nivel de estrés: ', style: TextStyle(fontWeight: FontWeight.w600)),
              TextSpan(text: 'ELEVADO', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
              TextSpan(text: ' — Registrado hace 5 min', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ]),
          ),
          const SizedBox(height: 8),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.self_improvement, size: 40, color: Colors.teal),
              Icon(Icons.spa, size: 80, color: Colors.lightGreen),
              Icon(Icons.monitor_heart, size: 40, color: Colors.pinkAccent),
              Icon(Icons.air, size: 80, color: Colors.lightBlue),
            ],
          ),
          const SizedBox(height: 8),
          
          const Divider(height: 32),
          
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.play_arrow, size: 18),
                label: const Text('Iniciar Respiración'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.headphones, size: 18),
                label: const Text('Escuchar Meditación'),
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon:  const Icon(Icons.info_outline, size: 18),
                  label: const Text('Más información'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal.shade400,
              foregroundColor: Colors.white,
              padding:     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 4,
              minimumSize: const Size(double.infinity, 0),
            ),
            child: const Text('Protocolo de Emergencia', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 32),
          
          Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.teal.shade50,
            child: ListTile(
              leading:  const Icon(Icons.air, color: Colors.teal),
              title:    const Text('Respiración Diafragmática'),
              subtitle: const Text('Técnica 4-7-8 · Reduce la ansiedad'),
              trailing: const Icon(Icons.check_circle, color: Colors.green, size: 18),
              onTap:    () {},
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              isThreeLine: true,
              leading: CircleAvatar(
                backgroundColor: Colors.purple.shade50,
                child: const Icon(Icons.edit_note, color: Colors.purple, size: 20),
              ),
              title:    const Text('Escritura Reflexiva'),
              subtitle: const Text('Plasma tus pensamientos para reducir la carga mental del día.'),
              trailing: TextButton(onPressed: () {}, child: const Text('Empezar')),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
          
          const Divider(height: 32),
          
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              const Chip(label: Text('Calma')),
              Chip(
                avatar:          const Icon(Icons.favorite, size: 16, color: Colors.white),
                label:           const Text('Auto-cuidado'),
                backgroundColor: Colors.pink.shade300,
                labelStyle:      const TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label:      const Text('Relajación muscular'),
                selected:   true,
                onSelected: (_) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
