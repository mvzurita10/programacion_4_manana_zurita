data class RegistroEmocional(
    val id: Int,
    val usuario: String,
    val nivelEstres: Double,
    val emocionPrincipal: String,
    val seguimientoActivo: Boolean = true
)

fun main() {

    val r1 = RegistroEmocional(
        1,
        "Miky",
        75.0,
        "Ansiedad"
    )

    val r2 = RegistroEmocional(
        1,
        "Miky",
        75.0,
        "Ansiedad"
    )

    val r3 = RegistroEmocional(
        2,
        "Carlos",
        30.0,
        "Calma"
    )

    // toString() automático
    println(r1)

    // equals() por valor
    println(r1 == r2)
    println(r1 == r3)

    // copy()
    val mejorado = r1.copy(
        nivelEstres = 40.0
    )

    val seguimientoDesactivado = r1.copy(
        seguimientoActivo = false
    )

    println(mejorado)
    println(seguimientoDesactivado)

    // Desestructuración
    val (id, usuario, nivelEstres) = r1

    println(
        "$id - $usuario - Estres: $nivelEstres"
    )

    // En listas
    listOf(r1, r3).forEach {
            (idRegistro, nombreUsuario, estres) ->

        println(
            "[$idRegistro] $nombreUsuario - Estres: $estres"
        )
    }
}