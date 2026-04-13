fun main() {

    println("TherAppy - Evaluacion Emocional Avanzada")

    println("Has tenido estres constante ultimamente? (s/n): ")
    val estresConstante = readLine()?.trim()?.lowercase() == "s"

    println("Ingresa tu nivel actual de estres (0 a 100): ")
    val nivelEstres = readLine()?.toIntOrNull() ?: 0

    if (estresConstante) {
        println("Has tenido estres constante")

        if (nivelEstres < 30) {
            println("Nivel bajo, pero vienes de un periodo cargado")
        } else if (nivelEstres > 70) {
            println("Estres muy alto acumulado")
            println("Necesitas descanso urgente y apoyo emocional")
        } else {
            println("Nivel moderado, cuida tu energia")
        }
    } else {
        println("No has tenido estres constante")

        if (nivelEstres < 30 || nivelEstres > 70) {
            println("Nivel fuera del equilibrio emocional")
        } else {
            println("Estado emocional estable")
        }
    }
}