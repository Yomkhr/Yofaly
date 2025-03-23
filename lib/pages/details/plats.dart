import 'package:flutter/material.dart';

class Plats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD634), // Fond jaune principal
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA500),
        title: Text(
          'Nos plats',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCategoryCircle(
                  context,
                  'Tunisienne',
                  'assets/images/tunisienne.jpg',
                  '/tunisienne',
                ),
                SizedBox(width: 20),
                _buildCategoryCircle(
                  context,
                  'Algérienne',
                  'assets/images/algerienne.jpg',
                  '/algerienne',
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildCategoryCircle(
              context,
              'Marocaine',
              'assets/images/marocaine.jpg',
              '/marocaine',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCircle(
    BuildContext context,
    String title,
    String imagePath,
    String route,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.cover)),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFFFA500), // Couleur corrigée
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
