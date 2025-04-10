import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profil> {
  String? email = "";

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E7DC),
      body: SafeArea(
        child: Column(
          children: [
            // Flèche de retour + Logo centré
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFFAD643),
                        size: 28,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset('assets/images/logo.png', height: 40),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Avatar orange centré
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFF29C38),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 30),

            // Titre Email à gauche
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text(
                "Email",
                style: TextStyle(
                  color: Color(0xFFFAD643),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Champ Email désactivé
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                enabled: false,
                controller: TextEditingController(text: email),
                decoration: const InputDecoration(border: InputBorder.none),
                style: const TextStyle(color: Colors.grey),
              ),
            ),

            const SizedBox(height: 30),

            // Bouton Déconnexion (modifié ici)
            ElevatedButton(
              onPressed: _logout,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107), // Changé ici
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text('Déconnexion'),
            ),

            const Spacer(),

            // Barre de navigation en bas (modifiée ici)
            Container(
              color: const Color(0xFFFFC107), // Changé ici
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(
                        Icons.home,
                        color: Colors.black,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorites');
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
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
          ],
        ),
      ),
    );
  }
}
