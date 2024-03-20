import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.text,
    required this.onPressed,
  }) : isText = false;

  const ActionButtons.text({
    super.key,
    required this.text,
    required this.onPressed,
  }) : isText = true;

  final VoidCallback onPressed;
  final String text;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isText ? Colors.transparent : Theme.of(context).colorScheme.primary,
        foregroundColor: isText
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.onSurface,
        textStyle: Theme.of(context).textTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        shadowColor: isText ? Colors.transparent : null,
        surfaceTintColor: isText ? Colors.transparent : null,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
