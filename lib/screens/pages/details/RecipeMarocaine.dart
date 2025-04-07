import 'package:flutter/material.dart';

// PAGE PRINCIPALE
class Recipemarocaine extends StatelessWidget {
  final List<Map<String, dynamic>> recettes = [
    {
      'image': 'assets/images/pastilla poulet.jpg',
      'nom': 'Pastilla poulet',
      'temps': '1h 40min',
      'categorie': 'Marocaine',
      'niveau': 'Facile',
    },
    {
      'image': 'assets/images/tajine poulet.jpg',
      'nom': 'Tajine poulet',
      'temps': '1h',
      'categorie': 'Marocaine',
      'niveau': 'Intermédiaire',
    },
    {
      'image': 'assets/images/Couscous Marocain.jpg',
      'nom': 'Couscous Marocain',
      'temps': '2h',
      'categorie': 'Marocaine',
      'niveau': 'Intermédiaire',
    },
    {
      'image': 'assets/images/Tajine viande pomme de terre.jpg',
      'nom': 'Tajine viande pomme de terre',
      'temps': '40min',
      'categorie': 'Marocaine',
      'niveau': 'Facile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEAD6),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC107), // Jaune comme dans la capture
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Retour à la page précédente
          },
        ),
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: true,
        actions: [Icon(Icons.battery_full, color: Colors.black)],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Quel Recette Vous Souhaitez...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recettes.length,
              itemBuilder: (context, index) {
                final recette = recettes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                getRecettePage(index), // Va vers RecetteXMaroc
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.asset(
                            recette['image'],
                            width: 120,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recette['nom'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 16),
                                    SizedBox(width: 5),
                                    Text(recette['temps']),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  recette['categorie'],
                                  style: TextStyle(color: Colors.orange),
                                ),
                                Text(
                                  recette['niveau'],
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.yellow,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFC107), // Jaune
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/historique');
              break;
            case 2:
              Navigator.pushNamed(context, '/favoris');
              break;
            case 3:
              Navigator.pushNamed(context, '/notifications');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.restore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
    );
  }

  // Fonction pour retourner la bonne page selon l’index
  Widget getRecettePage(int index) {
    switch (index) {
      case 0:
        return Recette1Maroc();
      case 1:
        return Recette2Maroc();
      case 2:
        return Recette3Maroc();
      case 3:
        return Recette4Maroc();
      default:
        return Recette1Maroc();
    }
  }
}

// EXEMPLES DE PAGES DE RECETTES (à créer dans tes fichiers séparés)
class Recette1Maroc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recette 1")),
      body: Center(child: Text("Contenu de la Recette 1")),
    );
  }
}

class Recette2Maroc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recette 2")),
      body: Center(child: Text("Contenu de la Recette 2")),
    );
  }
}

class Recette3Maroc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recette 3")),
      body: Center(child: Text("Contenu de la Recette 3")),
    );
  }
}

class Recette4Maroc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recette 4")),
      body: Center(child: Text("Contenu de la Recette 4")),
    );
  }
}
