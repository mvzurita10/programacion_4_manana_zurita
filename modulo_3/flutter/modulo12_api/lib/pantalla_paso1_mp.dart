import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'producto_dto_mp.dart';
import 'producto_mp.dart';

class PantallaPaso1Mp extends StatefulWidget {
  const PantallaPaso1Mp({super.key});

  @override
  State<PantallaPaso1Mp> createState() => _PantallaPaso1MpState();
}

class _PantallaPaso1MpState extends State<PantallaPaso1Mp> {
  Future<List<FraseRelajacion>>? _futureFrases;

  Future<List<FraseRelajacion>> _fetchFrases() async {
    final response = await http.get(Uri.parse('https://zenquotes.io/api/quotes'));
    if (response.statusCode == 200) {
      final List decodificado = jsonDecode(response.body);
      return decodificado.map((json) => FraseRelajacion.fromDTO(FraseDTO.fromJson(json))).toList();
    } else {
      throw Exception('Fallo al cargar las frases');
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Frases de Relajación')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: () {
                setState(() {
                  _futureFrases = _fetchFrases();
                });
              },
              icon: const Icon(Icons.download),
              label: const Text('Obtener Frases'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _futureFrases == null
                  ? const Text('Presiona el botón para buscar frases.')
                  : FutureBuilder<List<FraseRelajacion>>(
                      future: _futureFrases,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}', style: TextStyle(color: cs.error));
                        } else if (snapshot.hasData) {
                          final frases = snapshot.data!;
                          return ListView.builder(
                            itemCount: frases.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const Icon(Icons.format_quote, color: Colors.teal),
                                title: Text(frases[index].texto, style: const TextStyle(fontStyle: FontStyle.italic)),
                                subtitle: Text('- ${frases[index].autor}'),
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
