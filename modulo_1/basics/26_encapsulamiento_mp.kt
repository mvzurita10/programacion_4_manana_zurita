class PerfilEmocional(
    usuario: String,
    nivelInicialEstres: Double
) {

    val usuario: String = usuario

    // Solo la clase puede modificar el nivel de estrés
    private var nivelEstres: Double = nivelInicialEstres

    // Visible dentro del módulo
    internal val codigoPerfil: String =
        "TH${(100000..999999).random()}"

    // Visible para futuras subclases
    protected open fun calcularBienestar(): Double =
        100 - nivelEstres

    // Reducir estrés mediante actividades
    fun realizarEjercicio(reduccion: Double) {

        require(reduccion > 0) {
            "La reduccion debe ser positiva"
        }

        nivelEstres -= reduccion

        if (nivelEstres < 0) {
            nivelEstres = 0.0
        }

        println(
            "Ejercicio completado | " +
            "Nuevo nivel de estres: ${consultarEstres()}"
        )
    }

    // Aumentar estrés por eventos negativos
    fun registrarEvento(aumento: Double): Boolean {

        require(aumento > 0) {
            "El aumento debe ser positivo"
        }

        nivelEstres += aumento

        if (nivelEstres > 100) {
            nivelEstres = 100.0
        }

        println(
            "⚠️ Evento registrado | " +
            "Nuevo nivel de estres: ${consultarEstres()}"
        )

        return true
    }

    fun consultarEstres(): String =
        "${"%.1f".format(nivelEstres)}"

    fun consultarBienestar(): String =
        "${"%.1f".format(100 - nivelEstres)}"
}

fun main() {

    val perfil = PerfilEmocional(
        "Miky Zurita",
        60.0
    )

    perfil.realizarEjercicio(15.0)

    perfil.registrarEvento(10.0)

    println("Usuario: ${perfil.usuario}")

    println(
        "Nivel de bienestar: ${
            perfil.consultarBienestar()
        }"
    )

    println(
        "Nivel de estres: ${
            perfil.consultarEstres()
        }"
    )

    // perfil.nivelEstres = 0
    // ERROR: es privado
}