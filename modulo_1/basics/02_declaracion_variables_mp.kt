fun main() {
    // Datos no mutables (información del usuario)
    val nombre = "Ana"
    val emocionActual = "Ansiedad"
    val nivelCalma = 3.14  

    // Datos mutables (progreso emocional)
    var sesionesRespiracion = 0
    sesionesRespiracion = sesionesRespiracion + 1
    println("Sesiones de respiracion realizadas: $sesionesRespiracion")

    sesionesRespiracion = sesionesRespiracion
    println("Mantienes tu progreso en: $sesionesRespiracion sesion(es)")

    println("$nombre está trabajando en su emocion: $emocionActual")
    println("Nivel de calma actual: $nivelCalma")
}