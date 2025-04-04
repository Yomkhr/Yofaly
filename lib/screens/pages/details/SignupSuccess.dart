import 'package:flutter/material.dart';

class SignUpSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xFFF7F8ED,
      ), // Même couleur de fond que SignUpScreen
      body: Stack(
        children: [
          // Contenu principal (le formulaire en arrière-plan)
          Positioned.fill(
            child: Opacity(
              opacity: 0.4, // Assombrit légèrement l'arrière-plan
              child: Container(color: Colors.black),
            ),
          ),

          // La boîte blanche de succès
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
                  // Icône utilisateur dans un cercle
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber[700],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  SizedBox(height: 15),

                  // Texte "Sign Up Successful!"
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

                  // Bouton Continuer
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Ferme la page de succès
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
