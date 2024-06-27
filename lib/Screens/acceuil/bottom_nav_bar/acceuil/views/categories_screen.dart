import 'package:flutter/material.dart';
import 'package:toolbitrading/consts/consts.dart';

class Categories extends StatelessWidget {
  // Liste des catégories avec leurs noms et images
  final List<CategoryItem> categories = [
    CategoryItem(name: 'Jus', image: carrousel1),
    CategoryItem(name: 'Sucre', image: carrousel2),
    CategoryItem(name: 'Sel', image: carrousel3),
    CategoryItem(name: 'Oignon', image: carrousel1),
    CategoryItem(name: 'Pomme de terre', image: carrousel2),
    // Ajoutez d'autres catégories selon vos besoins
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Text(
              'Catégories',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Action lorsque l'utilisateur appuie sur le bouton
                      print('Catégorie ${category.name} sélectionnée');
                    },
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(category.image),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          category.name,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Modèle de données pour chaque catégorie
class CategoryItem {
  final String name;
  final String image;

  CategoryItem({required this.name, required this.image});
}
