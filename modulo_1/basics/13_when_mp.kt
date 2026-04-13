fun main() {

    println("TherAppy - Seleccion de Apoyo Emocional")
    println("Elige una opcion segun como te sientes:")

    println("1 -> Ansiedad")
    println("2 -> Tristeza")
    println("3 -> Estres")
    println("4 -> Ira")
    println("5 -> Miedo")
    println("6 -> Desmotivacion")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val recomendacion = when (codigo) {
        1 -> "Respira profundamente y enfocate en el presente️"
        2 -> "Permitete sentir y habla con alguien de confianza"
        3 -> "Tomate un descanso y relaja tu mente"
        4 -> "Alejate un momento y evita reaccionar impulsivamente"
        5 -> "Recuerda que puedes manejar esta situacion"
        6 -> "Empieza con pequeñas metas, paso a paso"
        else -> "Opcion no valida, intenta nuevamente"
    }
    println("Recomendación TherAppy: $recomendacion")
}