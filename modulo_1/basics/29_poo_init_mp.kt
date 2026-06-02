class UsuarioTherAppy(
    val nombre: String,
    val correo: String
) {

    val nombreNormalizado: String
    val proveedorCorreo: String

    init {

        // Validaciones antes de crear el objeto
        require(nombre.isNotBlank()) {
            "El nombre no puede estar vacio"
        }

        require(correo.contains("@")) {
            "Correo invalido: $correo"
        }

        nombreNormalizado = nombre.trim().lowercase()
        proveedorCorreo = correo.substringAfter("@")
    }
}

fun main() {

    println("TherAppy - Registro de Usuario")

    val usuario = UsuarioTherAppy(
        "  Miky Zurita  ",
        "miky@therappy.com"
    )

    println("Nombre normalizado:")
    println(usuario.nombreNormalizado)

    println("Proveedor de correo:")
    println(usuario.proveedorCorreo)

    // Ejemplo que produciría error:
    // val usuario2 = UsuarioTherAppy("", "correoinvalido")
}