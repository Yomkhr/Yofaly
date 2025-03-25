import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E3D7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          notificationTile(
            "Nouvelle recette ajoutée !",
            "Découvrez notre dernière recette marocaine.",
            Icons.fastfood,
          ),
          notificationTile(
            "Mise à jour disponible",
            "Améliorations et corrections de bugs.",
            Icons.update,
          ),
          notificationTile(
            "Offre spéciale !",
            "Profitez d'une réduction exclusive sur nos recettes premium.",
            Icons.local_offer,
          ),
          notificationTile(
            "Rappel",
            "N'oubliez pas d'essayer la recette que vous avez sauvegardée.",
            Icons.notifications_active,
          ),
        ],
      ),
    );
  }

  Widget notificationTile(String title, String subtitle, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.amber, size: 30),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}
