fun main() {

    println("TherAppy - Operadores Lógicos")

    val realizoMeditacion = true
    val completoDiarioEmocional = false
    val sesionActiva = true

    println("&& - AND Lógico")

    println(
        "$realizoMeditacion && $completoDiarioEmocional = ${
            realizoMeditacion && completoDiarioEmocional
        }"
    )

    println(
        "$sesionActiva && $realizoMeditacion = ${
            sesionActiva && realizoMeditacion
        }"
    )

    println("|| - OR Lógico")

    println(
        "$realizoMeditacion || $completoDiarioEmocional = ${
            realizoMeditacion || completoDiarioEmocional
        }"
    )

    println(
        "$sesionActiva || $realizoMeditacion = ${
            sesionActiva || realizoMeditacion
        }"
    )

    println("! - NOT Lógico")

    println(
        "!$realizoMeditacion = ${
            !realizoMeditacion
        }"
    )

    println(
        "!$sesionActiva = ${
            !sesionActiva
        }"
    )

}