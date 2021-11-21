import 'package:basket/pages/recipesPage.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

// Page Imports
import 'pages/samplePage.dart';
import 'pages/pantryPage.dart';
import 'pages/landingPage.dart';
//Database Imports
import 'package:basket/database/app_database.dart';
import 'package:basket/database/recipe.dart';
import 'package:basket/database/database_driver.dart';


void main() {
  DatabaseDriver().addAllDemoRecipes();
  runApp(const BasketApp());
}

// Launches the app but does not display a screen
class BasketApp extends StatelessWidget {
  const BasketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Basket",
      home: LandingPage(),
    );
  }
}
