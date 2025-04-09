import 'package:flutter/material.dart';
import 'package:yofaly/screens/pages/details/RecipeMarocaine.dart';
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
            child: ListView(
              children: [
                // Section Marocaine
                _buildCategorySection(
                  context,
                  'Marocaine',
                  'Maroc',
                  'assets/images/marocaine.jpg',

                  [
                    {
                      'name': 'Tajine',
                      'image': 'assets/images/tajine.png',
                      'ingredients': [
                        'Poulet',
                        'Oignons',
                        'Citron confit',
                        'Olives',
                        'Épices marocaines',
                      ],
                      'preparation': 'Préparation du tajine...',
                    },
                    {
                      'name': 'Couscous',
                      'image': 'assets/images/Couscous Marocain.jpeg',
                      'ingredients': ['Semoule', 'Légumes', 'Viande', 'Épices'],
                      'preparation': 'Préparation du couscous...',
                    },
                  ],
                ),

                // Section Tunisienne
                _buildCategorySection(
                  context,
                  'Tunisienne',
                  'Tunisie',
                  'assets/images/tunisienne.jpg',
                  [
                    {
                      'name': 'Brik',
                      'image': 'assets/images/brik.jpg',
                      'ingredients': [
                        'Feuille de brick',
                        'Oeuf',
                        'Thon',
                        'Persil',
                      ],
                      'preparation': 'Préparation du brik...',
                    },
                    {
                      'name': 'Lablabi',
                      'image': 'assets/images/lablabi.jpg',
                      'ingredients': ['Pois chiches', 'Ail', 'Cumin', 'Pain'],
                      'preparation': 'Préparation du lablabi...',
                    },
                  ],
                ),

                // Section Algérienne
                _buildCategorySection(
                  context,
                  'Algérienne',
                  'Algérie',
                  'assets/images/algerienne.jpg',
                  [
                    {
                      'name': 'Chakhchoukha',
                      'image': 'assets/images/chakhchoukha.jpg',
                      'ingredients': [
                        'Msemen',
                        'Sauce tomate',
                        'Viande',
                        'Épices',
                      ],
                      'preparation': 'Préparation de la chakhchoukha...',
                    },
                    {
                      'name': 'Rechta',
                      'image': 'assets/images/rechta.jpg',
                      'ingredients': [
                        'Pâtes maison',
                        'Poulet',
                        'Pois chiches',
                        'Sauce blanche',
                      ],
                      'preparation': 'Préparation de la rechta...',
                    },
                  ],
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
    List<Map<String, dynamic>> recipes,
  ) {
    print(imagePath);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Vous pouvez garder cette navigation ou la supprimer si vous préférez
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Recipemarocaine(origin: origin),
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
        SizedBox(height: 10),
        ...recipes.map((recipe) => _buildRecipeCard(context, recipe)).toList(),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRecipeCard(BuildContext context, Map<String, dynamic> recipe) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: FutureBuilder(
          future: Future.delayed(
            Duration(milliseconds: 100),
          ), // simulate slight delay
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                width: 50,
                height: 50,
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              );
            } else {
              return Image.asset(
                recipe['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              );
            }
          },
        ),

        title: Text(recipe['name']),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder:
          //         (context) => RecipeDetails(
          //           recipeName: recipe['name'],
          //           imagePath: recipe['image'],
          //           ingredients: List<String>.from(recipe['ingredients']),
          //           preparation: recipe['preparation'],
          //         ),
          //   ),
          // );
        },
      ),
    );
  }
}
