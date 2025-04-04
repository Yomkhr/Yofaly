import 'package:flutter/foundation.dart';
import 'package:yofaly/core/api_service.dart';
import 'package:yofaly/models/produit_model.dart';

class ProduitProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Produit> _produits = [];
  bool _isLoading = false;
  String? _error;

  List<Produit> get produits => _produits;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadProduits() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await _apiService.getProduits();
      _produits = data.map((json) => Produit.fromJson(json)).toList();
    } catch (e) {
      _error = e.toString();
      debugPrint('Erreur: $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
