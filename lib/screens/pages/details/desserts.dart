import 'package:flutter/material.dart';

class Desserts extends StatefulWidget {
  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Desserts> {
  String? selectedCategory;

  final Map<String, List<Map<String, String>>> dessertRecipes = {
    'Marocaine': [
      {
        'name': 'Chebakya',
        'image': 'assets/images/chebakya.jpg',
        'duration': '1h 40min',
        'difficulty': 'Facile',
      },
      {
        'name': 'Kaab loghzal louz',
        'image': 'assets/images/kaab loghzal louz.jpg',
        'duration': '1h',
        'difficulty': 'Intermédiaire',
      },
      {
        'name': 'Fekkas marocain',
        'image': 'assets/images/fekkas marocain.jpg',
        'duration': '2h',
        'difficulty': 'Intermédiaire',
      },
      {
        'name': 'ghraiba à semoule et noix de coco',
        'image': 'assets/images/ghraiba à semoule et noix de coco.jpg',
        'duration': '2h',
        'difficulty': 'Facile',
      },
    ],

    'Algérienne': [
      {
        'name': 'kalab elouz',
        'image': 'assets/images/kalab elouz.jpg',
        'duration': '1h 40min',
        'difficulty': 'Facile',
      },
      {
        'name': 'mhalbi',
        'image': 'assets/images/mhalbi.jpg',
        'duration': '1h',
        'difficulty': 'Intermédiaire',
      },
      {
        'name': 'makrout amandes',
        'image': 'assets/images/makrout amandes.jpg',
        'duration': '2h',
        'difficulty': 'Intermédiaire',
      },
      {
        'name': 'baklawa',
        'image': 'assets/images/baklawa.jpg',
        'duration': '2h',
        'difficulty': 'Facile',
      },
    ],

    'Tunisienne': [
      {
        'name': 'Kaak warka',
        'image': 'assets/images/Kaak warka.jpg',
        'duration': '1h 40min',
        'difficulty': 'Facile',
      },
      {
        'name': 'zelabia',
        'image': 'assets/images/zelabia.jpg',
        'duration': '1h',
        'difficulty': 'Intermédiaire',
      },
      {
        'name': 'baklawa tunisienne',
        'image': 'assets/images/baklawa tunisienne.jpg',
        'duration': '2h',
        'difficulty': 'Intermédiaire',
      },
      {
        'name': 'zouza tunisienne',
        'image': 'assets/images/zouza tunisienne.jpg',
        'duration': '2h',
        'difficulty': 'Facile',
      },
      {
        'name': 'mkharek',
        'image': 'assets/images/mkharek.jpg',
        'duration': '2h',
        'difficulty': 'Facile',
      },
    ],
  };

  Widget buildCategoryButton(String category, String assetPath) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = category;
            });
          },
          child: ClipOval(
            child: Image.asset(
              assetPath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(category, style: TextStyle(fontFamily: 'Cursive', fontSize: 16)),
      ],
    );
  }

  Widget buildRecipeList(String category) {
    final recipes = dessertRecipes[category] ?? [];

    return Column(
      children:
          recipes.map((recipe) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      recipe['image']!,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe['name']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.access_time, size: 16),
                              SizedBox(width: 4),
                              Text(recipe['duration']!),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            category,
                            style: TextStyle(color: Colors.amber[700]),
                          ),
                          Text(
                            recipe['difficulty']!,
                            style: TextStyle(color: Colors.amber[700]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, right: 12),
                    child: Icon(Icons.favorite_border, color: Colors.amber),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E7D3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (selectedCategory == null) ...[
            SizedBox(height: 20),
            Text(
              "nos catégories",
              style: TextStyle(fontFamily: 'Cursive', fontSize: 24),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCategoryButton('Marocaine', 'assets/images/marocaine.jpg'),
                buildCategoryButton(
                  'Tunisienne',
                  'assets/images/tunisienne.jpg',
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: buildCategoryButton(
                'Algérienne',
                'assets/images/algerienne.jpg',
              ),
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        selectedCategory = null;
                      });
                    },
                  ),
                  Text(
                    'Desserts ${selectedCategory!}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cursive',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: buildRecipeList(selectedCategory!),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
