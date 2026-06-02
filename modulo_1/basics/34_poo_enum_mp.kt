enum class EstadoEmocional(
    val descripcion: String,
    val requiereAtencion: Boolean
) {

    TRANQUILO(
        "Usuario emocionalmente estable",
        false
    ),

    ESTRESADO(
        "Nivel de estres moderado",
        false
    ),

    ANSIOSO(
        "Presenta ansiedad elevada",
        true
    ),

    EN_SESION(
        "Realizando actividad de bienestar",
        false
    ),

    RECUPERADO(
        "Estado emocional mejorado",
        false
    );

    fun puedeCambiarA(
        siguiente: EstadoEmocional
    ): Boolean = when (this) {

        TRANQUILO ->
            siguiente == ESTRESADO

        ESTRESADO ->
            siguiente == ANSIOSO ||
            siguiente == EN_SESION

        ANSIOSO ->
            siguiente == EN_SESION

        EN_SESION ->
            siguiente == RECUPERADO

        RECUPERADO ->
            siguiente == TRANQUILO
    }
}

fun main() {

    val estado = EstadoEmocional.EN_SESION

    println("Descripcion:")
    println(estado.descripcion)

    println("¿Requiere atencion?")
    println(estado.requiereAtencion)

    val icono = when (estado) {

        EstadoEmocional.TRANQUILO ->
            "😊"

        EstadoEmocional.ESTRESADO ->
            "😟"

        EstadoEmocional.ANSIOSO ->
            "😰"

        EstadoEmocional.EN_SESION ->
            "🧘"

        EstadoEmocional.RECUPERADO ->
            "💙"
    }

    println("Estado actual: $icono")

    println(
        estado.puedeCambiarA(
            EstadoEmocional.RECUPERADO
        )
    )
}