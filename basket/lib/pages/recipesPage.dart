// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'samplePage.dart';

// This is called by the landing page and constructs a new page.
// Here Scaffold is used again to produce a basic design UI.
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
        BottomNavigationBarItem(icon: 
              IconButton(icon: const Icon(Icons.person), 
              onPressed:  () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SampleRoute())),
              tooltip: "Test String"),
              label: "Inventory"
        ),
        BottomNavigationBarItem(icon: 
              IconButton(icon: const Icon(Icons.person), 
              onPressed:  () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SampleRoute())),
              tooltip: "Test String"),
              label: "Scan"
        ),
        BottomNavigationBarItem(icon: 
              IconButton(icon: const Icon(Icons.person), 
              onPressed:  () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SampleRoute())),
              tooltip: "Test String"),
              label: "Recipes"
        ),
        BottomNavigationBarItem(icon: 
              IconButton(icon: const Icon(Icons.person), 
              onPressed:  () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SampleRoute())),
              tooltip: "Test String"),
              label: "Browse All"
        ),
      ],
      ),
    );
  }
}

Widget _recipeList() {
  return ListView.builder(
    padding: const EdgeInsets.all(16.0),
    itemBuilder: (context, i) {
      if (i.isOdd) return const Divider();
      final index = i ~/ 2;
      if (index >= _recipes.length) {
        _recipes.addAll();
      }
      return _buildRow();
    }
  );
}

Widget _buildRow() {
  return ListTile(
    title: 
  );
}