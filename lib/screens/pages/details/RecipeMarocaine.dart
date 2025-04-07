import 'package:flutter/material.dart';

class Recipemarocaine extends StatelessWidget {
  final List<Map<String, dynamic>> recettes = [
    {
      'image': 'assets/pastilla_poulet.jpg',
      'nom': 'Pastilla poulet',
      'temps': '1h 40min',
      'categorie': 'Marocaine',
      'niveau': 'Facile',
    },
    {
      'image': 'assets/tajine_poulet.jpg',
      'nom': 'Tajine poulet',
      'temps': '1h',
      'categorie': 'Marocaine',
      'niveau': 'Intermédiaire',
    },
    {
      'image': 'assets/couscous_marocain.jpg',
      'nom': 'Couscous Marocain',
      'temps': '2h',
      'categorie': 'Marocaine',
      'niveau': 'Intermédiaire',
    },
    {
      'image': 'assets/tajine_viande_pomme.jpg',
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
        backgroundColor: Color(0xFFECEAD6),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {},
        ),
        title: Image.asset('assets/logo.png', height: 40),
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
                return Card(
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
                        icon: Icon(Icons.favorite_border, color: Colors.yellow),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.restore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
    );
  }
}
