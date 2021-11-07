import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

// Page Imports
import 'pages/samplePage.dart';

//Database Imports
import 'package:basket/database/app_database.dart';
import 'package:basket/database/recipe.dart';

List<Recipe> recipeList = [];

void main() {
  print("main.dart is running");
  //recipeList = AppDatabase.instance.readAllRecipes();

  Recipe testrecipe1 = const Recipe(name: "Meatballs", ingredients: "Ground Meat, eggs", instructions: "1. Cook");
  Recipe testrecipe2 = const Recipe(name: "Turkey Meatballs", ingredients: "Ground Turkey, eggs", instructions: "1. Cook");
  Recipe testrecipe3 = const Recipe(name: "Chicken Meatballs", ingredients: "Ground Chicken, eggs", instructions: "1. Cook");
  recipeList.add(testrecipe1);
  recipeList.add(testrecipe2);
  recipeList.add(testrecipe3);

  runApp(const BasketApp());
}

// Launches the app but does not display a screen
class BasketApp extends StatelessWidget {
  const BasketApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Basket",
      home: LandingScreen(),
    );
  }
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Recipes'),
    ),
    body: ListView.builder(
      itemCount: recipeList.length, 
      itemBuilder: (context, index) {
      return  Column(
        children: [
          const Image(image: AssetImage('assets/images/Meatballs.jpeg')),
          ExpansionTile(
              title: Text(recipeList[index].name),
              children: [
                ListTile(
                  title: Text('Ingredients: ' + recipeList[index].ingredients),
                  ),
                ListTile(
                  title: Text('Instructions: ' + recipeList[index].instructions),
                  ),
              ],
            ),
        ],
      );
      
          
      }
    ),
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
