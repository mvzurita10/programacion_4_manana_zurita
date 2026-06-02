fun main() {
    println("TherAppy - Evaluación de Bienestar Emocional")

    println("Ingresa tu edad:")
    val edad = readLine()?.toIntOrNull() ?: 0

    println("¿Cuentas con apoyo emocional? (S/N):")
    val tieneApoyo = readLine()?.trim()?.lowercase() == "s"

    var nivelApoyo = ""
    if (tieneApoyo) {
        println("Nivel de apoyo (BASICO/INTERMEDIO/PREMIUM):")
        nivelApoyo = readLine()?.trim()?.uppercase() ?: ""
    }

    val sesionesRecomendadas = when {
        !tieneApoyo && edad < 18 -> 1
        !tieneApoyo && edad >= 60 -> 4
        !tieneApoyo -> 3
        nivelApoyo == "BASICO" -> 2
        nivelApoyo == "INTERMEDIO" -> 1
        nivelApoyo == "PREMIUM" -> 0
        else -> 3
    }

    println(" Resultado TherAppy")
    println("Sesiones de apoyo emocional recomendadas por semana: $sesionesRecomendadas")
}