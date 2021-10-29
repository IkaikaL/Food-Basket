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

// Called by app widget to create the visual of the first page.
// Here Scaffold does the heavy lifting by giving us a predesigned
// UI for the page. Scaffold fills in the predesign with strings
// and other widgets (like IconButton) with a basic styling

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Basket'),
      actions: [ IconButton(icon: const Icon(Icons.person), 
          onPressed:  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SampleRoute())),
          tooltip: "Test String")
                ]
      ),
    );
    throw UnimplementedError();
  }
  
}