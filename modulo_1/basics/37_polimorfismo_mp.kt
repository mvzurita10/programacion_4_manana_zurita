// La interfaz define QUÉ puede hacer una actividad emocional
interface ActividadEmocional {

    fun realizar(): Boolean

    val nombre: String
}

// Implementación 1
class MeditacionGuiada : ActividadEmocional {

    override val nombre = "Meditacion Guiada"

    override fun realizar(): Boolean {
        println("Iniciando sesion de meditacion durante 10 minutos")
        return true
    }
}

// Implementación 2
class RespiracionProfunda : ActividadEmocional {

    override val nombre = "Respiracion Profunda"

    override fun realizar(): Boolean {
        println("Realizando ejercicio de respiracion 4-4-4")
        return true
    }
}

// Implementación 3
class DiarioEmocional : ActividadEmocional {

    override val nombre = "Diario Emocional"

    override fun realizar(): Boolean {
        println("Registrando emociones del dia")
        return true
    }
}

// Implementación 4
class Mindfulness(val minutos: Int) : ActividadEmocional {

    override val nombre = "Mindfulness"

    override fun realizar(): Boolean {
        println("Practicando mindfulness durante $minutos minutos")
        return true
    }
}

// Esta función no sabe qué actividad recibe
// Solo sabe que implementa ActividadEmocional
fun iniciarActividad(
    actividad: ActividadEmocional
) {

    println("Iniciando actividad: ${actividad.nombre}")

    val completada = actividad.realizar()

    println(
        if (completada)
            "Actividad completada"
        else
            "Actividad incompleta"
    )

    println()
}

fun main() {

    val actividades: List<ActividadEmocional> = listOf(

        MeditacionGuiada(),

        RespiracionProfunda(),

        DiarioEmocional(),

        Mindfulness(15)
    )

    // Polimorfismo
    actividades.forEach {

        iniciarActividad(it)
    }

    println("Lista de actividades")

    for (actividad in actividades) {

        println(actividad.nombre)
    }
}