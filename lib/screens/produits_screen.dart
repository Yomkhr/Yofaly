import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yofaly/providers/produit_provider.dart';
import 'package:intl/intl.dart';

class ProduitsScreen extends StatefulWidget {
  const ProduitsScreen({Key? key}) : super(key: key);

  @override
  _ProduitsScreenState createState() => _ProduitsScreenState();
}

class _ProduitsScreenState extends State<ProduitsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProduitProvider>().loadProduits();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Produits'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<ProduitProvider>().loadProduits(),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<ProduitProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.error != null) {
          return Center(child: Text('Erreur: ${provider.error}'));
        }

        if (provider.produits.isEmpty) {
          return const Center(child: Text('Aucun produit disponible'));
        }

        return ListView.builder(
          itemCount: provider.produits.length,
          itemBuilder: (context, index) {
            final produit = provider.produits[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(produit.nom),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Prix: ${produit.prix} FCFA'),
                    if (produit.createdAt != null)
                      Text(
                        'Ajouté le: ${DateFormat('dd/MM/yyyy').format(produit.createdAt!)}',
                        style: const TextStyle(fontSize: 12),
                      ),
                  ],
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigation vers le détail
                },
              ),
            );
          },
        );
      },
    );
  }
}
