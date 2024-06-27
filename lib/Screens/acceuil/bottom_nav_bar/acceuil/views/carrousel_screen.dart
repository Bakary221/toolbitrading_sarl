import 'dart:async';
import 'package:flutter/material.dart';
import 'package:toolbitrading/consts/consts.dart'; // Assurez-vous d'importer correctement vos constantes d'images

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  // Liste des chemins d'accès des images depuis les assets
  List<String> _imageList = [carrousel1, carrousel2, carrousel3];
  // Index de l'image actuellement affichée
  int _currentIndex = 0;
  // Timer pour changer d'image toutes les 2 secondes
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Initialisation du timer pour le changement automatique des images
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imageList.length;
      });
    });
  }

  @override
  void dispose() {
    // Arrêt du timer lorsque le widget est détruit pour éviter des fuites de mémoire
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          _imageList[_currentIndex],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
