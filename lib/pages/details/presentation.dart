import 'package:flutter/material.dart';

class Presentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD634), // Jaune identique à l'image
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80), // Espace en haut pour les icônes de statut
            Text(
              'Get inspired with\nrecipes recommendations.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Serif', // Police cursive comme dans l'image
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/tagine.png',
                width: 250,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Spacer(), // Pousse le bouton vers le bas
            Container(
              width: double.infinity, // Bouton pleine largeur
              margin: EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/connexion');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  'continue',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
