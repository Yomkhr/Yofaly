import 'package:flutter/material.dart';

class Compte_utilisateur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD634), // Fond jaune principal
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA500), // Couleur de l'AppBar
        title: Text('Mon Compte', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(Icons.account_circle, size: 100, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'Paramètres du compte',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),

            // Bouton Modifier le mot de passe
            _buildAccountOption(
              context,
              icon: Icons.lock,
              text: 'Modifier le mot de passe',
              onTap: () {
                // Logique pour modifier le mot de passe
              },
            ),

            // Bouton Supprimer le compte
            _buildAccountOption(
              context,
              icon: Icons.delete_forever,
              text: 'Supprimer mon compte',
              onTap: () {
                // Logique pour supprimer le compte
              },
            ),

            // Bouton Déconnexion
            _buildAccountOption(
              context,
              icon: Icons.logout,
              text: 'Se déconnecter',
              onTap: () {
                // Logique pour la déconnexion
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountOption(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20),
      onTap: onTap,
    );
  }
}
