// THERAPPY

// Sealed Class: define todos los tipos posibles de alertas emocionales
sealed class AlertaTherAppy(
    val titulo: String,
    val mensaje: String
) {

    abstract fun formatear(): String

    data class RecordatorioActividad(
        val usuario: String,
        val actividad: String,
        val detalle: String
    ) : AlertaTherAppy(
        "Recordatorio de Actividad",
        detalle
    ) {

        override fun formatear(): String =
            "Recordatorio para $usuario\n" +
            "Actividad: $actividad\n" +
            mensaje
    }

    data class AlertaEstres(
        val usuario: String,
        val nivelEstres: Int
    ) : AlertaTherAppy(
        "Nivel de Estres Detectado",
        ""
    ) {

        override fun formatear(): String =
            "$usuario presenta un nivel de estres de $nivelEstres/10"
    }

    data class MensajeMotivacional(
        val usuario: String,
        val frase: String
    ) : AlertaTherAppy(
        "Mensaje Motivacional",
        frase
    ) {

        override fun formatear(): String =
            "Para $usuario:\n$frase"
    }

    object Silenciosa : AlertaTherAppy("", "") {

        override fun formatear(): String =
            "Alerta silenciosa de TherAppy"
    }
}

// Contrato para enviar alertas
interface EnviadorAlerta {

    val nombre: String

    fun enviar(
        alerta: AlertaTherAppy
    ): Boolean
}

// Servicio App
class ServicioApp : EnviadorAlerta {

    override val nombre = "Aplicacion"

    override fun enviar(
        alerta: AlertaTherAppy
    ): Boolean {

        println("Enviando alerta dentro de TherAppy")
        return true
    }
}

// Servicio Email
class ServicioCorreo : EnviadorAlerta {

    override val nombre = "Correo"

    override fun enviar(
        alerta: AlertaTherAppy
    ): Boolean {

        if (
            alerta !is AlertaTherAppy.MensajeMotivacional
        ) {
            return false
        }

        println("Correo enviado a ${alerta.usuario}")

        return true
    }
}

// Encapsulamiento
class GestorAlertas(

    private val servicios: List<EnviadorAlerta>

) {

    fun enviar(
        alerta: AlertaTherAppy
    ) {

        println(alerta.formatear())

        val exito =
            servicios.any {
                it.enviar(alerta)
            }

        if (!exito) {
            println("No existe servicio disponible")
        }

        println()
    }
}

fun main() {

    val gestor = GestorAlertas(

        listOf(
            ServicioApp(),
            ServicioCorreo()
        )
    )

    listOf(

        AlertaTherAppy.RecordatorioActividad(
            "Miky",
            "Meditacion Guiada",
            "Tienes una sesion pendiente para hoy."
        ),

        AlertaTherAppy.AlertaEstres(
            "Miky",
            8
        ),

        AlertaTherAppy.MensajeMotivacional(
            "Miky",
            "Cada pequeño avance cuenta. Sigue adelante"
        ),

        AlertaTherAppy.Silenciosa

    ).forEach {

        gestor.enviar(it)
    }
}