import 'package:flutter/material.dart';
import 'package:yofaly/screens/pages/details/desserts.dart';
import 'package:yofaly/screens/pages/details/favoris.dart';
import 'package:yofaly/screens/pages/details/historique.dart';
import 'package:yofaly/screens/pages/details/notifications.dart';
import 'package:yofaly/screens/pages/details/profil.dart';
import 'package:yofaly/screens/pages/details/recipe1.dart';

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Recipe1()),
                        );
                      },
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/marocaine.jpg',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Marocaine",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'DancingScript',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/tunisienne.jpg',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Tunisienne",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'DancingScript',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/algerienne.jpg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Algérienne",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'DancingScript',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
