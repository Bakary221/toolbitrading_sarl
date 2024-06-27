import 'package:flutter/material.dart';
import 'package:toolbitrading/consts/consts.dart';

class Produits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Exemple de liste de produits
    List<ProductItem> products = [
      ProductItem(
        name: 'Jus de fruits',
        image: carrousel1,
        originalPrice: 5.99,
        discountedPrice: 4.49,
      ),
      ProductItem(
        name: 'Sucre',
        image: carrousel2,
        originalPrice: 3.49,
        discountedPrice: 2.99,
      ),
      ProductItem(
        name: 'Sel',
        image: carrousel3,
        originalPrice: 2.99,
        discountedPrice: 1.99,
      ),
      ProductItem(
        name: 'Oignon',
        image: carrousel2,
        originalPrice: 1.49,
        discountedPrice: 0.99,
      ),
      // Ajoutez d'autres produits selon vos besoins
    ];

    return Container(
      padding: EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Produits',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.0),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          products[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      products[index].name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\$${products[index].originalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '\$${products[index].discountedPrice.toStringAsFixed(2)}',
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
                        print('Ajouter au panier: ${products[index].name}');
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
        ],
      ),
    );
  }
}

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
