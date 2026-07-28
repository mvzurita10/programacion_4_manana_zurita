import 'package:flutter/material.dart';

class PantallaDialogsMp extends StatelessWidget {
  const PantallaDialogsMp({super.key});

  void _mostrarSnackBar(BuildContext context, {bool esCrisis = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(esCrisis
            ? 'Alerta: Nivel de ansiedad muy alto. ¿Llamar a contacto?'
            : 'Registro guardado exitosamente. Sigue así.'),
        backgroundColor: esCrisis
            ? Theme.of(context).colorScheme.error
            : null,
        action: SnackBarAction(
          label:    esCrisis ? 'Llamar' : 'Deshacer',
          onPressed: () {},
          textColor: esCrisis ? Colors.white : null,
        ),
        behavior:  SnackBarBehavior.floating,
        shape:     RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration:  const Duration(seconds: 4),
      ),
    );
  }

  Future<void> _mostrarConfirmacion(BuildContext context) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon:    const Icon(Icons.warning_amber, color: Colors.orange),
        title:   const Text('Eliminar entrada'),
        content: const Text(
          '¿Estás seguro de que deseas eliminar este registro íntimo?\n'
          'Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child:     const Text('Conservar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (!context.mounted) return;

    if (confirmar == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro eliminado correctamente')),
      );
    }
  }

  Future<void> _mostrarFormularioRapido(BuildContext context) async {
    final formKey = GlobalKey<FormState>();
    final ctrlEmocion = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Registro Rápido'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('¿Cómo te sientes en este momento?'),
              const SizedBox(height: 16),
              TextFormField(
                controller:  ctrlEmocion,
                decoration:  const InputDecoration(labelText: 'Emoción principal (ej. Feliz, Tenso)'),
                validator:   (v) => v == null || v.isEmpty ? 'Por favor ingresa una emoción' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child:     const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(ctx);
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );

    if (!context.mounted) return;
    if (ctrlEmocion.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Emoción "${ctrlEmocion.text}" registrada')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Alertas y Diálogos'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Text('Notificaciones Suaves', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => _mostrarSnackBar(context),
            icon:  const Icon(Icons.favorite),
            label: const Text('Notificación Positiva'),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
            ),
            onPressed: () => _mostrarSnackBar(context, esCrisis: true),
            icon:  const Icon(Icons.local_hospital),
            label: const Text('Alerta de Crisis'),
          ),

          const Divider(height: 32),

          Text('Diálogos Terapéuticos', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: cs.error,
              side: BorderSide(color: cs.error),
            ),
            onPressed: () => _mostrarConfirmacion(context),
            icon:  const Icon(Icons.delete_outline),
            label: const Text('Eliminar entrada (confirmación)'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () => _mostrarFormularioRapido(context),
            child: const Text('Registro Rápido de Emoción'),
          ),
        ],
      ),
    );
  }
}
