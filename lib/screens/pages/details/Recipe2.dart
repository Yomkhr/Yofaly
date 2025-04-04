import 'package:flutter/material.dart';

class Recipe2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAE8D9),
      appBar: AppBar(
        backgroundColor: Color(0xFFEAE8D9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: _buildImage('assets/images/logo.png', 40),
        centerTitle: true,
        actions: [Icon(Icons.signal_cellular_alt, color: Colors.black)],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Quel Recette Vous Souhaitez...',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                recipeCard(
                  'Pastilla poulet',
                  '1h 40min',
                  'Marocaine',
                  'Facile',
                  'assets/images/Pastilla poulet.jpg',
                ),
                recipeCard(
                  'Tajine poulet',
                  '1h',
                  'Marocaine',
                  'Intermédiaire',
                  'assets/images/Tajine poulet.jpg',
                ),
                recipeCard(
                  'Couscous Marocain',
                  '2h',
                  'Marocaine',
                  'Intermédiaire',
                  'assets/images/Couscous Marocain.jpeg',
                ),
                recipeCard(
                  'Tajine viande pomme de terre',
                  '40min',
                  'Marocaine',
                  'Facile',
                  'assets/images/Tajine viande pomme de terre.jpeg',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF6C343),
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.history, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String path, double height) {
    return Image.asset(
      path,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.broken_image, color: Colors.red, size: height);
      },
    );
  }

  Widget recipeCard(
    String title,
    String time,
    String origin,
    String difficulty,
    String imagePath,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: _buildImage(imagePath, 70),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Icon(Icons.access_time, size: 16),
            SizedBox(width: 4),
            Text(time),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.favorite_border, color: Colors.amber),
            Text(origin, style: TextStyle(color: Colors.amber)),
            Text(difficulty, style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
    );
  }
}
