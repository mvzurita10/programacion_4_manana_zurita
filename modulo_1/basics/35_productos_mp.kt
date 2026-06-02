data class CategoriaActividad(
    val id: Int,
    val nombre: String
)

data class ActividadTherAppy(
    val id: Int,
    val nombre: String,
    val duracion: Int, // minutos
    val nivelDificultad: Int,
    val categoria: CategoriaActividad,
    val activa: Boolean = true
) {

    val disponible: Boolean
        get() = activa

    val nivelRecomendado: String
        get() = when {
            nivelDificultad <= 3 -> "Principiante"
            nivelDificultad <= 7 -> "Intermedio"
            else -> "Avanzado"
        }

    fun ajustarDuracion(minutos: Int): ActividadTherAppy {

        require(minutos > 0) {
            "La duracion debe ser mayor a cero"
        }

        return copy(duracion = minutos)
    }
}

object CatalogoTherAppy {

    private val categorias = mutableListOf(
        CategoriaActividad(1, "Meditacion"),
        CategoriaActividad(2, "Respiracion"),
        CategoriaActividad(3, "Mindfulness")
    )

    private val actividades = mutableListOf<ActividadTherAppy>()

    private var siguienteId = 1

    fun agregarActividad(
        nombre: String,
        duracion: Int,
        dificultad: Int,
        categoriaId: Int
    ): ActividadTherAppy? {

        val categoria =
            categorias.find { it.id == categoriaId }
                ?: return null

        val actividad = ActividadTherAppy(
            siguienteId++,
            nombre,
            duracion,
            dificultad,
            categoria
        )

        actividades.add(actividad)

        return actividad
    }

    fun listar(): List<ActividadTherAppy> =
        actividades.toList()

    fun disponibles(): List<ActividadTherAppy> =
        actividades.filter { it.disponible }

    fun porCategoria(id: Int): List<ActividadTherAppy> =
        actividades.filter {
            it.categoria.id == id
        }

    fun buscar(nombre: String): List<ActividadTherAppy> =
        actividades.filter {
            it.nombre.contains(
                nombre,
                ignoreCase = true
            )
        }
}

fun main() {

    CatalogoTherAppy.agregarActividad(
        "Meditacion Guiada",
        15,
        3,
        1
    )

    CatalogoTherAppy.agregarActividad(
        "Respiracion Profunda",
        10,
        2,
        2
    )

    CatalogoTherAppy.agregarActividad(
        "Mindfulness Diario",
        20,
        5,
        3
    )

    CatalogoTherAppy.agregarActividad(
        "Meditacion Avanzada",
        30,
        8,
        1
    )

    println("ACTIVIDADES DE THERAPPY")

    for (actividad in CatalogoTherAppy.listar()) {

        println(
            "${actividad.nombre} - " +
            "${actividad.duracion} min - " +
            "${actividad.nivelRecomendado}"
        )
    }

    println("\nACTIVIDADES DISPONIBLES")

    CatalogoTherAppy.disponibles().forEach {

        println(
            "${it.nombre}"
        )
    }

    println("\nBUSQUEDA: Meditacion")

    CatalogoTherAppy.buscar("Meditacion")
        .forEach {

            println(it.nombre)
        }

    println("\nACTIVIDADES AJUSTADAS")

    CatalogoTherAppy.disponibles()
        .map { it.ajustarDuracion(it.duracion + 5) }
        .forEach {

            println(
                "${it.nombre}: ${it.duracion} min"
            )
        }
}