fun main() {

    println("TherAppy - Utilidades de Listas")

    val nivelesEstres = listOf(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)

    println("Niveles de estres:")
    println(nivelesEstres)

    println("\nMAP")

    val nivelesRecuperacion = nivelesEstres.map { it / 2 }
    println("Despues de una sesion de TherAppy:")
    println(nivelesRecuperacion)

    val reportes = nivelesEstres.map { "Estres: $it" }
    println(reportes)

    println("\nFILTER")

    val estresAlto = nivelesEstres.filter { it >= 70 }
    println("Estres alto:")
    println(estresAlto)

    val estresModerado = nivelesEstres.filter { it in 40..60 }
    println("Estres moderado:")
    println(estresModerado)

    val estresAltoPar = nivelesEstres.filter {
        it >= 70 && it % 2 == 0
    }
    println(estresAltoPar)

    val estresBajo = nivelesEstres.filterNot {
        it >= 50
    }
    println(estresBajo)

    val mezcla = listOf(
        "Ansiedad",
        80,
        "Calma",
        true,
        "Estres",
        60
    )

    val emociones = mezcla.filterIsInstance<String>()
    println(emociones)

    println("\nREDUCE")

    val registros = listOf(20, 30, 40, 50, 60)

    val totalEstres = registros.reduce { acumulado, valor ->
        acumulado + valor
    }

    println("Total estres acumulado:")
    println(totalEstres)

    val multiplicador = registros.reduce { acumulado, valor ->
        acumulado * valor
    }

    println(multiplicador)

    println("\nFOLD")

    val sumaFold = registros.fold(100) { acumulado, valor ->
        acumulado + valor
    }

    println(sumaFold)

    val productoFold = registros.fold(2) { acumulado, valor ->
        acumulado * valor
    }

    println(productoFold)

    println("\nORDENAMIENTO")

    println("Ascendente: ${nivelesEstres.sorted()}")
    println("Descendente: ${nivelesEstres.sortedDescending()}")
    println("Orden personalizado: ${nivelesEstres.sortedBy { -it }}")

    println("\nAGREGACION")

    println("Suma: ${nivelesEstres.sum()}")
    println("Promedio: ${nivelesEstres.average()}")
    println("Minimo: ${nivelesEstres.minOrNull()}")
    println("Maximo: ${nivelesEstres.maxOrNull()}")
    println("Cantidad mayores a 50: ${nivelesEstres.count { it > 50 }}")

    println("\nBUSQUEDA")

    println("Primer nivel mayor a 50: ${nivelesEstres.find { it > 50 }}")

    println(
        "Ultimo nivel mayor a 50: ${
            nivelesEstres.findLast { it > 50 }
        }"
    )

    println(
        "¿Existe algun nivel critico?: ${
            nivelesEstres.any { it >= 90 }
        }"
    )

    println(
        "¿Todos son positivos?: ${
            nivelesEstres.all { it > 0 }
        }"
    )

    println(
        "¿Ninguno supera 120?: ${
            nivelesEstres.none { it > 120 }
        }"
    )
}