import 'package:flutter/material.dart';

class PastillaPouletIngredient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pastilla au Poulet'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/pastilla_poulet.jpg', fit: BoxFit.cover),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Ingrédients")),
                ElevatedButton(onPressed: () {}, child: Text("Préparation")),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Ingrédients",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            IngredientItem("Poulet", "1 kg"),
            IngredientItem("Oignon(s)", "1 kg"),
            IngredientItem("Œufs", "6"),
            IngredientItem("Amandes émondées", "100 g"),
            IngredientItem("Sucre en poudre", "200 g"),
            IngredientItem("Huile de friture", "5 cl"),
            IngredientItem("Huile végétale", "1 c. à soupe"),
            IngredientItem("Sel", "1 c. à café"),
            IngredientItem("Poivre", "0.5 c. à café"),
            IngredientItem("Cannelle", "1 c. à café"),
            IngredientItem("Safran", "1 c. à café"),
            IngredientItem("Feuilles de filo", "500 g"),
            IngredientItem("Jaune d'œuf", "1"),
            IngredientItem("Eau", "1 L"),
          ],
        ),
      ),
    );
  }
}

class IngredientItem extends StatelessWidget {
  final String name;
  final String quantity;

  IngredientItem(this.name, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontSize: 18)),
          Text(
            quantity,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
