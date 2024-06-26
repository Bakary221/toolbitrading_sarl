import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Importation des icônes FontAwesome
import 'package:toolbitrading/authentification/signup_screen.dart';
import 'package:toolbitrading/consts/consts.dart'; // Assurez-vous d'avoir les bonnes variables définies ici

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(20.0),
          color: Colors.white, // Fond gris clair
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo de votre entreprise
              Image.asset(
                splahscreen, // Remplacez par le chemin de votre logo
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20),
              // Champ Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        hintText: 'Entrez votre email',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              // Champ Mot de passe
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mot de passe:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        hintText: 'Entrez votre mot de passe',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // "Se souvenir de moi" Checkbox et "Mot de passe oublié ?" lien
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      Text('Se souvenir de moi'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Action pour "Mot de passe oublié ?"
                    },
                    child: Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Bouton Connexion
              ElevatedButton(
                onPressed: () {
                  // Action pour le bouton de connexion
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Couleur de fond bleue
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  minimumSize: Size(double.infinity,
                      0), // Même largeur que les champs d'entrée
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Connexion',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text('Ou Bien Se Connecter avec'),
              SizedBox(height: 20),
              // Connexion avec Google, Facebook, Twitter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      // Action pour se connecter avec Google
                    },
                    icon: Icon(
                      FontAwesomeIcons.google,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Action pour se connecter avec Facebook
                    },
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Action pour se connecter avec Twitter
                    },
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Texte "Nouveau chez ToolBiTrading ?" avec le lien "S'inscrire"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nouveau chez ToolBiTrading ? ",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigation vers la page SignupScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
