// El constructor primario integra la declaración de propiedades
class UsuarioTherAppy(
    val nombre: String,
    val edad: Int
)

// Clase con comportamiento adicional
class PerfilEmocional(
    val nombre: String,
    val nivelEstres: Int
) {

    fun mostrarEstado() =
        "$nombre tiene un nivel de estres de $nivelEstres"

    fun necesitaApoyo() =
        nivelEstres >= 70
}

fun main() {

    val usuario = UsuarioTherAppy(
        "Miky",
        28
    )

    println(usuario.nombre)
    println(usuario.edad)

    val perfil = PerfilEmocional(
        "Luis",
        75
    )

    println(perfil.mostrarEstado())

    println(
        "¿Necesita apoyo emocional?: ${
            perfil.necesitaApoyo()
        }"
    )
}