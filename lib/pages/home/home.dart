import 'package:flutter/material.dart';
import 'package:yofaly/pages/details/desserts.dart';
import 'package:yofaly/pages/details/categorie.dart';
import 'package:yofaly/pages/details/favoris.dart';
import 'package:yofaly/pages/details/historique.dart';
import 'package:yofaly/pages/details/historique.dart';
import 'package:yofaly/pages/details/favoris.dart';
import 'package:yofaly/pages/details/notifications.dart';
import 'package:yofaly/pages/details/profil.dart';

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
              // la page Profil
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
          _buildCategoryButton(
            context,
            'assets/images/plat.jpg',
            'Nos Plats',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesPage(),
              ), //  la page Plats
            ),
          ),
          SizedBox(height: 20),
          _buildCategoryButton(
            context,
            'assets/images/dessert.jpg',
            'Nos Desserts',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Desserts(),
              ), // la page Desserts
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
                //  la page Home
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.history, color: Colors.black),
              onPressed: () {
                //  Historique
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => historique()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {
                //  Favoris
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favoris()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                //  Notifications
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

  Widget _buildCategoryButton(
    BuildContext context,
    String imagePath,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryButton('assets/images/marocaine.jpg', 'Marocaine'),
                    categoryButton(
                      'assets/images/tunisienne.jpg',
                      'Tunisienne',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                categoryButton('assets/images/algerienne.jpg', 'Algérienne'),
              ],
            ),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.amber,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history, color: Colors.black),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.black),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications, color: Colors.black),
                label: "",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoryButton(String imagePath, String label) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
