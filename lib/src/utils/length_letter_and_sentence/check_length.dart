import 'package:flutter/material.dart';

class CheckLength {
  static TextStyle checkLengthLetterAndColor(
      String letter, BuildContext context) {
    if (letter.length > 12) {
      return TextStyle(
        fontSize: 12,
        color: Theme.of(context).colorScheme.onSurface,
      );
    } else {
      return TextStyle(
        fontSize: 15,
        color: Theme.of(context).colorScheme.onSurface,
      );
    }
  }
}
