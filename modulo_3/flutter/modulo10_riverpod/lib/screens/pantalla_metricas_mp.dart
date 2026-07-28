import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_servidor_mp.dart';
import '../providers/metricas_provider_mp.dart';

class PantallaMetricasMp extends ConsumerWidget {
  const PantallaMetricasMp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricasAsync = ref.watch(metricasBienestarProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadísticas de Bienestar'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:    const Icon(Icons.refresh),
            tooltip: 'Recargar',
            onPressed: () =>
                ref.read(metricasBienestarProvider.notifier).recargar(),
          ),
        ],
      ),
      body: metricasAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 8),
              Text('Error: $e'),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () =>
                    ref.read(metricasBienestarProvider.notifier).recargar(),
                icon:  const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (metricas) => ListView.builder(
          padding:     const EdgeInsets.all(12),
          itemCount:   metricas.length,
          itemBuilder: (_, i) => _TarjetaMetrica(metrica: metricas[i]),
        ),
      ),
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final MetricaBienestar metrica;
  const _TarjetaMetrica({required this.metrica});

  @override
  Widget build(BuildContext context) {
    final cs         = Theme.of(context).colorScheme;
    final estresAlto = metrica.nivelEstres > 70;
    final pocoSueno  = metrica.horasSueno < 6.0;
    final esCritico  = estresAlto || pocoSueno || metrica.crisis > 0;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color:  esCritico ? cs.errorContainer.withOpacity(0.5) : Colors.teal.shade50,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.calendar_today, color: esCritico ? cs.error : cs.primary, size: 18),
              const SizedBox(width: 8),
              Text(metrica.dia,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Spacer(),
              if (metrica.crisis > 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                  child: Text('${metrica.crisis} Crisis',
                      style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                  child: const Text('Sin crisis',
                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
            ]),
            const SizedBox(height: 12),
            _Barra('Sueño', (metrica.horasSueno / 10) * 100, pocoSueno, labelValor: '${metrica.horasSueno}h'),
            const SizedBox(height: 8),
            _Barra('Estrés', metrica.nivelEstres, estresAlto),
            const SizedBox(height: 8),
            _Barra('Calma', metrica.nivelCalma, metrica.nivelCalma < 40, inversa: true),
          ],
        ),
      ),
    );
  }
}

class _Barra extends StatelessWidget {
  final String label;
  final double valorPorcentaje; // 0 a 100
  final bool   critica;
  final String? labelValor;
  final bool   inversa;

  const _Barra(this.label, this.valorPorcentaje, this.critica, {this.labelValor, this.inversa = false});

  @override
  Widget build(BuildContext context) {
    final color = critica ? Colors.red : (inversa ? Colors.teal : Colors.green);
    return Row(children: [
      SizedBox(width: 50, child: Text(label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value:           valorPorcentaje / 100,
            backgroundColor: Colors.grey.shade300,
            valueColor:      AlwaysStoppedAnimation(color),
            minHeight: 8,
          ),
        ),
      ),
      const SizedBox(width: 8),
      SizedBox(
        width: 45,
        child: Text(labelValor ?? '${valorPorcentaje.toStringAsFixed(0)}%',
            style: TextStyle(fontSize: 12, color: color,
                fontWeight: FontWeight.bold), textAlign: TextAlign.end),
      ),
    ]);
  }
}
