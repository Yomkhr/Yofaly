import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'signupSuccess.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignupScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8ED),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/logo.png', width: 100),
                SizedBox(height: 20),
                Text(
                  'Créer Un Compte',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),

                _buildLabeledTextField(
                  label: 'Nom Complet',
                  hint: 'John Doe',
                  controller: fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom complet';
                    }
                    return null;
                  },
                ),

                _buildLabeledTextField(
                  label: 'Email',
                  hint: 'example@gmail.com',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre email';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ),

                _buildLabeledPasswordTextField(
                  label: 'Mot De Passe',
                  obscureText: _obscurePassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un mot de passe';
                    }
                    if (value.length < 8) {
                      return 'Le mot de passe doit contenir au moins 8 caractères';
                    }
                    return null;
                  },
                ),

                _buildLabeledPasswordTextField(
                  label: 'Confirmer Mot De Passe',
                  obscureText: _obscureConfirmPassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Les mots de passe ne correspondent pas';
                    }
                    return null;
                  },
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "En continuant, vous acceptez les Conditions d'utilisation et la Politique de confidentialité.",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpSuccess(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text('Créer', style: TextStyle(color: Colors.black)),
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Déjà un compte ? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Connexion',
                        style: TextStyle(color: Colors.amber[700]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    FormFieldValidator<String>? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label :', style: TextStyle(color: Colors.amber[700])),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorStyle: TextStyle(color: Colors.red),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildLabeledPasswordTextField({
    required String label,
    required bool obscureText,
    required VoidCallback toggleVisibility,
    required TextEditingController controller,
    FormFieldValidator<String>? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label :', style: TextStyle(color: Colors.amber[700])),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: toggleVisibility,
            ),
            errorStyle: TextStyle(color: Colors.red),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
