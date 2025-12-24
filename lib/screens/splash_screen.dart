import 'package:flutter/material.dart';
import 'dart:async';
import 'package:learning_management_system/theme.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CeLOETheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Container with white background to ensure visibility
            // Logo without container for white logo on colored background
            Image.asset(
              'assets/images/logo_celoe_white.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.school, size: 80, color: Colors.white);
              },
            ),
            const SizedBox(height: 12),
            Text( // Text color fixed to white for contrast
               'University LMS',
               style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
               ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
