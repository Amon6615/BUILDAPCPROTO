import 'package:flutter/material.dart';
import 'dart:async'; // For Timer function
import 'Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Start with SplashScreen
    );
  }
}

// Splash Screen Widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginPage after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Optional: keep a white background if needed
        child: Image.asset(
          'assets/images/SPLASHSCREEN.svg', // Ensure correct asset path
          fit: BoxFit.fill, // This stretches the image to fill the entire screen
          height: MediaQuery.of(context).size.height, // Full height
          width: MediaQuery.of(context).size.width, // Full width
        ),
      ),
    );
  }
}