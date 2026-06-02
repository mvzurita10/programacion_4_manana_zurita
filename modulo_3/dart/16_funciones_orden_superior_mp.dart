
void main() {

  final nivelesBienestar = [6.5, 7.0, 5.5, 8.5];

  // map — transformar cada nivel después de una sesión
  final bienestarMejorado =
      nivelesBienestar.map((nivel) => nivel + 1);

  print(bienestarMejorado.toList());
  // [7.5, 8.0, 6.5, 9.5]

  // map sobre Strings
  final actividades = [
    'Respiración Profunda',
    'Meditación',
    'Mindfulness'
  ];

  final recomendaciones =
      actividades.map((a) => 'Actividad recomendada: $a');

  print(recomendaciones.toList());

  // where
  final nivelesEstres = [
    2.5,
    7.8,
    8.9,
    3.2,
    6.7,
    1.5
  ];

  final estresAlto =
      nivelesEstres.where((e) => e >= 7);

  print(estresAlto.toList());
  // [7.8, 8.9]

  final estresBajo =
      nivelesEstres.where((e) => e < 4);

  print(estresBajo.toList());
  // [2.5, 3.2, 1.5]

  // reduce y fold
  final minutosBienestar = [
    20.0,
    15.0,
    30.0,
    25.0,
    10.0
  ];

  // reduce
  final totalMinutos =
      minutosBienestar.reduce(
        (acum, minutos) => acum + minutos,
      );

  print(
      'Total de minutos de bienestar: ${totalMinutos.toStringAsFixed(0)}');

  // fold
  final totalFold =
      minutosBienestar.fold(
        0.0,
        (acum, minutos) => acum + minutos,
      );

  print(
      'Total de minutos (fold): ${totalFold.toStringAsFixed(0)}');

  // Encontrar el máximo
  final mayorSesion =
      minutosBienestar.reduce(
        (a, b) => a > b ? a : b,
      );

  print(
      'Sesión más larga: $mayorSesion minutos');
}