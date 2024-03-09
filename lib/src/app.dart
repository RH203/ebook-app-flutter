import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novel_app/src/screen/auth/login_screen.dart';
import 'package:novel_app/src/screen/auth/signup_screen.dart';
import 'package:novel_app/src/screen/home_screen/home_screen.dart';
import 'package:novel_app/src/screen/welcome_screen/welcome_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-book app",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F41BB),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      routes: {
        '/loginscreen': (context) => const LoginScreen(),
        '/signupscreen': (context) => const SignupScreen(),
        '/mainscreen': (context) => const HomeScreen(),
      },
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
