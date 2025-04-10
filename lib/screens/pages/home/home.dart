import 'package:flutter/material.dart';
import 'package:yofaly/screens/pages/details/RecipeMarocaine.dart';
import 'package:yofaly/screens/pages/details/favoris.dart';
import 'package:yofaly/screens/pages/details/profil.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E5D7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesPage(recipetype: "plat"),
              ),
            );
          },
          child: Image.asset('assets/images/logo.png', height: 40),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFFFFC107)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profil()),
              );
            },
          ),
        ],
      ),
      body: Center(
        // Centre le contenu
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centre verticalement
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesPage(recipetype: "plat"),
                  ),
                );
              },
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/plat.jpg',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Nos Plats",
                    style: TextStyle(fontSize: 18, fontFamily: 'DancingScript'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40), // Plus d'espace entre les deux cercles
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesPage(recipetype: "dessert"),
                  ),
                );
              },
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/dessert.jpg',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Nos Desserts",
                    style: TextStyle(fontSize: 18, fontFamily: 'DancingScript'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFFFC107),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const SizedBox(width: 40),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.black, size: 28),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Favoris()),
                  );
                },
              ),
            ),
            const SizedBox(width: 20),
            Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF4A4A4A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  final String recipetype; // Renommé en recipetype

  // Constructeur avec paramètre renommé
  const CategoriesPage({Key? key, required this.recipetype}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Définir le titre en fonction du recipetype
    String categoryTitle = recipetype == "plat" ? "Nos plats" : "Nos desserts";

    return Scaffold(
      backgroundColor: Color(0xFFE5E3D7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            categoryTitle, // Titre dynamique selon le recipetype
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cursive',
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                // Section Marocaine
                _buildCategorySection(
                  context,
                  'Marocaine',
                  'Maroc',
                  'assets/images/marocaine.jpg',
                ),

                // Section Tunisienne
                _buildCategorySection(
                  context,
                  'Tunisienne',
                  'Tunisie',
                  'assets/images/tunisienne.jpg',
                ),

                // Section Algérienne
                _buildCategorySection(
                  context,
                  'Algérienne',
                  'Algérie',
                  'assets/images/algerienne.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(
    BuildContext context,
    String title,
    String origin,
    String imagePath,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Recipemarocaine(
                      origin: origin,
                      recipetype: recipetype, // Paramètre renommé
                    ),
              ),
            );
          },
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  imagePath,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontFamily: 'DancingScript'),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
