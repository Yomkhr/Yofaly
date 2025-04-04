class Produit {
  final String id;
  final String nom;
  final double prix;
  final DateTime? createdAt;

  Produit({
    required this.id,
    required this.nom,
    required this.prix,
    this.createdAt,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: json['_id'],
      nom: json['nom'],
      prix: json['prix'].toDouble(),
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prix': prix,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    };
  }
}
