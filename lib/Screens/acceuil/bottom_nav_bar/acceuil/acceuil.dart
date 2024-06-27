import 'package:flutter/material.dart';
import 'package:toolbitrading/Screens/acceuil/bottom_nav_bar/acceuil/views/barre_recherche.dart';
import 'package:toolbitrading/Screens/acceuil/bottom_nav_bar/acceuil/views/carrousel_screen.dart';
import 'package:toolbitrading/Screens/acceuil/bottom_nav_bar/acceuil/views/categories_screen.dart';
import 'package:toolbitrading/Screens/acceuil/bottom_nav_bar/acceuil/views/produits_screen.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "ToolBiTrading",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildBarreRecherche(),
            ImageCarousel(),
            SizedBox(height: 10),
            Categories(),
            SizedBox(height: 10),
            Produits(),
            // Ajoutez d'autres widgets ici si nécessaire
          ],
        ),
      ),
    );
  }
}
