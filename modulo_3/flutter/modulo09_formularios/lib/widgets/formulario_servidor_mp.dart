import 'package:flutter/material.dart';

class FormularioServidorMp extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioServidorMp({super.key, required this.onGuardar});

  @override
  State<FormularioServidorMp> createState() => _FormularioServidorMpState();
}

class _FormularioServidorMpState extends State<FormularioServidorMp> {
  final _formKey  = GlobalKey<FormState>();

  final _ctrlPensamiento = TextEditingController();
  final _ctrlIntensidad  = TextEditingController(text: '5');

  final _focusIntensidad = FocusNode();

  String _emocion        = 'Ansiedad';
  String _desencadenante = 'Trabajo';
  bool   _tecnicaAplicada = false;

  @override
  void dispose() {
    _ctrlPensamiento.dispose();
    _ctrlIntensidad.dispose();
    _focusIntensidad.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'pensamiento':  _ctrlPensamiento.text,
      'intensidad':   _ctrlIntensidad.text,
      'emocion':      _emocion,
      'desencadenante': _desencadenante,
      'tecnicaAplicada': _tecnicaAplicada.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Pensamiento recurrente
          TextFormField(
            controller:      _ctrlPensamiento,
            decoration:      const InputDecoration(
              labelText:  'Pensamiento o situación',
              hintText:   'Siento que no podré terminar a tiempo...',
              prefixIcon: Icon(Icons.psychology),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusIntensidad.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El pensamiento es obligatorio';
              if (v.length < 5)                  return 'Por favor, da más detalles (mín 5 caracteres)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Intensidad
          TextFormField(
            controller:      _ctrlIntensidad,
            focusNode:       _focusIntensidad,
            decoration:      const InputDecoration(
              labelText:  'Intensidad del sentimiento (1-10)',
              prefixIcon: Icon(Icons.monitor_heart),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.done,
            validator: (v) {
              final intensidad = int.tryParse(v ?? '');
              if (intensidad == null)              return 'Debe ser un número';
              if (intensidad < 1 || intensidad > 10) return 'Intensidad entre 1 y 10';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Emoción
          DropdownButtonFormField<String>(
            value:      _emocion,
            decoration: const InputDecoration(
              labelText:  'Emoción principal',
              prefixIcon: Icon(Icons.mood_bad),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Ansiedad', 'Tristeza', 'Enojo', 'Alegría', 'Miedo', 'Frustración'
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _emocion = v!),
          ),
          const SizedBox(height: 12),

          // Desencadenante
          DropdownButtonFormField<String>(
            initialValue:      _desencadenante,
            decoration: const InputDecoration(
              labelText:  'Desencadenante',
              prefixIcon: Icon(Icons.bolt),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Trabajo', 'Familia', 'Social', 'Salud', 'Finanzas', 'Otro'
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _desencadenante = v!),
          ),
          const SizedBox(height: 12),

          // Técnica Aplicada
          SwitchListTile(
            title:     const Text('¿Aplicaste técnica de calma?'),
            subtitle:  const Text('Respiración, meditación, etc.'),
            value:     _tecnicaAplicada,
            onChanged: (v) => setState(() => _tecnicaAplicada = v),
            secondary: const Icon(Icons.self_improvement),
            activeColor: Colors.teal,
          ),
          const SizedBox(height: 16),

          // Botones
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _formKey.currentState?.reset(),
                child: const Text('Limpiar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _guardar,
                icon:  const Icon(Icons.save),
                label: const Text('Guardar Registro'),
                style: FilledButton.styleFrom(backgroundColor: Colors.teal),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
