object ConfiguracionTherAppy {

    val servidor: String = "api.therappy.com"
    val puerto: Int = 443

    // Nunca exponer credenciales
    private val tokenApi: String = "therappy-secreto-123"

    fun baseUrl() = "https://$servidor:$puerto"

    fun encabezados() = mapOf(
        "Authorization" to "Bearer $tokenApi"
    )
}

class UsuarioTherAppy private constructor(
    val id: Int,
    val nombre: String
) {

    companion object {

        private var contadorId = 0

        // Factory Method
        fun crear(
            nombre: String,
            correo: String
        ): UsuarioTherAppy? {

            if (
                nombre.isBlank() ||
                !correo.contains("@")
            ) {
                return null
            }

            return UsuarioTherAppy(
                ++contadorId,
                nombre.trim()
            )
        }

        const val PLAN_DEFECTO = "Basico"
    }

    override fun toString(): String {
        return "UsuarioTherAppy(id=$id, nombre=$nombre)"
    }
}

fun main() {

    println("TherAppy")

    println("URL Base:")
    println(ConfiguracionTherAppy.baseUrl())

    // println(ConfiguracionTherAppy.tokenApi)
    // ERROR: privado

    val usuario = UsuarioTherAppy.crear(
        "Miky Zurita",
        "miky@therappy.com"
    )

    println(usuario)

    println(
        "Plan por defecto: ${
            UsuarioTherAppy.PLAN_DEFECTO
        }"
    )
}