import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toolbitrading/Screens/onboarding_screen/splash_screen.dart';
import 'package:toolbitrading/Screens/onboarding_screen/onboarding_screen.dart';
import 'package:toolbitrading/authentification/login_screen.dart'; // Importez votre page de connexion

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToolBiTrading',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
