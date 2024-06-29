import 'package:flutter/material.dart';
import 'package:toolbitrading/consts/consts.dart'; // Assurez-vous d'avoir les bonnes variables définies ici

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text(
              "Sauter",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return ContentTemplate(
                    image: onboardingData[index]['image']!,
                    title: onboardingData[index]['title']!,
                    description: onboardingData[index]['description']!,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    onboardingData.length,
                    (index) => Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: _currentPage == index ? blue : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_currentPage < onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: blue,
                    radius: size.width *
                        0.05, // Adaptez la taille du cercle en fonction de la largeur de l'écran
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height:
                    size.height * 0.02), // Espace adaptatif entre les éléments
          ],
        ),
      ),
    );
  }
}

class ContentTemplate extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const ContentTemplate({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: size.height *
              0.5, // Adaptez la taille de l'image en fonction de la hauteur de l'écran
        ),
        SizedBox(height: size.height * 0.05),
        Text(
          title,
          style: TextStyle(
            fontSize: 24, // Taille de police personnalisée
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width *
                  0.1), // Espace adaptatif horizontal pour le texte
          child: Text(
            description,
            style: TextStyle(
              fontSize: 17, // Taille de police personnalisée
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

// Données d'exemple pour l'onboarding
const List<Map<String, String>> onboardingData = [
  {
    'image': onboarding1,
    'title': livraison,
    'description': desLivraison,
  },
  {
    'image': onboarding2,
    'title': loclisation,
    'description': desLocalisation,
  },
  {
    'image': onboarding3,
    'title': panier,
    'description': desPanier,
  },
];
