fun main() {

    println("TherAppy - Clasificación del Estres")
    println("Ingresa tu nivel de estres (0 a 100): ")

    val nivelEstres = readLine()?.toIntOrNull() ?: 0

    val clasificacion = if (nivelEstres <= 20) {
        "Relajado"
    } else if (nivelEstres <= 40) {
        "Leve"
    } else if (nivelEstres <= 60) {
        "Moderado"
    } else if (nivelEstres <= 80) {
        "Alto"
    } else {
        "Critico"
    }

    println("Clasificacion: $clasificacion")
    println("Clasificacion en MAYUSCULAS: ${clasificacion.uppercase()}")

    // Recomendación según nivel
    println("\nRecomendacion TherAppy:")

    if (nivelEstres > 80) {
        println("Tomate un descanso urgente y realiza respiracion guiada️")
    } else if (nivelEstres > 60) {
        println("Intenta relajarte con musica o meditacion")
    } else if (nivelEstres > 40) {
        println("Manten el equilibrio, vas bien")
    } else {
        println("Excelente estado emocional, sigue asi")
    }
}