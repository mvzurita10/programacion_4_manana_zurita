import 'dart:async';
import 'package:flutter/material.dart';

class RelojMp extends StatefulWidget {
  const RelojMp({super.key});

  @override
  State<RelojMp> createState() => _RelojMpState();
}

class _RelojMpState extends State<RelojMp> {
  late Timer _timer;
  int  _segundos = 0;
  bool _pausado  = false;

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _segundos++);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer.cancel();
      } else {
        _iniciarTimer();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get _faseRespiracion {
    final ciclo = _segundos % 19; // 4 inhala, 7 retiene, 8 exhala
    if (ciclo < 4) return 'Inhala profundamente...';
    if (ciclo < 11) return 'Sostén la respiración...';
    return 'Exhala lentamente...';
  }

  String get _formato {
    final m = (_segundos % 3600) ~/ 60;
    final s = _segundos % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  Color get _colorFase {
    final ciclo = _segundos % 19;
    if (ciclo < 4) return Colors.lightBlue; // Inhala
    if (ciclo < 11) return Colors.indigoAccent; // Retiene
    return Colors.teal; // Exhala
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _colorFase.withOpacity(0.1),
            border: Border.all(color: _colorFase, width: 4),
          ),
          child: Text(
            _formato,
            style: TextStyle(
              fontSize:   40,
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
              color:      _colorFase,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          _pausado ? 'Ejercicio pausado' : _faseRespiracion,
          style: TextStyle(fontSize: 18, color: Colors.blueGrey.shade700, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon:  Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar' : 'Pausar'),
              style: FilledButton.styleFrom(backgroundColor: Colors.teal),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() {
                _timer.cancel();
                _segundos = 0;
                _pausado  = false;
                _iniciarTimer();
              }),
              child: const Text('Reiniciar'),
            ),
          ],
        ),
      ],
    );
  }
}
