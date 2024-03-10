import 'package:flutter/material.dart';

class TextInputFields extends StatefulWidget {
  const TextInputFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.keyboardType = TextInputType.name,
  }) : isPassword = false;

  const TextInputFields.password({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.keyboardType = TextInputType.name,
  }) : isPassword = true;

  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final TextInputType keyboardType;
  final String Function(String?)? validator;
  @override
  State<TextInputFields> createState() => _TextInputFieldsState();
}

class _TextInputFieldsState extends State<TextInputFields> {
  bool isVisible = false;

  void onToggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: onToggleVisibility,
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.background,
                ),
              )
            : null,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        filled: true,
        fillColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        contentPadding: const EdgeInsets.all(16),
      ),
      obscureText: widget.isPassword && !isVisible,
      validator: widget.validator,
    );
  }
}
