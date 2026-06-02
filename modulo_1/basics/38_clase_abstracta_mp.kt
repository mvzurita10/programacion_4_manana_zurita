abstract class ActividadBienestar(
    val nombre: String
) {

    // Las subclases DEBEN implementar estas propiedades
    abstract val beneficio: Double
    abstract val duracion: Int

    abstract fun descripcion(): String

    // Método reutilizable
    fun comparar(
        otra: ActividadBienestar
    ): String = when {

        beneficio > otra.beneficio ->
            "$nombre genera mas beneficio que ${otra.nombre}"

        beneficio < otra.beneficio ->
            "$nombre genera menos beneficio que ${otra.nombre}"

        else ->
            "$nombre y ${otra.nombre} generan el mismo beneficio"
    }

    override fun toString(): String =
        "${descripcion()} | Beneficio: ${"%.1f".format(beneficio)}"
}

// Actividad 1
class Meditacion(
    private val minutos: Int
) : ActividadBienestar("Meditacion") {

    override val beneficio: Double
        get() = minutos * 1.5

    override val duracion: Int
        get() = minutos

    override fun descripcion() =
        "Meditacion de $minutos minutos"
}

// Actividad 2
class RespiracionGuiada(
    private val ciclos: Int
) : ActividadBienestar("Respiracion Guiada") {

    override val beneficio: Double
        get() = ciclos * 2.0

    override val duracion: Int
        get() = ciclos

    override fun descripcion() =
        "Respiracion guiada con $ciclos ciclos"
}

// Actividad 3
class DiarioEmocional(
    private val reflexiones: Int
) : ActividadBienestar("Diario Emocional") {

    override val beneficio: Double
        get() = reflexiones * 3.0

    override val duracion: Int
        get() = reflexiones * 2

    override fun descripcion() =
        "Diario emocional con $reflexiones reflexiones"
}

fun main() {

    // POLIMORFISMO
    val actividades: List<ActividadBienestar> = listOf(

        Meditacion(15),

        RespiracionGuiada(10),

        DiarioEmocional(8)
    )

    actividades.forEach {

        println(it)
    }

    val mejorActividad =
        actividades.maxByOrNull {
            it.beneficio
        }

    println(
        "\n🌿 Actividad con mayor beneficio: ${
            mejorActividad?.nombre
        }"
    )

    println(
        actividades[0].comparar(
            actividades[1]
        )
    )
}