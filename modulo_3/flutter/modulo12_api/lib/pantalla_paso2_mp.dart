import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'producto_dto_mp.dart';
import 'producto_mp.dart';

class PantallaPaso2Mp extends StatefulWidget {
  const PantallaPaso2Mp({super.key});

  @override
  State<PantallaPaso2Mp> createState() => _PantallaPaso2MpState();
}

class _PantallaPaso2MpState extends State<PantallaPaso2Mp> {
  List<FraseRelajacion> _frases = [];
  bool _cargando = false;
  String? _error;

  Future<void> _cargarConsejos() async {
    setState(() {
      _cargando = true;
      _error = null;
    });

    try {
      final response = await http.get(Uri.parse('https://zenquotes.io/api/quotes'));
      if (response.statusCode == 200) {
        final List decodificado = jsonDecode(response.body);
        setState(() {
          _frases = decodificado.map((json) => FraseRelajacion.fromDTO(FraseDTO.fromJson(json))).toList();
        });
      } else {
        setState(() { _error = 'Error de conexión HTTP: ${response.statusCode}'; });
      }
    } catch (e) {
      setState(() { _error = 'Fallo la red: $e'; });
    } finally {
      setState(() { _cargando = false; });
    }
  }

  @override
  void initState() {
    super.initState();
    _cargarConsejos();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Consejos Diarios')),
      body: _cargando
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 48, color: cs.error),
                      const SizedBox(height: 16),
                      Text(_error!, style: TextStyle(color: cs.error)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _cargarConsejos,
                        child: const Text('Reintentar'),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: _frases.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final frase = _frases[index];
                    return Card(
                      color: Colors.teal.shade50,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Icon(Icons.self_improvement, size: 32, color: Colors.teal),
                            const SizedBox(height: 8),
                            Text(
                              '"${frase.texto}"',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '- ${frase.autor}',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
