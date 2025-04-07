import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  final String recipeName;
  final String imagePath;
  final List<String> ingredients;
  final String preparation;

  Ingredient({
    required this.recipeName,
    required this.imagePath,
    required this.ingredients,
    required this.preparation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipeName)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            SizedBox(height: 20),
            Text(
              'Ingrédients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  ingredients
                      .map((ingredient) => Text('- $ingredient'))
                      .toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Préparation:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(preparation),
          ],
        ),
      ),
    );
  }
}
