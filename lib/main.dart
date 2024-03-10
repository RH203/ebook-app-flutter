import 'package:flutter/material.dart';
import 'package:novel_app/src/app.dart';
import 'package:novel_app/src/provider/theme/provider_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProviderTheme(),
      child: const App(),
    ),
  );
}
