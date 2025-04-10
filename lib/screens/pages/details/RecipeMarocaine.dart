import 'package:flutter/material.dart';
import 'package:yofaly/core/api_service.dart';
import 'package:yofaly/core/favorite_service.dart';
import 'package:yofaly/screens/pages/details/RecipeDetails.dart';
import 'package:yofaly/screens/pages/details/favoris.dart'; // Importez votre page Favoris

class Recipemarocaine extends StatefulWidget {
  final String origin;
  final String recipetype;

  const Recipemarocaine({
    Key? key,
    required this.origin,
    required this.recipetype,
  }) : super(key: key);

  @override
  _RecipemarocaineState createState() => _RecipemarocaineState();
}

class _RecipemarocaineState extends State<Recipemarocaine> {
  List<Map<String, dynamic>> recettes = [];
  List<Map<String, dynamic>> filteredRecettes = [];
  TextEditingController searchController = TextEditingController();

  List<String> favoriteIds = [];
  bool isLoading = true;

  getRecipes() async {
    setState(() {
      isLoading = true;
    });
    try {
      dynamic response = await ApiService().getRecipesByOrigin(widget.origin);
      favoriteIds = await FavoriteService.getFavoriteIds();

      recettes =
          List<Map<String, dynamic>>.from(response).where((r) {
            return (r['recipetype'] as List).contains(widget.recipetype);
          }).toList();

      filteredRecettes = recettes;

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Please contact your System Administrator");
      setState(() {
        isLoading = false;
      });
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
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void toggleFavorite(String id) async {
    bool isFav = favoriteIds.contains(id);
    if (isFav) {
      await FavoriteService.removeFavorite(id);
      favoriteIds.remove(id);
    } else {
      await FavoriteService.addFavorite(id);
      favoriteIds.add(id);
    }
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
          onPressed: () {
            Navigator.pop(context);
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
                        final isFav = favoriteIds.contains(id);
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          RecipeDetails(recette: recette),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    recette['image'] ??
                                        'assets/images/logo.png',
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
                                            Text(
                                              recette['preptime'].toString(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          recette['origins'][0],
                                          style: TextStyle(
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text(
                                          getPreparationLevel(
                                            recette['preptime'],
                                          ),
                                          style: TextStyle(
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    isFav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.yellow,
                                  ),
                                  onPressed: () => toggleFavorite(id),
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
      bottomNavigationBar: Container(
        color: Color(0xFFFFC107),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const SizedBox(width: 40),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.black, size: 28),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                  size: 28,
                ),
                onPressed: () {
                  // Navigation vers la page des favoris
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Favoris()),
                  );
                },
              ),
            ),
            const SizedBox(width: 20),
            Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF4A4A4A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
