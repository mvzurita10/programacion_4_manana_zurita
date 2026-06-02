fun main() {

    println("TherAppy - Conjuntos (Set)")

    println("\nSet Inmutable")

    val emociones = setOf(
        "Ansiedad",
        "Estres",
        "Calma",
        "Felicidad",
        "Ansiedad"
    )

    println("Emociones registradas: $emociones")

    println("\nOperaciones de conjuntos")

    val emocionesNegativas = setOf(
        "Ansiedad",
        "Estres",
        "Tristeza",
        "Miedo"
    )

    val emocionesPositivas = setOf(
        "Calma",
        "Felicidad",
        "Confianza",
        "Motivacion"
    )

    println("Emociones negativas: $emocionesNegativas")
    println("Emociones positivas: $emocionesPositivas")

    println("Union: ${emocionesNegativas union emocionesPositivas}")

    println(
        "Interseccion: ${
            emocionesNegativas intersect emocionesPositivas
        }"
    )

    println(
        "Diferencia: ${
            emocionesNegativas subtract emocionesPositivas
        }"
    )

    println("\nSet Mutable")

    val actividades = mutableSetOf(
        "Respiracion",
        "Meditacion",
        "Diario Emocional"
    )

    println(actividades)

    actividades.add("Respiracion") // No se duplicará
    actividades.add("Mindfulness")

    actividades.remove("Meditacion")

    println(actividades)

    println(
        "¿Existe Respiracion?: ${
            "Respiracion" in actividades
        }"
    )

    println(
        "¿Existe Meditacion?: ${
            "Meditacion" in actividades
        }"
    )
}