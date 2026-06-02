fun main() {

    println("TherAppy - Seguimiento Emocional")
    println("¿Cuantos registros emocionales deseas ingresar?")

    val registros = readLine()?.toIntOrNull() ?: 3

    var totalEstres = 0

    repeat(registros) { i ->

        println("Registro ${i + 1}")
        println("Ingresa tu nivel de estres (0 - 100):")

        val nivelEstres = readLine()?.toIntOrNull() ?: 0

        totalEstres += nivelEstres
    }

    val promedio = totalEstres / registros

    println("\n Resultado TherAppy")
    println("Nivel promedio de estres: $promedio")

    println(
        "Clasificacion: ${
            when {
                promedio <= 30 -> "Relajado"
                promedio <= 60 -> "Estres Moderado"
                promedio <= 80 -> "Estres Alto"
                else -> "Estres Crítico"
            }
        }"
    )
}