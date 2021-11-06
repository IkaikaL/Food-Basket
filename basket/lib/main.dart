import 'package:basket/pages/recipesPage.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

// Page Imports
import 'pages/samplePage.dart';

void main() {
  print("main.dart is running");
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
  final _biggerFont = const TextStyle(fontSize: 28.0);
  String username = "UserName";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Good Enough for now
      // Must be fixed before production.
      body: Center(
        child: Text("Welcome Back\n " + username, style: _biggerFont),
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
                          builder: (context) => const recipesPageRoute())),
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
