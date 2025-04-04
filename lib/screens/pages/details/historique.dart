import 'package:flutter/material.dart';

class historique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD634),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA500),
        title: Text('Historique', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text(
          'Votre historique de recettes apparaîtra ici !',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
