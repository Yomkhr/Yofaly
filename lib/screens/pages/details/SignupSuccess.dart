import 'package:flutter/material.dart';
import 'package:yofaly/screens/pages/home/home.dart';

// Remplace ceci par l'import de ta page d'accueil

class SignUpSuccess extends StatefulWidget {
  @override
  _SignUpSuccessState createState() => _SignUpSuccessState();
}

class _SignUpSuccessState extends State<SignUpSuccess> {
  @override
  void initState() {
    super.initState();

    // Attendre 2 secondes puis naviguer vers la HomePage sans possibilité de revenir
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8ED),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(opacity: 0.4, child: Container(color: Colors.black)),
          ),
          Center(
            child: Container(
              width: 250,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber[700],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Sign Up\nSuccessful!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 15),
                  // Optionnel : tu peux cacher le bouton si la redirection est automatique
                  ElevatedButton(
                    onPressed: () {
                      // Même si cliqué, aller à Home sans retour possible
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      'Continuer',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
