import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yofaly/screens/pages/details/LoginScreen.dart' as xx;
import 'package:yofaly/screens/pages/details/SignupScreen.dart';
import 'package:yofaly/screens/pages/details/SignupSuccess.dart';
import 'package:yofaly/screens/pages/details/ForgotPasswordScreen.dart';
import 'package:yofaly/screens/pages/home/home.dart';
import 'package:yofaly/screens/pages/details/WelcomeScreen.dart';
import 'package:yofaly/providers/produit_provider.dart'; // Importez votre Provider

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProduitProvider()),
        // Ajoutez d'autres providers ici si nécessaire
      ],
      child: const MyApp(),
    ),
  );
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
      home: const WelcomePage(),
      routes: {
        '/login': (context) => xx.LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/signup_success': (context) => SignUpSuccess(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/accueil': (context) => Home(),
      },
      // Optionnel : gestion des routes inconnues
      onUnknownRoute:
          (settings) =>
              MaterialPageRoute(builder: (context) => const WelcomePage()),
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
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      // Si un token existe, aller à la HomePage
      Navigator.pushReplacementNamed(context, '/accueil');
    } else {
      // Sinon, aller à la page de connexion
      Navigator.pushReplacementNamed(context, '/login');
    }
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
