fun main() {

    println("TherAppy - Operadores de Comparación")

    val nivelEstresActual = 7
    val nivelEstresObjetivo = 4

    println("$nivelEstresActual == $nivelEstresObjetivo : ${nivelEstresActual == nivelEstresObjetivo}")

    println(
        "$nivelEstresActual.equals($nivelEstresObjetivo) : ${
            nivelEstresActual.equals(nivelEstresObjetivo)
        }"
    )

    println("$nivelEstresActual != $nivelEstresObjetivo : ${nivelEstresActual != nivelEstresObjetivo}")

    println("$nivelEstresActual > $nivelEstresObjetivo : ${nivelEstresActual > nivelEstresObjetivo}")

    println("$nivelEstresActual < $nivelEstresObjetivo : ${nivelEstresActual < nivelEstresObjetivo}")

    println("$nivelEstresActual <= $nivelEstresObjetivo : ${nivelEstresActual <= nivelEstresObjetivo}")

    println("$nivelEstresActual >= $nivelEstresObjetivo : ${nivelEstresActual >= nivelEstresObjetivo}")

}