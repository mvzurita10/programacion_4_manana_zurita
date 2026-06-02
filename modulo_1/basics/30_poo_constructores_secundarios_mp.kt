class PlanBienestar(
    val sesiones: Double,
    val minutosPorSesion: Double
) {

    val tiempoTotal: Double
        get() = sesiones * minutosPorSesion

    val tiempoSemanal: Double
        get() = tiempoTotal * 7

    // Constructor para un plan equilibrado
    constructor(minutos: Double) : this(5.0, minutos)

    // Constructor usando enteros
    constructor(sesiones: Int, minutos: Int) :
            this(sesiones.toDouble(), minutos.toDouble())

    override fun toString() =
        "PlanBienestar(${sesiones} sesiones x ${minutosPorSesion} min) | Tiempo Total = ${tiempoTotal} min"
}

fun main() {

    val plan1 = PlanBienestar(5.0, 10.0)

    val plan2 = PlanBienestar(15.0)

    val plan3 = PlanBienestar(7, 20)

    println(plan1)
    println(plan2)
    println(plan3)

    println("\nTiempo semanal del Plan 1:")
    println("${plan1.tiempoSemanal} minutos")
}