// ignore_for_file: file_names


import 'package:flutter/material.dart';

// Routes
import 'samplePage.dart';


List _recipes = [];

class recipesPageRoute extends StatefulWidget {
  const recipesPageRoute({Key? key}) : super(key: key);

  @override
  _recipesPageRoute createState() => _recipesPageRoute();
}

class _recipesPageRoute extends State<recipesPageRoute> {
  final _biggerFont = const TextStyle(fontSize: 28.0);
  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      //body: _recipeList(),
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SampleRoute())),
                  tooltip: "Test String"),
              label: "Pantry"),
          BottomNavigationBarItem(
              icon: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SampleRoute())),
                  tooltip: "Test String"),
              label: "Search"),
          BottomNavigationBarItem(
              icon: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SampleRoute())),
                  tooltip: "Test String"),
              label: "Scan"),
          BottomNavigationBarItem(
              icon: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SampleRoute())),
                  tooltip: "Test String"),
              label: "Grocery List"),
          BottomNavigationBarItem(
              icon: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SampleRoute())),
                  tooltip: "Test String"),
              label: "Favorites"),
        ],
      ),
    );
  }


}