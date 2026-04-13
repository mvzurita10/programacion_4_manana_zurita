fun main() {

    println("TherAppy - Evaluación de Estres")
    println("Ingresa tu nivel de estres (0 a 100): ")

    val nivelEstres = readLine()?.toDoubleOrNull() ?: 50.0

    if (nivelEstres >= 80.0) {
        println("Estres muy alto: necesitas parar y respirar profundamente️")
    }

    if (nivelEstres >= 60.0) {
        println("Estres elevado: considera tomar un descanso o meditar")
    }

    if (nivelEstres < 60.0) {
        println("Nivel manejable: sigue cuidando tu bienestar")
    }

    println("Nivel de estres registrado: $nivelEstres")
}