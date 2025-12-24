import 'package:flutter/material.dart';
import 'package:learning_management_system/theme.dart';
import 'package:learning_management_system/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLOE LMS',
      debugShowCheckedModeBanner: false,
      theme: CeLOETheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}

