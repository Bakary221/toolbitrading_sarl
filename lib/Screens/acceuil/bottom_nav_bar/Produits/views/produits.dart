import 'package:flutter/material.dart';
import 'package:toolbitrading/consts/consts.dart';

// Modèle de données pour chaque produit
class ProductItem {
  final String name;
  final String image;
  final double originalPrice;
  final double discountedPrice;

  ProductItem({
    required this.name,
    required this.image,
    required this.originalPrice,
    required this.discountedPrice,
  });
}

// Modèle de données pour chaque catégorie avec des produits
class Category {
  final String name;
  final List<ProductItem> products;

  Category({
    required this.name,
    required this.products,
  });
}

// Exemple de données pour les catégories et les produits
List<Category> categories = [
  Category(
    name: 'Jus',
    products: [
      ProductItem(
        name: 'Jus de fruits',
        image: carrousel1,
        originalPrice: 5.99,
        discountedPrice: 4.49,
      ),
      ProductItem(
        name: 'Jus d\'orange',
        image: carrousel2,
        originalPrice: 3.49,
        discountedPrice: 2.99,
      ),
    ],
  ),
  Category(
    name: 'Sucre',
    products: [
      ProductItem(
        name: 'Sucre blanc',
        image: carrousel2,
        originalPrice: 2.99,
        discountedPrice: 1.99,
      ),
      ProductItem(
        name: 'Sucre brun',
        image: carrousel2,
        originalPrice: 1.49,
        discountedPrice: 0.99,
      ),
    ],
  ),
  Category(
    name: 'Pain',
    products: [
      ProductItem(
        name: 'Baguette',
        image: carrousel2,
        originalPrice: 2.99,
        discountedPrice: 1.99,
      ),
      ProductItem(
        name: 'Pain brun',
        image: carrousel2,
        originalPrice: 1.49,
        discountedPrice: 0.99,
      ),
    ],
  ),
];

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? selectedCategory;
  List<ProductItem> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = categories.expand((cat) => cat.products).toList();
  }

  void filterProducts(String? categoryName) {
    setState(() {
      if (categoryName == null) {
        filteredProducts = categories.expand((cat) => cat.products).toList();
      } else {
        filteredProducts = categories
            .firstWhere((category) => category.name == categoryName)
            .products;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Nos Produits',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width *
                  0.8, // 80% de la largeur de l'écran
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        hint: Text('Sélectionnez une catégorie'),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                            filterProducts(value);
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text('Toutes les catégories...'),
                            value: null,
                          ),
                          ...categories.map((category) {
                            return DropdownMenuItem(
                              child: Text(category.name),
                              value: category.name,
                            );
                          }).toList(),
                        ],
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down), // Icone de fleche
                        isExpanded: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50], // Couleur de fond grise
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Image.asset(
                              filteredProducts[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          filteredProducts[index].name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$${filteredProducts[index].originalPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '\$${filteredProducts[index].discountedPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Action d'ajout au panier
                            print(
                                'Ajouter au panier: ${filteredProducts[index].name}');
                          },
                          icon: Icon(Icons.shopping_cart, color: Colors.white),
                          label: Text(
                            'Ajouter au panier',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
