fun main() {
    // Entrada de datos (usuario)
    println("Bienvenido a TherAppy ")
    println("Escribe tu nombre:")
    val nombre = readLine()
    println("Escribe como te sientes hoy:")
    val emocion = readLine()
    println("\nRegistro emocional guardado")
    println("Nombre: $nombre")
    println("Emocion actual: $emocion")

    // Mensaje simple segun emocion
    val mensaje = when (emocion?.lowercase()) {
        "estres", "estres" -> "Te recomiendo hacer un ejercicio de respiracion 🌬️"
        "triste", "tristeza" -> "Recuerda que esta bien no estar bien"
        "feliz" -> "¡Sigue disfrutando ese momento!"
        else -> "Gracias por compartir como te sientes"
    }

    println("Recomendacion: $mensaje")
}
