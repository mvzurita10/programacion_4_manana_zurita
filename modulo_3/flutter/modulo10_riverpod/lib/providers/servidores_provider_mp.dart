import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/servidor_ssh_mp.dart';

class RegistrosNotifier extends Notifier<List<RegistroEmocional>> {
  @override
  List<RegistroEmocional> build() => [
    RegistroEmocional(id:'1', emocion:'Ansiedad', intensidad:8, desencadenante:'Trabajo', pensamiento:'Muchas tareas', tecnicaAplicada:true, favorito:true),
    RegistroEmocional(id:'2', emocion:'Tristeza', intensidad:5, desencadenante:'Personal', pensamiento:'Soledad', tecnicaAplicada:false),
    RegistroEmocional(id:'3', emocion:'Alegría',  intensidad:9, desencadenante:'Social', pensamiento:'Buena salida', tecnicaAplicada:false),
  ];

  void toggleFavorito(String id) {
    state = state.map((s) =>
        s.id == id
          ? RegistroEmocional(id:s.id, emocion:s.emocion, intensidad:s.intensidad,
                        desencadenante:s.desencadenante, pensamiento:s.pensamiento,
                        tecnicaAplicada:s.tecnicaAplicada,
                        favorito:!s.favorito)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(RegistroEmocional registro) {
    state = [...state, registro];
  }
}

final registrosProvider =
    NotifierProvider<RegistrosNotifier, List<RegistroEmocional>>(
  RegistrosNotifier.new,
);

final busquedaProvider = StateProvider<String>((ref) => '');

final registrosFiltradosProvider = Provider<List<RegistroEmocional>>((ref) {
  final todos    = ref.watch(registrosProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((s) =>
      s.emocion.toLowerCase().contains(q) || s.pensamiento.toLowerCase().contains(q) || s.desencadenante.toLowerCase().contains(q)
  ).toList();
});
