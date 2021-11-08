// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Routes
import 'samplePage.dart';
import 'package:basket/database/recipe.dart';
import 'package:basket/main.dart';
import 'package:basket/database/app_database.dart';
import 'package:basket/database/ingredient.dart';
/*
class pantryPageRoute extends StatefulWidget {
  const pantryPageRoute({Key? key}) : super(key: key);

  @override
  _pantryPageRoute createState() => _pantryPageRoute();
}

class _pantryPageRoute extends State<pantryPageRoute> {
  Future<List<Ingredient>> ingredientList() async {
    return await AppDatabase.instance.readAllIngredients();
  }

  late List<Ingredient> lengthOfIngredientsDatabase;
  int index = 0;
  void initState() {
    lengthOfIngredientsDatabase = ingredientList() as List<Ingredient>;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: lengthOfIngredientsDatabase.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const Image(image: AssetImage('assets/images/Meatballs.jpeg')),
                ExpansionTile(
                  title: Text(recipeList[index].name),
                  children: [
                    ListTile(
                      title:
                          Text('Ingredients: ' + recipeList[index].ingredients),
                    ),
                    ListTile(
                      title: Text(
                          'Instructions: ' + recipeList[index].instructions),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
*/