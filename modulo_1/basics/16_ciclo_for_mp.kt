fun main() {

    println("TherAppy - Ciclos For")

    println("\nFor con rango")
    for (i in 1..5) {
        println("Sesion de respiracion #$i")
    }

    println("\nFor con until")
    for (i in 1 until 5) {
        println("Ejercicio emocional #$i")
    }

    println("\nFor con pasos")
    for (i in 0..10 step 2) {
        println("Nivel de calma: $i")
    }

    println("\nFor descendente")
    for (i in 10 downTo 1 step 2) {
        println("Reduciendo nivel de estres: $i")
    }

    println("\nFor con lista de emociones")
    val emociones = listOf(
        "Felicidad",
        "Tristeza",
        "Ansiedad",
        "Calma",
        "Estres"
    )

    for (emocion in emociones) {
        println(emocion)
    }

    println("\nFor con indice y valor")
    for ((indice, emocion) in emociones.withIndex()) {
        println("Posicion: $indice - Emocion: $emocion")
    }

    println("\nFor con break")
    for (i in 1..10) {
        if (i == 5) {
            break
        }
        println("Ejercicio completado #$i")
    }

    println("\nFor con continue")
    for (i in 1..10) {
        if (i == 5) {
            continue
        }
        println("Actividad #$i")
    }

    println("\nFor con continue y break")
    for (i in 1..10) {

        if (i == 5) {
            continue
        }

        if (i == 8) {
            break
        }

        println("Registro emocional #$i")
    }

    // Datos simulados de usuarios de TherAppy
    val usuarios = listOf(
        Triple("Ana", "Estres", 85),
        Triple("Carlos", "Calma", 20),
        Triple("María", "Ansiedad", 75),
        Triple("Pedro", "Felicidad", 15),
        Triple("Luisa", "Tristeza", 65)
    )

    println("\n Reporte emocional de usuarios")

    for ((posicion, usuario) in usuarios.withIndex()) {

        val (nombre, emocion, nivelEstres) = usuario

        val alerta = if (nivelEstres >= 70)
            "Atención"
        else
            "Estable"

        println(
            "Usuario ${posicion + 1} - $nombre - " +
            "Emocion: $emocion - " +
            "Estres: $nivelEstres - " +
            "$alerta"
        )
    }
}