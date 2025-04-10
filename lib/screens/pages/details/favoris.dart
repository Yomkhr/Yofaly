import 'package:flutter/material.dart';
import 'package:yofaly/core/api_service.dart';
import 'package:yofaly/core/favorite_service.dart';

class Favoris extends StatefulWidget {
  @override
  State<Favoris> createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {
  List<Map<String, dynamic>> recettes = [];
  List<Map<String, dynamic>> filteredRecettes = [];
  TextEditingController searchController = TextEditingController();
  List<String> favoriteIds = [];
  bool isLoading = true;
  int _selectedIndex = 1;

  getRecipes() async {
    setState(() {
      isLoading = true;
    });
    try {
      dynamic response = await ApiService().getFavorite();
      recettes = List<Map<String, dynamic>>.from(response);
      filteredRecettes = recettes;
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

  void searchRecipes(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredRecettes = recettes;
      });
      return;
    }

    setState(() {
      filteredRecettes =
          recettes.where((recette) {
            return recette['title'].toString().toLowerCase().contains(
              query.toLowerCase(),
            );
          }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
    searchController.addListener(() {
      searchRecipes(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void removeFavorite(String id) async {
    await FavoriteService.removeFavorite(id);
    favoriteIds.remove(id);
    recettes.removeWhere((item) => item['_id'] == id);
    filteredRecettes.removeWhere((item) => item['_id'] == id);
    setState(() {});
  }

  String getPreparationLevel(dynamic preptime) {
    if (preptime == null) return 'Inconnu';
    int time = int.tryParse(preptime.toString()) ?? 0;
    if (time < 25) return 'Facile';
    if (time <= 60) return 'Moyen';
    return 'Difficile';
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        break;
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
          icon: Icon(Icons.arrow_back, color: Color(0xFFFFC107)),
          onPressed: () => Navigator.pop(context),
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
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Quel Recette Vous Souhaitez...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon:
                    searchController.text.isNotEmpty
                        ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            searchRecipes('');
                          },
                        )
                        : null,
              ),
              onChanged: searchRecipes,
            ),
          ),
          Expanded(
            child:
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : filteredRecettes.isEmpty
                    ? Center(
                      child: Text(
                        "Aucune recette trouvée",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                    : ListView.builder(
                      itemCount: filteredRecettes.length,
                      itemBuilder: (context, index) {
                        final recette = filteredRecettes[index];
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
        backgroundColor: Color(0xFFFFC107),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoris'),
        ],
      ),
    );
  }
}
