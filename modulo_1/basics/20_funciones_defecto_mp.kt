fun main() {

    println("TherAppy - Perfiles Emocionales")

    println(crearPerfilEmocional("Jhon", 25, "Estres", true))
    println(crearPerfilEmocional("Luis"))
    println(crearPerfilEmocional("Maria", 25))
    println(crearPerfilEmocional("Juan", 90, "Ansiedad"))

    // Argumentos nombrados
    println(
        crearPerfilEmocional(
            edad = 30,
            nombre = "Day",
            seguimientoActivo = false
        )
    )
}

fun crearPerfilEmocional(
    nombre: String,
    edad: Int = 18,
    emocionPrincipal: String = "Calma",
    seguimientoActivo: Boolean = true
): String {

    return """
        Usuario TherAppy [
        nombre=$nombre,
        edad=$edad,
        emocion=$emocionPrincipal,
        seguimiento=$seguimientoActivo
        ]
    """.trimIndent()
}