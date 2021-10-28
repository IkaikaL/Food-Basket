import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

// Page Imports
import 'pages/logInPage.dart';

void main() async {
  print("test");
  runApp(const BasketApp());
}

class BasketApp extends StatelessWidget {
  const BasketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Basket",
      home: Title(),
      );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Startup Name Generator'),
      actions: [ IconButton(icon: const Icon(Icons.person), 
          onPressed:  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FirstRoute())),
          tooltip: "Test String")
                ]
      ),
    );
    throw UnimplementedError();
  }
  
}