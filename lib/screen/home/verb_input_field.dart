import 'package:flutter/material.dart';

class VerbInputField extends StatefulWidget {
  final TextEditingController controller;
  final bool readOnly;
  final String initialValue;
  final String label;
  final String? Function(String?)? validator;

  const VerbInputField({
    Key? key,
    required this.controller,
    required this.label,
    this.readOnly = false,
    this.initialValue = "",
    this.validator,
  }) : super(key: key);

  @override
  State<VerbInputField> createState() => _VerbInputFieldState();
}

class _VerbInputFieldState extends State<VerbInputField> {
  @override
  void initState() {
    widget.controller.text = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: Theme.of(context).textTheme.bodyLarge),
      style: Theme.of(context).textTheme.headlineSmall,
      validator: widget.validator,
    );
  }
}
