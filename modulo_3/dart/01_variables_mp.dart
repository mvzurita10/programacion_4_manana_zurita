void main() {

    // var — tipo inferido
    var usuario = 'Miky';                  // String
    var edad = 21;                         // int
    var nivelEstres = 7.5;                 // double
    var sesionActiva = true;               // bool

    // Tipo explícito
    String aplicacion = 'TherAppy';
    int ejerciciosCompletados = 15;
    double promedioAnimo = 8.7;
    bool recordatoriosActivos = false;

    // final — no se puede reasignar
    final categoriaPrincipal = 'Control Emocional';
    // categoriaPrincipal = 'Meditación'; // ERROR

    // const — constante en tiempo de compilación
    const sesionesRecomendadas = 3;
    const nivelMaximoAnimo = 10.0;

    // Diferencia entre final y const
    final fechaIngreso = DateTime.now(); // OK
    // const fechaIngreso = DateTime.now(); // ERROR

    print(
        'Bienvenido a $aplicacion, $usuario tiene $edad años y está trabajando en $categoriaPrincipal.');

    // var — mutable
    var emocionesRegistradas = 0;
    emocionesRegistradas = 1;

    // final — referencia inmutable
    final emociones = ['Felicidad', 'Calma', 'Motivación'];
    emociones.add('Gratitud');
    // emociones = ['Estrés']; // ERROR

    // const — completamente inmutable
    const tecnicas = [
        'Respiración Profunda',
        'Meditación Guiada'
    ];
    // tecnicas.add('Mindfulness'); // ERROR

    print('\nInformación del usuario:');
    print('Nivel de estrés: $nivelEstres');
    print('Sesión activa: $sesionActiva');
    print('Ejercicios completados: $ejerciciosCompletados');
    print('Promedio de ánimo: $promedioAnimo');
    print('Recordatorios activos: $recordatoriosActivos');

    print('\nEmociones registradas: $emociones');
    print('Técnicas disponibles: $tecnicas');
}