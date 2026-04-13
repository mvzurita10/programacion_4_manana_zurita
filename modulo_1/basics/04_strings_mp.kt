fun main() {
    val nombre = "Ana"
    val emocion = "estres"
    val edad = 28
    
    // Variable simple
    println("Hola $nombre")

    // Expresión
    println("Estado emocional: ${emocion.uppercase()}")
    val mensajeCompleto = "Usuario: ${nombre.uppercase()} - Emocion actual: ${emocion.uppercase()}"
    println(mensajeCompleto)
    println("Edad en proceso de crecimiento emocional: ${edad + 1} años")

    // String Multilínea (tipo tarjeta emocional)
    val tarjeta = """
        |TherAppy - Tarjeta Emocional
        |Nombre: $nombre
        |Edad: $edad
        |Emocion actual: $emocion
        |Estado: ${if (edad >= 18) "Autogestion emocional activa" else "En desarrollo emocional"}
    """.trimMargin()
    println(tarjeta)
}