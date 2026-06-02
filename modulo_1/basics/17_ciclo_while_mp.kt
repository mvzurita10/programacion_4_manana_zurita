fun main() {

    println("TherAppy - Ciclos While y Do While")

    println("\nWhile basico")
    var sesion = 1

    while (sesion <= 5) {
        println("💙 Sesion de respiracion #$sesion completada")
        sesion++
    }

    println("\nDo While")

    var ejercicio = 1

    do {
        println("Ejercicio de relajacion #$ejercicio")
        ejercicio++
    } while (ejercicio <= 5)

    println("\nBreak y Continue")

    var actividad = 1

    while (actividad <= 10) {

        actividad++

        if (actividad == 3) {
            continue
        }

        if (actividad == 7) {
            break
        }

        println("Actividad emocional #$actividad")
    }

    println("\nRegistro emocional interactivo")

    var emocion: String

    while (true) {

        println("¿Como te sientes hoy?")
        println("(Escribe 'salir' para finalizar)")

        emocion = readLine()?.trim()?.lowercase() ?: ""

        if (emocion == "salir") {
            println("Gracias por usar TherAppy")
            break
        }

        println("Emocion registrada: $emocion")
    }
}