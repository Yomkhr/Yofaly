import 'package:flutter/material.dart';
import 'package:yofaly/pages/details/desserts.dart';
import 'package:yofaly/pages/details/categorie.dart';

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
            onPressed: () {},
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
            'nos plats',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoriesPage()),
            ),
          ),
          SizedBox(height: 20),
          _buildCategoryButton(
            context,
            'assets/images/dessert.jpg',
            'nos desserts',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Desserts()),
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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.history, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
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
      backgroundColor: Color(0xFFEFEFD5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "YOFALY",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(child: Text("Page Catégorie")),
    );
  }
}
