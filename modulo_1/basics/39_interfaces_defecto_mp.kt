interface SerializableTherAppy {

    val id: String

    fun serializar(): String

    val version: Int
        get() = 1
}

interface ValidableTherAppy {

    val errores: List<String>

    val esValido: Boolean
        get() = errores.isEmpty()

    fun validar(): Boolean

    fun imprimirErrores() {

        if (errores.isEmpty()) {
            println("Sin errores")
        } else {
            errores.forEach {
                println("$it")
            }
        }
    }
}

// Una evaluación emocional implementa ambas interfaces
data class EvaluacionEmocional(

    override val id: String,

    val usuario: String,

    val emocion: String,

    val nivelEstres: Int

) : SerializableTherAppy, ValidableTherAppy {

    override fun serializar(): String {

        return "$id|$usuario|$emocion|$nivelEstres"
    }

    override val errores: List<String>
        get() = buildList {

            if (usuario.isBlank()) {
                add("El nombre del usuario no puede estar vacio")
            }

            if (emocion.isBlank()) {
                add("Debe indicar una emocion")
            }

            if (nivelEstres !in 1..10) {
                add("El nivel de estres debe estar entre 1 y 10")
            }
        }

    override fun validar(): Boolean = esValido
}

fun main() {

    val evaluacion1 = EvaluacionEmocional(
        "EV001",
        "Miky",
        "Ansiedad",
        8
    )

    val evaluacion2 = EvaluacionEmocional(
        "EV002",
        "",
        "",
        15
    )

    // Polimorfismo
    fun procesarSerializable(
        objeto: SerializableTherAppy
    ) {

        println("${objeto.serializar()}")
    }

    fun procesarValidacion(
        objeto: ValidableTherAppy
    ) {

        println("¿Es valido?: ${objeto.esValido}")

        objeto.imprimirErrores()
    }

    println("===== EVALUACION 1 =====")

    procesarSerializable(evaluacion1)

    procesarValidacion(evaluacion1)

    println()

    println("===== EVALUACION 2 =====")

    procesarSerializable(evaluacion2)

    procesarValidacion(evaluacion2)
}