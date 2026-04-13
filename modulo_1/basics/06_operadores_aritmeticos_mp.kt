fun main() {

    println("TherAppy - Gestion de Emociones")

    var nivelEstres = 10
    val respiracion = 2

    println("\nEstado inicial de estres: $nivelEstres")

    println("\nAplicando técnicas de control emocional:")

    // "Suma" → aumenta estres (mal hábito)
    println("Aumento de estres (preocupacion):")
    println("$nivelEstres + $respiracion = ${nivelEstres + respiracion}")

    // "Resta" → disminuye estrés (respiración)
    println("Disminucion de estres (respiracion):")
    println("$nivelEstres - $respiracion = ${nivelEstres - respiracion}")

    // "Multiplicación" → estrés acumulado
    println("Estres acumulado:")
    println("$nivelEstres * $respiracion = ${nivelEstres * respiracion}")

    // "División" → dividir carga emocional
    println("Compartir emociones ayuda:")
    println("$nivelEstres / $respiracion = ${nivelEstres / respiracion}")

    // "Módulo" → lo que queda del estrés
    println("Estres restante:")
    println("$nivelEstres % $respiracion = ${nivelEstres % respiracion}")

    println("\nProgreso emocional (asignacion compuesta):")
    var calma = 10
    calma += 5
    println("Meditacion aumenta calma (calma += 5): $calma")
    calma -= 3
    println("Preocupaciones reducen calma (calma -= 3): $calma")
    calma *= 2
    println("Dia positivo multiplica calma (calma *= 2): $calma")
    calma /= 2
    println("Cansancio divide energia (calma /= 2): $calma")
    calma %= 2
    println("Calma restante (calma %= 2): $calma")

    // Incremento y decremento
    calma++
    println("Pequeño logro aumenta calma (calma++): $calma")
    calma--
    println("Momento dificil disminuye calma (calma--): $calma")
}