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