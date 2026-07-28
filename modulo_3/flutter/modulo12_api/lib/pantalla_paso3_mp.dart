import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'producto_dto_mp.dart';
import 'producto_mp.dart';

class PantallaPaso3Mp extends StatelessWidget {
  const PantallaPaso3Mp({super.key});

  Future<List<FraseRelajacion>> _cargarConsejos() async {
    final response = await http.get(Uri.parse('https://zenquotes.io/api/quotes'));
    if (response.statusCode == 200) {
      final List decodificado = jsonDecode(response.body);
      return decodificado.map((json) => FraseRelajacion.fromDTO(FraseDTO.fromJson(json))).toList();
    } else {
      throw Exception('Error al conectar con la API de frases.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Directorio de Consejos')),
      body: FutureBuilder<List<FraseRelajacion>>(
        future: _cargarConsejos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay consejos disponibles en este momento.'));
          }

          final frases = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async {
              // Simulamos la recarga en un StatelessWidget
              // Para una app real usaríamos Riverpod o setState
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: frases.length,
              itemBuilder: (context, index) {
                final frase = frases[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.teal.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal.shade50,
                      child: const Icon(Icons.psychology, color: Colors.teal),
                    ),
                    title: Text(
                      '"${frase.texto}"',
                      style: const TextStyle(fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('- ${frase.autor}', style: TextStyle(color: Colors.grey.shade700)),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
