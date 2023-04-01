import 'package:flutter/material.dart';

class WorkerDialog extends StatefulWidget {
  final Function(String name, int num) onConfirm;
  const WorkerDialog({Key? key, required this.onConfirm}) : super(key: key);

  @override
  _WorkerDialogState createState() => _WorkerDialogState();
}

class _WorkerDialogState extends State<WorkerDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _departamentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Worker form"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Enter name"),
              validator: (text) => text?.isEmpty ?? true ? "Enter text" : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _departamentController,
              decoration: const InputDecoration(labelText: "Enter departament"),
              keyboardType: TextInputType.number,
              validator: (text) =>
                  text?.isEmpty ?? true ? "Enter a valid num" : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;
            String name = _nameController.text;
            int num = int.tryParse(_departamentController.text) ?? 0;
            widget.onConfirm(name, num);

            Navigator.of(context).pop();
          },
          child: const Text("Confirm"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _departamentController.dispose();

    super.dispose();
  }
}
