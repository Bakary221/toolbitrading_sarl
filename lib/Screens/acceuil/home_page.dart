import 'package:flutter/material.dart';
import 'package:toolbitrading/Screens/acceuil/bottom_nav_bar/bottom_nav_bar_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationBarExampleApp(),
    );
  }
}
