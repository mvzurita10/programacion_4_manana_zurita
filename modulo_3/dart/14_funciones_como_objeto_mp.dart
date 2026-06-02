
// Funciones de bienestar emocional
int aumentarBienestar(int nivel) => nivel + 2;

int reducirEstres(int nivel) => nivel - 3;

void main() {

  // La variable 'accionEmocional' tiene tipo: int Function(int)
  int Function(int) accionEmocional;

  accionEmocional = aumentarBienestar;
  print(accionEmocional(5)); // 7

  accionEmocional = reducirEstres;
  print(accionEmocional(8)); // 5

  // Lista de funciones
  final actividades = <int Function(int)>[
    aumentarBienestar,
    reducirEstres
  ];

  for (final actividad in actividades) {
    print(actividad(10));
  }
}