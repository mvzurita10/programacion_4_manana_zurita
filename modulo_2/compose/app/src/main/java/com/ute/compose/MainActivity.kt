// MainActivity.kt
package com.ute.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import com.ute.compose.ui.screens.*
import com.ute.compose.ui.material3.*

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // Componentes basicos Nativos:
                // S01_SaludoScreen()
                // S02_TextScreen()
                // S03_ButtonScreen()
                // S04_LayoutScreen()
                // S05_ModifierScreen()
                // S06_EstadoScreen()
                // S07_StateHoistingScreen()
                // S08_BienvenidaScreen()

                // Componenetes Material 3:
                // Paso01_TextFieldScreen()
                // Paso02_CardScreen()
                // Paso03_LazyColumnScreen()
                // Paso04_ScaffoldScreen()
                // Paso05_NavBarScreen()
                // Paso06_DialogosScreen()   // ← paso activo

            }
        }
    }
}