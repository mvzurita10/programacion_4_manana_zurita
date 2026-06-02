void main() {

  // List — lista ordenada
  List<String> emociones = [
    'Felicidad',
    'Calma',
    'Motivación'
  ];

  var nivelesAnimo = [8, 7, 9, 10, 6]; // List<int>

  print(emociones[0]);      // Felicidad
  print(emociones.length);  // 3

  emociones.add('Gratitud');
  emociones.remove('Calma');

  // Map — usuario → nivel de bienestar
  Map<String, int> bienestarUsuarios = {
    'Miky': 8,
    'Carlos': 6,
    'María': 9,
  };

  print(bienestarUsuarios['Miky']);   // 8
  print(bienestarUsuarios['Pedro']);  // null

  bienestarUsuarios['Andrea'] = 10;

  // Set — sin duplicados
  Set<String> tecnicas = {
    'Mindfulness',
    'Respiración Profunda',
    'Meditación'
  };

  tecnicas.add('Mindfulness'); // Ignorado porque ya existe

  print(tecnicas.length);

  // Spread operator — combinar colecciones
  var ejerciciosBasicos = [
    'Respiración',
    'Relajación Muscular',
    'Meditación'
  ];

  var ejerciciosAvanzados = [
    'Mindfulness',
    'Diario Emocional',
    'Visualización Positiva'
  ];

  var todosLosEjercicios = [
    ...ejerciciosBasicos,
    ...ejerciciosAvanzados
  ];

  print(todosLosEjercicios);

  // Collection if — elementos condicionales
  bool mostrarConsejoExtra = true;

  var consejos = [
    'Identifica tu emoción',
    'Respira profundamente',
    if (mostrarConsejoExtra)
      'Escribe tus pensamientos en tu diario emocional',
  ];

  print(consejos);

  // Collection for — generar elementos
  var progresoSemanal = [
    for (var dia = 1; dia <= 7; dia++) dia * 10
  ];

  print(progresoSemanal); // [10, 20, 30, 40, 50, 60, 70]
}