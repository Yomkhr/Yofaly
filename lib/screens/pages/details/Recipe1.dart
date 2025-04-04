import 'package:flutter/material.dart';

class Recipe1 extends StatelessWidget {
  final String category;

  Recipe1({required this.category});

  final Map<String, List<Map<String, String>>> recipes = {
    'Marocaine': [
      {
        'title': 'Pastilla poulet',
        'time': '1h 40min',
        'difficulty': 'Facile',
        'image': 'assets/pastilla_poulet.jpg',
      },
      {
        'title': 'Tajine poulet',
        'time': '1h',
        'difficulty': 'Intermédiaire',
        'image': 'assets/tajine_poulet.jpg',
      },
      {
        'title': 'Couscous Marocain',
        'time': '2h',
        'difficulty': 'Intermédiaire',
        'image': 'assets/couscous_marocain.jpg',
      },
      {
        'title': 'Tajine viande pomme de terre',
        'time': '40 min',
        'difficulty': 'Facile',
        'image': 'assets/tajine_viande.jpg',
      },
    ],
    'Tunisienne': [
      {
        'title': 'Fricassée',
        'time': '1h',
        'difficulty': 'Facile',
        'image': 'assets/fricassee.jpg',
      },
      {
        'title': 'Tajine el Bey',
        'time': '1h',
        'difficulty': 'Intermédiaire',
        'image': 'assets/tajine_el_bey.jpg',
      },
      {
        'title': 'Mloukhiya',
        'time': '2h',
        'difficulty': 'Intermédiaire',
        'image': 'assets/mloukhiya.jpg',
      },
      {
        'title': 'Couscous poisson',
        'time': '2h',
        'difficulty': 'Intermédiaire',
        'image': 'assets/couscous_poisson.jpg',
      },
    ],
    'Algérienne': [
      {
        'title': 'Mtewem',
        'time': '1h 40min',
        'difficulty': 'Facile',
        'image': 'assets/mtewem.jpg',
      },
      {
        'title': 'Lham lahlou',
        'time': '1h',
        'difficulty': 'Intermédiaire',
        'image': 'assets/lham_lahlou.jpg',
      },
      {
        'title': 'Berkoukes',
        'time': '40 min',
        'difficulty': 'Facile',
        'image': 'assets/berkoukes.jpg',
      },
      {
        'title': 'Couscous algérien',
        'time': '2h',
        'difficulty': 'Facile',
        'image': 'assets/couscous_algerien.jpg',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAE8D9),
      appBar: AppBar(
        backgroundColor: Color(0xFFEAE8D9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset('assets/logo.png', height: 40),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
          Expanded(
            child: ListView(
              children:
                  recipes[category]!
                      .map((recipe) => recipeCard(recipe))
                      .toList(),
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

  Widget recipeCard(Map<String, String> recipe) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            recipe['image']!,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          recipe['title']!,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.access_time, size: 16),
            SizedBox(width: 4),
            Text(recipe['time']!),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.favorite_border, color: Colors.amber),
            Text(category, style: TextStyle(color: Colors.amber)),
            Text(recipe['difficulty']!, style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
    );
  }
}
