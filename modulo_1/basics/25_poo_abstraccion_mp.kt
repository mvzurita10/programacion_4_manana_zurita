// El usuario de esta clase sabe QUÉ información puede consultar
// sobre un registro emocional, pero no cómo se calculan internamente
class RegistroEmocional(
    val id: Int,
    val usuario: String,
    val nivelEstres: Double,
    private val sesionesCompletadas: Int // privado
) {

    // Propiedad calculada
    val nivelBienestar: Double
        get() = 100 - nivelEstres

    // Propiedad calculada
    val seguimientoActivo: Boolean
        get() = sesionesCompletadas > 0

    override fun toString() =
        "$usuario - Estres: ${"%.1f".format(nivelEstres)}"
}

fun main() {

    val usuario = RegistroEmocional(
        1,
        "Miky",
        35.0,
        8
    )

    // Uso de la interfaz pública
    println(usuario)

    println("¿Seguimiento activo?")
    println(usuario.seguimientoActivo)

    println("Nivel de bienestar:")
    println(usuario.nivelBienestar)

    // usuario.sesionesCompletadas = 0
    // ERROR: es privado
}