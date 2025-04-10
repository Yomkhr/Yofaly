import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Desserts extends StatefulWidget {
  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Desserts> {
  String? selectedCategory;
  List<Map<String, dynamic>> allDesserts = [];
  List<Map<String, dynamic>> filteredDesserts = [];
  Set<String> favoriteDesserts = {};
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteDesserts =
          prefs.getStringList('favorite_desserts')?.toSet() ?? {};
    });
  }

  Future<void> toggleFavorite(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (favoriteDesserts.contains(name)) {
        favoriteDesserts.remove(name);
      } else {
        favoriteDesserts.add(name);
      }
      prefs.setStringList('favorite_desserts', favoriteDesserts.toList());
    });
  }

  Future<void> fetchDesserts(String category) async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://your-api-url/desserts?origin=$category'),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      setState(() {
        allDesserts = List<Map<String, dynamic>>.from(data);
        applySearchFilter();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        allDesserts = [];
        filteredDesserts = [];
      });
    }
  }

  void applySearchFilter() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredDesserts =
          allDesserts
              .where((dessert) => dessert['name'].toLowerCase().contains(query))
              .toList();
    });
  }

  Widget buildCategoryButton(String category, String assetPath) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = category;
              fetchDesserts(category);
            });
          },
          child: ClipOval(
            child: Image.asset(
              assetPath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(category, style: TextStyle(fontFamily: 'Cursive', fontSize: 16)),
      ],
    );
  }

  Widget buildRecipeList() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (filteredDesserts.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            "Aucun dessert trouvé.",
            style: TextStyle(fontSize: 18, fontFamily: 'Cursive'),
          ),
        ),
      );
    }

    return Column(
      children:
          filteredDesserts.map((recipe) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/recipedetails2',
                  arguments: recipe,
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.network(
                        recipe['image'],
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.access_time, size: 16),
                                SizedBox(width: 4),
                                Text(recipe['duration']),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              selectedCategory ?? '',
                              style: TextStyle(color: Colors.amber[700]),
                            ),
                            Text(
                              recipe['difficulty'],
                              style: TextStyle(color: Colors.amber[700]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, right: 12),
                      child: GestureDetector(
                        onTap: () => toggleFavorite(recipe['name']),
                        child: Icon(
                          favoriteDesserts.contains(recipe['name'])
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
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
        title: Image.asset('assets/images/logo.png', height: 40),
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
                buildCategoryButton('Marocaine', 'assets/images/marocaine.jpg'),
                buildCategoryButton(
                  'Tunisienne',
                  'assets/images/tunisienne.jpg',
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: buildCategoryButton(
                'Algérienne',
                'assets/images/algerienne.jpg',
              ),
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
                        searchController.clear();
                        allDesserts = [];
                        filteredDesserts = [];
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Desserts ${selectedCategory!}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cursive',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      fetchDesserts(selectedCategory!);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: searchController,
                onChanged: (value) => applySearchFilter(),
                decoration: InputDecoration(
                  hintText: 'Rechercher un dessert...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Expanded(child: SingleChildScrollView(child: buildRecipeList())),
          ],
        ],
      ),
    );
  }
}
