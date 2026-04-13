fun main() {

    println("TherAppy - Apoyo Emocional")

    println("Tienes apoyo emocional? (s/n): ")
    val tieneApoyo = readLine()?.trim()?.lowercase() == "s"

    println("Ingresa tu nivel de estres (0 a 100): ")
    val nivelEstres = readLine()?.toDoubleOrNull() ?: 50.0

    if (tieneApoyo) {
        val reduccion = nivelEstres * 0.30
        val estresFinal = nivelEstres - reduccion

        println("Gracias a tu apoyo emocional:")
        println("Reducción de estres: ${"%.2f".format(reduccion)}")
        println("Nivel final de estres: ${"%.2f".format(estresFinal)}")

    } else {
        println("No cuentas con apoyo emocional en este momento")
        println("Nivel actual de estres: ${"%.2f".format(nivelEstres)}")
        println("Te recomendamos buscar apoyo o realizar ejercicios de respiracion️")
    }
}