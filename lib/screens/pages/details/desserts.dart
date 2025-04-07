import 'package:flutter/material.dart';

class Desserts extends StatefulWidget {
  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Desserts> {
  String? selectedCategory;

  final Map<String, List<String>> dessertRecipes = {
    'Marocaine': ['Cornes de gazelle', 'Chebakia', 'Sellou'],
    'Tunisienne': ['Baklawa', 'Zriga', 'Yo-yo'],
    'Algérienne': ['Makroud', 'Kalb el louz', 'Griwech'],
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
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(assetPath),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(category, style: TextStyle(fontFamily: 'Cursive')),
        ),
      ],
    );
  }

  Widget buildRecipeList(String category) {
    final recipes = dessertRecipes[category] ?? [];

    return Column(
      children:
          recipes.map((recipe) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                title: Text(recipe),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Action du bouton
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tu as cliqué sur "$recipe"')),
                    );
                  },
                  child: Text("Voir"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                  ),
                ),
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
        title: Image.asset('assets/logo.png', height: 40), // Ton logo YOFALY
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
                buildCategoryButton('Marocaine', 'assets/maroc.png'),
                buildCategoryButton('Tunisienne', 'assets/tunisie.png'),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: buildCategoryButton('Algérienne', 'assets/algerie.png'),
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
