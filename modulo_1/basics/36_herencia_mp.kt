// Sin open — no se puede heredar
class ActividadSimple(val nombre: String)

// class Meditacion : ActividadSimple("Meditación")
// ERROR: ActividadSimple es final

// Clase base para todas las actividades de TherAppy
open class ActividadBienestar(
    val nombre: String,
    val mensaje: String
) {

    // Puede ser sobrescrito
    open fun realizarActividad() {
        println("$nombre: $mensaje")
    }

    open fun descripcion() =
        "Actividad: $nombre"

    // No puede sobrescribirse
    fun iniciarSesion() {
        println("Iniciando actividad: $nombre")
    }
}

// Hereda de ActividadBienestar
class Meditacion(nombre: String) :
    ActividadBienestar(
        nombre,
        "Respira profundamente y relajate"
    ) {

    override fun realizarActividad() {
        super.realizarActividad()
        println("Manten tu atencion en la respiracion")
    }

    override fun descripcion() =
        "${super.descripcion()} - Sesion de Meditacion"
}

// Otra subclase
class RespiracionGuiada(
    nombre: String,
    val duracionMinutos: Int
) : ActividadBienestar(
    nombre,
    "Sigue el ritmo de inhalacion y exhalacion"
) {

    override fun descripcion() =
        "${super.descripcion()} - Respiracion Guiada de $duracionMinutos minutos"
}

fun main() {

    val meditacion = Meditacion(
        "Meditacion Matutina"
    )

    meditacion.realizarActividad()

    /*
    Meditación Matutina:
    Respira profundamente y relajate

    🧘 Mantén tu atención en la respiracion
    */

    val respiracion = RespiracionGuiada(
        "Respiracion Antiestres",
        10
    )

    println(respiracion.descripcion())

    meditacion.iniciarSesion()
}