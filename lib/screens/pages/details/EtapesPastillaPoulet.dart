import 'package:flutter/material.dart';

class EtapesPastillaPoulet extends StatelessWidget {
  final List<Map<String, String>> etapes = [
    {
      "title": "Étape 1",
      "description":
          "Faire revenir les oignons dans l'huile d'olive jusqu'à translucidité.",
    },
    {
      "title": "Étape 2",
      "description": "Ajouter le poulet coupé en morceaux et faire dorer.",
    },
    {
      "title": "Étape 3",
      "description":
          "Incorporer les épices (cannelle, gingembre, safran), le persil et la coriandre.",
    },
    {
      "title": "Étape 4",
      "description":
          "Couvrir d’eau et laisser mijoter 45 minutes jusqu'à ce que le poulet soit tendre.",
    },
    {
      "title": "Étape 5",
      "description":
          "Faire revenir les amandes effilées dans du beurre jusqu'à dorure.",
    },
    {
      "title": "Étape 6",
      "description":
          "Battre les œufs et les cuire en omelette dans le jus de cuisson réduit.",
    },
    {
      "title": "Étape 7",
      "description":
          "Beurrer un moule et disposer des feuilles de brick en les superposant et en les badigeonnant de beurre.",
    },
    {
      "title": "Étape 8",
      "description": "Alterner couches de poulet, omelette et amandes.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Préparation - Pastilla au Poulet"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: etapes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  etapes[index]["title"]!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(etapes[index]["description"]!),
              ),
            );
          },
        ),
      ),
    );
  }
}
