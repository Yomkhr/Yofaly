import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yofaly/core/api_service.dart';
import 'package:yofaly/core/favorite_service.dart';
import 'package:yofaly/screens/pages/details/SignupScreen.dart';
import 'package:yofaly/screens/pages/details/forgotPasswordScreen.dart';
import 'package:yofaly/screens/pages/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String err = " ";
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('_id');
    String? username = prefs.getString('username');
    String? email = prefs.getString('email');
    String? token = prefs.getString('token');

    print('ID: $id');
    print('Username: $username');
    print('Email: $email');
    print('Token: $token');
  }

  Login() async {
    try {
      // API login
      final response = await ApiService().login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (response.statusCode == 200) {
        // Récupération des données
        final data = response.data;

        // Stocker les données dans SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('_id', data['_id']);
        await prefs.setString('username', data['username']);
        await prefs.setString('email', data['email']);
        await prefs.setString('token', data['token']);

        // get favorites item
        await FavoriteService.syncFavoritesWithSharedPrefs(); // Sync on launch

        print('Données sauvegardées avec succès');
        loadUserData();
        // Redirection vers la page d'accueil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        setState(() {
          err = response.data["message"];
        });
      }
    } catch (e) {
      setState(() {
        err = "Erreur contacter le système d'administration";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8ED),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: // Create a GlobalKey for the form
        // In your build method:
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 100),
              SizedBox(height: 20),
              Text(
                'Authentification',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),

              // Email Field with Validation
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email :',
                  style: TextStyle(color: Colors.amber[700]),
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre email';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Veuillez saisir un email valide';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(height: 20),

              // Password Field with Validation
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mot de passe :',
                  style: TextStyle(color: Colors.amber[700]),
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre mot de passe';
                  }
                  if (value.length < 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                ),
              ),

              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text('Mot de passe oublié ?'),
                ),
              ),
              Container(child: Text(err)),
              SizedBox(height: 20),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  // print the value and remove spaces
                  print(passwordController.text.trim());
                  print(emailController.text.trim());
                  if (_formKey.currentState!.validate()) {
                    Login();

                    // Form is valid - proceed with authentication
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Connexion', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 20),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Avez-vous un compte ? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      'Créer un compte',
                      style: TextStyle(color: Colors.amber[700]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
