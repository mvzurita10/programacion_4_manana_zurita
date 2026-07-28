import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_servidor_mp.dart';

class MetricasNotifier extends AsyncNotifier<List<MetricaBienestar>> {
  @override
  Future<List<MetricaBienestar>> build() => _fetch();

  Future<List<MetricaBienestar>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MetricaBienestar(dia:'Lunes', horasSueno:6.5, nivelEstres:75.0, nivelCalma:40.0, crisis:2),
      MetricaBienestar(dia:'Martes', horasSueno:7.0, nivelEstres:60.0, nivelCalma:55.0, crisis:1),
      MetricaBienestar(dia:'Miércoles', horasSueno:5.5, nivelEstres:85.0, nivelCalma:30.0, crisis:3),
      MetricaBienestar(dia:'Jueves', horasSueno:8.0, nivelEstres:40.0, nivelCalma:80.0, crisis:0),
      MetricaBienestar(dia:'Viernes', horasSueno:7.5, nivelEstres:30.0, nivelCalma:90.0, crisis:0),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final metricasBienestarProvider =
    AsyncNotifierProvider<MetricasNotifier, List<MetricaBienestar>>(
  MetricasNotifier.new,
);
