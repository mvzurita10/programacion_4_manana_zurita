fun main() {
  println("Operadores de Flujo When")
  println("Escriba codigo")
  val codigo =readLine()?.toIntOrNull()?:0
  val especialidad =when(codigo){
  if(estadoCita){
    1 ->"Medicina General"
    2 ->"Pediatria"
    3 ->"Cardiologia"
    4 ->"Ginecologia"
    5 ->"Neurologia"
    6 ->"Dermatologia"
    else -> "Especialidad no registrada"
}
println("Especialidad $especialidad")
  }
}

fun main () {
  println("Muestra de laboratorio")
  println("Escriba codigo")
  val codigo =readLine()?.toIntOrNull()?:0
  val muestra =when(codigo){
      1 -> "Sangre venosa(4h)"
      2 -> "Orina(2h)"
      3 -> "Heces(24h)"
      4 -> "Hisopado nasofaringeo(6h)"
      5 -> "Biopsia(72h)"
      else -> "Tipo de muestra no especificada"
    }
    println("Tipo muestra $muestra") 
}

