import 'package:flutter/material.dart';
import 'package:novel_app/src/provider/theme/provider_theme.dart';
import 'package:novel_app/src/screen/auth/login_screen.dart';
import 'package:novel_app/src/screen/auth/signup_screen.dart';
import 'package:novel_app/src/screen/home_screen/home_screen.dart';
import 'package:novel_app/src/screen/profile/profile_screen.dart';
import 'package:novel_app/src/screen/welcome_screen/welcome_screen.dart';
import 'package:novel_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderTheme>(
      builder: (context, value, child) => MaterialApp(
        title: "E-book app",
        theme: CustomTheme.themeData(value.darkTheme, context),
        routes: {
          '/loginscreen': (context) => const LoginScreen(),
          '/signupscreen': (context) => const SignupScreen(),
          '/mainscreen': (context) => const HomeScreen(),
          '/profilscreen': (context) => const ProfileScreen(),
        },
        home: const WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
