fun main() {

    println("TherAppy - Registro de Estado Emocional ")

    println("\nNiveles emocionales (representados con datos numericos):")

    val nivelEstres: Byte = 100
    println("Nivel de estres (Byte): $nivelEstres")

    val nivelAnsiedad: Short = 30000
    println("Nivel de ansiedad (Short): $nivelAnsiedad")

    val pensamientos: Int = 2000000000
    println("Cantidad de pensamientos (Int): $pensamientos")

    val progresoTotal: Long = 2122122122122123L
    println("Progreso emocional acumulado (Long): $progresoTotal")

    val nivelRelajacion: Float = 14.3f
    println("Nivel de relajacion (Float): $nivelRelajacion")

    val equilibrioMental: Double = 3.1415925
    println("Equilibrio mental (Double): $equilibrioMental")


    // Datos inferidos (usuario)
    val nombre = "Juana"
    val sesionesCompletadas = 56

    println("\nInformacion del usuario:")
    println("Nombre: $nombre")
    println("Tipo inferido nombre: ${nombre::class.simpleName}")

    println("Sesiones completadas: $sesionesCompletadas")
    println("Tipo inferido sesiones: ${sesionesCompletadas::class.simpleName}")
}