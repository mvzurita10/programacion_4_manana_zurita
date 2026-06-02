fun main() {

    println("TherAppy - Mapas (Map)")

    println("\nMap Inmutable")

    val recomendaciones = mapOf(
        "Ansiedad" to "Respiracion Profunda",
        "Estres" to "Meditacion",
        "Tristeza" to "Diario Emocional",
        "Ira" to "Ejercicio de Relajacion"
    )

    println(recomendaciones["Ansiedad"])
    println(recomendaciones["Felicidad"])

    println(
        recomendaciones.getOrDefault(
            "Ansiedad",
            "Sin recomendacion"
        )
    )

    println(
        recomendaciones.getOrDefault(
            "Felicidad",
            "Sin recomendacion"
        )
    )

    println(recomendaciones)
    println(recomendaciones.keys)
    println(recomendaciones.values)
    println(recomendaciones.entries)

    for ((emocion, actividad) in recomendaciones) {
        println("$emocion → $actividad")
    }

    println("\nMap Mutable")

    val seguimientoEmocional = mutableMapOf(
        "Ana" to 65,
        "Carlos" to 30,
        "Maria" to 80,
        "Pedro" to 25
    )

    println("Estado inicial:")
    println(seguimientoEmocional)

    // Agregar usuario
    seguimientoEmocional["Luisa"] = 50
    println(seguimientoEmocional)

    // Actualizar nivel de estres
    seguimientoEmocional["Ana"] = 40
    println(seguimientoEmocional)

    // Eliminar usuario
    seguimientoEmocional.remove("Pedro")
    println(seguimientoEmocional)

    // Agregar si no existe
    seguimientoEmocional.getOrPut("Miky") { 35 }
    println(seguimientoEmocional)

    // No modifica porque ya existe
    seguimientoEmocional.getOrPut("Carlos") { 90 }
    println(seguimientoEmocional)
}