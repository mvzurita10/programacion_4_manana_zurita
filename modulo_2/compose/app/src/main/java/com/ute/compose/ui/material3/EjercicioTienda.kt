package com.ute.compose.ui.material3

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ShoppingCart
import androidx.compose.material.icons.filled.AttachMoney
import androidx.compose.material.icons.filled.Numbers
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun CompraTiendaScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {

        Text(
            "Ejercicio: Compra en una tienda",
            style = MaterialTheme.typography.titleMedium
        )

        HorizontalDivider()

        CompraTienda()
    }
}

@Composable
private fun CompraTienda() {

    var producto by remember { mutableStateOf("") }
    var cantidad by remember { mutableStateOf("0") }
    var precio by remember { mutableStateOf("0") }

    var subtotal by remember { mutableStateOf("0") }
    var descuentoTexto by remember { mutableStateOf("0%") }
    var total by remember { mutableStateOf("0") }

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            "Datos de la compra",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )

        // Producto
        OutlinedTextField(
            value = producto,
            onValueChange = { producto = it },
            label = { Text("Nombre del producto") },
            leadingIcon = {
                Icon(
                    Icons.Default.ShoppingCart,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Cantidad
        OutlinedTextField(
            value = cantidad,
            onValueChange = { cantidad = it },
            label = { Text("Cantidad comprada") },
            leadingIcon = {
                Icon(
                    Icons.Default.Numbers,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Precio
        OutlinedTextField(
            value = precio,
            onValueChange = { precio = it },
            label = { Text("Precio unitario") },
            leadingIcon = {
                Icon(
                    Icons.Default.AttachMoney,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Botón
        Button(
            onClick = {

                val cantidadInt = cantidad.toIntOrNull() ?: 0
                val precioInt = precio.toIntOrNull() ?: 0

                val subtotalCalculado = cantidadInt * precioInt

                var descuento = 0.0

                if (subtotalCalculado > 50) {
                    descuento = subtotalCalculado * 0.10
                    descuentoTexto = "10%"
                } else if (subtotalCalculado in 20..50) {
                    descuento = subtotalCalculado * 0.05
                    descuentoTexto = "5%"
                } else {
                    descuento = 0.0
                    descuentoTexto = "0%"
                }

                val totalPagar = subtotalCalculado - descuento

                subtotal = subtotalCalculado.toString()
                total = totalPagar.toString()
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Calcular")
        }

        // Resultados
        Text("Producto: $producto")
        Text("Subtotal: $subtotal")
        Text("Descuento aplicado: $descuentoTexto")
        Text("Total a pagar: $total")
    }
}

@Preview(showBackground = true)
@Composable
fun CompraTiendaPreview() {
    MaterialTheme {
        CompraTiendaScreen()
    }
}