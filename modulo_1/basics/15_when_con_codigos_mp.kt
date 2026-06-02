fun main() {
    println("TherAppy - Evaluacion del Estado Emocional")

    println("Nombre del usuario:")
    val nombreUsuario = readLine()?.trim() ?: "Usuario sin identificar"

    println("Nivel emocional (CRITICO/ALTO/MODERADO/ESTABLE):")
    val nivel = readLine()?.trim()?.uppercase() ?: ""

    when (nivel) {
        "CRITICO" -> {
            println("ALERTA EMOCIONAL CRITICA")
            println("Usuario: $nombreUsuario")
            println("Se recomienda contactar inmediatamente a una persona de confianza.")
            println("Iniciar ejercicio guiado de respiracion y relajacion.")
        }

        "ALTO" -> {
            println("Nivel emocional alto")
            println("Usuario: $nombreUsuario")
            println("Realizar una pausa de 10 minutos.")
            println("Practicar tecnicas de respiracion consciente.")
        }

        "MODERADO" -> {
            println("Nivel emocional moderado")
            println("Usuario: $nombreUsuario")
            println("Registrar pensamientos y emociones en el diario emocional.")
        }

        "ESTABLE" -> {
            println("Estado emocional estable")
            println("Usuario: $nombreUsuario")
            println("Continua con tus habitos de bienestar emocional.")
        }

        else -> {
            println("Nivel emocional no reconocido.")
        }
    }
}