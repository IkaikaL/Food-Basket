// ignore_for_file: file_names

import 'package:basket/pages/recipesPage.dart';
import 'package:basket/pages/scannerPage.dart';
import 'package:flutter/material.dart';

// Page Imports
import 'samplePage.dart';
import 'pantryPage.dart';

//Database Imports
import 'package:basket/database/app_database.dart';
import 'package:basket/database/recipe.dart';
import 'package:basket/database/database_driver.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const pages = [
    pantryPage(),
    RecipesPage(),
    BarCodeScanner(),
    SamplePage(),
    SamplePage(),
  ];
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      // Creates the buttons at the bottom of the page
      bottomNavigationBar: BottomNavigationBar(
        // Styling Options
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        // Icon Behaviors
        currentIndex: index,
        onTap: (int selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        // NavBar Icon Construction
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Pantry"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Scan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Grocery List"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Favorites"),
        ],
      ),
    );
  }
}
