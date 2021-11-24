// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Page Imports
import 'samplePage.dart';
import 'pantryPage.dart';
import 'package:basket/pages/recipesPage.dart';
//import 'package:basket/pages/scannerPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const pages = [
    pantryPage(),
    RecipesPage(),
    SamplePage(),
    SamplePage(),
    SamplePage(),
  ];
  int indexOfCurrentPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexOfCurrentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.lightGreen,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        currentIndex: indexOfCurrentPage,
        onTap: (int selectedIndex) {
          setState(() {
            indexOfCurrentPage = selectedIndex;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: "Pantry"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner), label: "Scan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Grocery List"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
