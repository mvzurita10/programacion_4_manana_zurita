fun main() {

    println("TherAppy - Funciones")

    val mensajeBienvenida = bienvenida()
    println(mensajeBienvenida)

    val nivelTotal = sumarEstres(35, 20)
    println("Nivel total de estres: $nivelTotal")

    println("Reduccion de estrss (tipo expresion): ${reducirEstresExpresion(50, 15)}")

    println("Reducción de estres (tipo inferido): ${reducirEstresInferido(50, 15)}")

    saludarUsuario("Miky")
}

// Función tradicional
fun bienvenida(): String {
    return "Bienvenido a TherAppy"
}

// Función con parametros
fun sumarEstres(actual: Int, adicional: Int): Int {
    return actual + adicional
}

// Función tipo expresión
fun reducirEstresExpresion(actual: Int, reduccion: Int): Int = actual - reduccion

// Función con tipo inferido
fun reducirEstresInferido(actual: Int, reduccion: Int) = actual - reduccion

// Función que muestra un saludo
fun saludarUsuario(nombre: String) {
    println("Hola $nombre")
    println("Estamos listos para ayudarte a gestionar tus emociones")
}