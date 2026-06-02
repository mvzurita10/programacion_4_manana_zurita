fun main() {

    println("TherAppy - Gestion de Emociones")

    val emociones = listOf(
        "Felicidad",
        "Ansiedad",
        "Calma",
        "Estres",
        "Motivacion"
    )

    println("Cantidad de emociones registradas: ${emociones.size}")
    println("Primera emocion: ${emociones[0]}")
    println("Primera emocion (first): ${emociones.first()}")
    println("Ultima emocion: ${emociones.last()}")

    println("Emocion en indice 2: ${emociones.get(2)}")
    println("Indice de Ansiedad: ${emociones.indexOf("Ansiedad")}")

    println("¿Existe Calma?: ${emociones.contains("Calma")}")
    println("¿Existe Estres?: ${"Estres" in emociones}")

    println("Sublista: ${emociones.subList(1, 3)}")
    println("Primeras 2 emociones: ${emociones.take(2)}")
    println("Omitir las primeras 3 emociones: ${emociones.drop(3)}")
    println("Ultimas 2 emociones: ${emociones.takeLast(2)}")

    println("\nLista de emociones")

    for (emocion in emociones) {
        println(emocion)
    }

    println("\nLista mutable de actividades")

    val actividades = mutableListOf(
        "Respiracion",
        "Meditacion",
        "Diario Emocional",
        "Relajacion"
    )

    for (actividad in actividades) {
        println(actividad)
    }

    println("\nAgregar actividad")
    actividades.add("Mindfulness")

    for (actividad in actividades) {
        println(actividad)
    }

    println("\nInsertar actividad al inicio")
    actividades.add(0, "Ejercicio de Gratitud")

    for (actividad in actividades) {
        println(actividad)
    }

    println("\nEliminar actividad")
    actividades.remove("Mindfulness")

    for (actividad in actividades) {
        println(actividad)
    }

    println("\nModificar actividad")
    actividades[1] = "Visualizacion Positiva"

    for (actividad in actividades) {
        println(actividad)
    }

    println("\nArrayDeque - Historial reciente")

    val historial = ArrayDeque<String>()

    println(historial)

    historial.addFirst("Ansiedad")
    println(historial)

    historial.addLast("Calma")
    println(historial)

    historial.addLast("Felicidad")
    println(historial)

    historial.removeFirst()
    println(historial)

    historial.removeLast()
    println(historial)
}