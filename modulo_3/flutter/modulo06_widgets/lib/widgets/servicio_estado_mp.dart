import 'package:flutter/material.dart';

class ServicioEstadoMp extends StatefulWidget {
  final String nombre;
  const ServicioEstadoMp({super.key, required this.nombre});

  @override
  State<ServicioEstadoMp> createState() => _ServicioEstadoMpState();
}

class _ServicioEstadoMpState extends State<ServicioEstadoMp> {
  bool _enCalma   = true;
  int  _alertas   = 0;
  String _nivel   = 'calma';

  static const int _maxAlertas = 3;

  void _toggle() {
    setState(() {
      _enCalma = !_enCalma;
      if (!_enCalma) {
        _alertas++;
        if (_alertas >= 3) {
          _nivel = 'crisis';
        } else if (_alertas >= 2) {
          _nivel = 'ansiedad_alta';
        } else {
          _nivel = 'ansiedad_leve';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _alertas >= _maxAlertas;
    final colorIcono = _enCalma
        ? Colors.green
        : _nivel == 'crisis'
            ? Colors.red
            : _nivel == 'ansiedad_alta'
                ? Colors.deepOrange
                : Colors.orange;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _enCalma ? Icons.favorite : Icons.warning_rounded,
            size:  72,
            color: colorIcono,
          ),
          const SizedBox(height: 8),

          Text(widget.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

          Text(
            _enCalma ? 'En calma' : 'Alerta de Ansiedad',
            style: TextStyle(
              fontSize:   16,
              fontWeight: FontWeight.w600,
              fontStyle:  _enCalma ? FontStyle.normal : FontStyle.italic,
              color:      _enCalma ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 16),

          if (!_enCalma)
            Container(
              margin:     const EdgeInsets.only(bottom: 16),
              padding:    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color:        Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border:       Border.all(color: Colors.orange.shade300),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.self_improvement, color: Colors.deepOrange, size: 16),
                  SizedBox(width: 6),
                  Text('Se recomienda ejercicio de respiración',
                      style: TextStyle(color: Colors.deepOrange, fontSize: 13)),
                ],
              ),
            ),

          ElevatedButton.icon(
            onPressed: enLimite ? null : _toggle,
            icon: Icon(_enCalma ? Icons.warning_amber : Icons.favorite),
            label: Text(_enCalma ? 'Reportar Ansiedad' : 'Volver a la Calma'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _enCalma ? Colors.orange.shade600 : Colors.green.shade600,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              setState(() {
                _enCalma = true;
                _alertas = 0;
                _nivel = 'calma';
              });
            },
            child: const Text('Reiniciar Estado Emocional'),
          ),
          const SizedBox(height: 12),

          Opacity(
            opacity: enLimite ? 0.1 : 1.0,
            child: Text(
              'Episodios registrados: $_alertas / $_maxAlertas',
              style: TextStyle(
                fontSize: 13,
                color:    enLimite ? Colors.red : Colors.grey.shade600,
              ),
            ),
          ),

          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Límite de episodios alcanzado. Por favor, busca apoyo profesional.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, color: Colors.red.shade700, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
