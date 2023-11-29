import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SISCAX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B896E)),
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1B896E),
          foregroundColor: Colors.white,
        ),
      ),
      home: const LoginScreen(useWhiteAppBar: true), // Passando o argumento
    );
  }
}
