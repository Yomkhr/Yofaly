import 'package:flutter/material.dart';
import 'package:yofaly/pages/home/home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7EB), // Fond clair comme ton design
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // Assure-toi que le chemin est correct
          width: 250, // Ajuste la taille si nécessaire
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
