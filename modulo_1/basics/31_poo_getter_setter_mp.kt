class EstadoEmocional(nivelInicial: Double) {

    // ENCAPSULAMIENTO: validamos antes de asignar
    var nivelEstres: Double = nivelInicial
        set(value) {
            require(value in 0.0..100.0) {
                "El nivel de estres debe estar entre 0 y 100"
            }
            field = value
        }

    // ABSTRACCIÓN: el usuario consulta el bienestar
    // sin saber cómo se calcula
    val nivelBienestar: Double
        get() = 100 - nivelEstres

    val categoria: String
        get() = when {
            nivelEstres < 20 -> "Relajado"
            nivelEstres < 40 -> "Estable"
            nivelEstres < 60 -> "Moderado"
            nivelEstres < 80 -> "Alto"
            else -> "Critico"
        }

    val recomendacion: String
        get() = when {
            nivelEstres < 20 ->
                "Manten tus habitos saludables"

            nivelEstres < 40 ->
                "Continua monitoreando tus emociones"

            nivelEstres < 60 ->
                "Realiza ejercicios de respiracion"

            nivelEstres < 80 ->
                "Se recomienda una sesion de relajacion"

            else ->
                "Busca apoyo emocional y descansa"
        }
}

fun main() {

    val estado = EstadoEmocional(35.0)

    println(
        "Estres: ${estado.nivelEstres}"
    )

    println(
        "Bienestar: ${estado.nivelBienestar}"
    )

    println(
        "Categoria: ${estado.categoria}"
    )

    println(
        "Recomendacion: ${estado.recomendacion}"
    )

    estado.nivelEstres = 85.0

    println("\nDespues de una actualizacion:")

    println(
        "Estres: ${estado.nivelEstres}"
    )

    println(
        "Categoria: ${estado.categoria}"
    )

    println(
        "Recomendacion: ${estado.recomendacion}"
    )

    // estado.nivelEstres = 150.0
    // IllegalArgumentException
}