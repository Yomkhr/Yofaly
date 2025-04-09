import 'package:shared_preferences/shared_preferences.dart';
import 'package:yofaly/core/api_service.dart';

class FavoriteService {
  static const String _favoritesKey = 'favorite_ids';

  static Future<void> syncFavoritesWithSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final favorites = await ApiService().getFavorites();
      final ids =
          favorites.map<String>((item) => item['_id'].toString()).toList();

      if (ids.isNotEmpty) {
        await prefs.setStringList(_favoritesKey, ids);
      } else {
        await prefs.remove(_favoritesKey); // or set empty list
      }
    } catch (e) {
      print("Failed to sync favorites: $e");
      // Optionally handle the error
    }
  }

  // Get all favorite IDs from SharedPreferences
  static Future<List<String>> getFavoriteIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  // Add ID to favorites list
  static Future<void> addFavorite(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favs = prefs.getStringList(_favoritesKey) ?? [];
    if (!favs.contains(id)) {
      favs.add(id);
      await prefs.setStringList(_favoritesKey, favs);
      await ApiService().addToFavorites(id); // Call your backend here
    }
  }

  // Remove ID from favorites list
  static Future<void> removeFavorite(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favs = prefs.getStringList(_favoritesKey) ?? [];
    if (favs.contains(id)) {
      favs.remove(id);
      await prefs.setStringList(_favoritesKey, favs);
      await ApiService().removeFromFavorites(id); // Call your backend here
    }
  }

  // Check if ID is a favorite
  static Future<bool> isFavorite(String id) async {
    List<String> favs = await getFavoriteIds();
    return favs.contains(id);
  }
}
