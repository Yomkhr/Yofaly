import 'package:flutter/material.dart';
import 'package:yofaly/core/api_service.dart';
import 'package:yofaly/core/favorite_service.dart';

class Favoris extends StatefulWidget {
  @override
  State<Favoris> createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {
  List<Map<String, dynamic>> recettes = [];
  List<String> favoriteIds = [];

  bool isLoading = true;

  getRecipes() async {
    setState(() {
      isLoading = true;
    });
    try {
      dynamic response = await ApiService().getFavorite();
      // Assuming response is a List of Maps
      recettes = List<Map<String, dynamic>>.from(response);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Please contact your System Administrator");
      setState(() {
        isLoading = false;
      });
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  void removeFavorite(String id) async {
    await FavoriteService.removeFavorite(id);
    favoriteIds.remove(id);
    // Also remove from the local recipe list
    recettes.removeWhere((item) => item['_id'] == id);

    setState(() {});
  }

  String getPreparationLevel(dynamic preptime) {
    if (preptime == null) return 'Inconnu';

    int time = int.tryParse(preptime.toString()) ?? 0;

    if (time < 25) {
      return 'Facile';
    } else if (time >= 25 && time <= 60) {
      return 'Moyen';
    } else {
      return 'Difficile';
    }
  }

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
        title: Text('Mes Favoris', style: TextStyle(color: Colors.black)),
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
            child:
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      itemCount: recettes.length,
                      itemBuilder: (context, index) {
                        final recette = recettes[index];
                        final id = recette['_id'];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  recette['image'] ?? 'assets/images/logo.png',
                                  width: 120,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recette['title'],
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
                                          Text(recette['preptime'].toString()),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        recette['origins'][0],
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                      Text(
                                        getPreparationLevel(
                                          recette['preptime'],
                                        ),
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.yellow,
                                ),
                                onPressed: () => removeFavorite(id),
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
