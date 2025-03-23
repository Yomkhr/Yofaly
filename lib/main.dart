import 'package:flutter/material.dart';
import 'package:yofaly/pages/details/LoginScreen.dart' as xx;
import 'package:yofaly/pages/details/SignupScreen.dart';
import 'package:yofaly/pages/details/SignupSuccess.dart';
import 'package:yofaly/pages/details/ForgotPasswordScreen.dart';
import 'package:yofaly/pages/home/home.dart';
import 'package:yofaly/pages/details/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YOFALY App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFE6E5D7),
      ),
      home: const WelcomePage(), // Première page
      routes: {
        '/login': (context) => xx.LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/signup_success': (context) => SignUpSuccessPage(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/accueil': (context) => Home(),
      },
    );
  }
}

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
      Navigator.pushReplacementNamed(
        context,
        '/login',
      ); // Redirection vers Login
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7EB),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 250,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
