// Solo lectura: el estado emocional inicial no puede cambiar
class EstadoEmocional(
    val nivelCalma: Double,
    val nivelEstres: Double
)

// Lectura y escritura: el progreso emocional puede modificarse
class ProgresoTherAppy(
    var sesionesCompletadas: Int = 0
) {

    fun completarSesion() {
        sesionesCompletadas++
    }

    fun reiniciarProgreso() {
        sesionesCompletadas = 0
    }
}

// Sin val/var: parámetro del constructor, NO propiedad
class UsuarioTemporal(nombre: String) {

    val nombreMayusculas = nombre.uppercase()

    // nombre solo existe dentro de la clase
}

fun main() {

    println("TherAppy - Propiedades y Constructores")

    val estado = EstadoEmocional(
        nivelCalma = 75.0,
        nivelEstres = 25.0
    )

    println("Nivel de calma: ${estado.nivelCalma}")
    println("Nivel de estres: ${estado.nivelEstres}")

    println("\nSeguimiento de progreso")

    val progreso = ProgresoTherAppy()

    progreso.completarSesion()
    progreso.completarSesion()

    println(
        "Sesiones completadas: ${
            progreso.sesionesCompletadas
        }"
    )

    progreso.reiniciarProgreso()

    println(
        "Sesiones despues del reinicio: ${
            progreso.sesionesCompletadas
        }"
    )

    println("\nUsuario temporal")

    val usuario = UsuarioTemporal("Miky")

    println(usuario.nombreMayusculas)

    // println(usuario.nombre)
    // ERROR: nombre no es una propiedad
}