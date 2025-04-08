import 'package:flutter/material.dart';
import 'package:yofaly/screens/pages/details/favoris.dart';
import 'package:yofaly/screens/pages/details/historique.dart';
import 'package:yofaly/screens/pages/details/notifications.dart';
import 'package:yofaly/screens/pages/details/recette1tun.dart';
import 'package:yofaly/screens/pages/details/recette2tun.dart';
import 'package:yofaly/screens/pages/details/recette3tun.dart';
import 'package:yofaly/screens/pages/details/recette4tun.dart';
import 'package:yofaly/screens/pages/home/home.dart';

// Pages à importer ou créer

class Recipetunisienne extends StatelessWidget {
  final List<Map<String, dynamic>> recettes = [
    {
      'image': 'assets/images/fricassee.jpg',
      'nom': 'Fricassée',
      'temps': '1h',
      'categorie': 'Tunisienne',
      'niveau': 'Facile',
    },
    {
      'image': 'assets/images/tajine_el_bey.jpg',
      'nom': 'Tajine el Bey',
      'temps': '1h',
      'categorie': 'Tunisienne',
      'niveau': 'Intermédiaire',
    },
    {
      'image': 'assets/images/mloukhiya.jpg',
      'nom': 'Mloukhia',
      'temps': '2h',
      'categorie': 'Tunisienne',
      'niveau': 'Intermédiaire',
    },
    {
      'image': 'assets/images/couscous_poisson.jpg',
      'nom': 'Couscous poisson',
      'temps': '2h',
      'categorie': 'Tunisienne',
      'niveau': 'Intermédiaire',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEAD6),
      appBar: AppBar(
        backgroundColor: Color(0xFFECEAD6), // couleur personnalisée
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context); // ✅ Retour à la page précédente
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
                    // ✅ Navigation vers les pages recette1tun, recette2tun, etc.
                    Widget page;
                    switch (index) {
                      case 0:
                        page = recette1tun();
                        break;
                      case 1:
                        page = recette2tun();
                        break;
                      case 2:
                        page = recette3tun();
                        break;
                      case 3:
                        page = recette4tun();
                        break;
                      default:
                        page = recette1tun();
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page),
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
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Home()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => historique()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Favoris()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NotificationsPage()),
              );
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
}

class Historique {}
