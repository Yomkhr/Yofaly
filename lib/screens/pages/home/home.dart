import 'package:flutter/material.dart';
import 'package:yofaly/screens/pages/details/Ingredient.dart';
import 'package:yofaly/screens/pages/details/RecipeAlgerienne.dart';
import 'package:yofaly/screens/pages/details/RecipeMarocaine.dart';
import 'package:yofaly/screens/pages/details/RecipeTunisienne.dart';
import 'package:yofaly/screens/pages/details/desserts.dart';
import 'package:yofaly/screens/pages/details/favoris.dart';
import 'package:yofaly/screens/pages/details/historique.dart';
import 'package:yofaly/screens/pages/details/notifications.dart';
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
              MaterialPageRoute(builder: (context) => CategoriesPage()),
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
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Recipe Title, Ingredient',
                hintStyle: TextStyle(fontFamily: 'Roboto'),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Color(0xFFFFC107)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage()),
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
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Desserts()),
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
      bottomNavigationBar: Container(
        color: Color(0xFFFFC107),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.history, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => historique()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favoris()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E3D7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.amber),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.amber),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Recipe Title, Ingredient",
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.amber),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Nos catégories",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cursive',
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: EdgeInsets.all(16),
              children: [
                _buildCategoryCircle(
                  context,
                  'Marocaine',
                  'assets/images/marocaine.jpg',
                ),
                _buildCategoryCircle(
                  context,
                  'Tunisienne',
                  'assets/images/tunisienne.jpg',
                ),
                _buildCategoryCircle(
                  context,
                  'Algérienne',
                  'assets/images/algerienne.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCircle(
    BuildContext context,
    String title,
    String imagePath,
  ) {
    return GestureDetector(
      onTap: () {
        // Navigation vers la page correspondante
        if (title == 'Marocaine') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Recipemarocaine()),
          );
        } else if (title == 'Tunisienne') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Recipetunisienne()),
          );
        } else if (title == 'Algérienne') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecipeAlgerienne()),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
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
    );
  }
}
