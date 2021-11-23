// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Routes
import 'package:basket/database/recipe.dart';
import 'package:basket/database/ingredient.dart';

import 'package:basket/database/app_database.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPage createState() => _RecipesPage();
}

class _RecipesPage extends State<RecipesPage> {
  int indexOfRecipeList = 0;
  List<Recipe> recipes = [];
  List<Ingredient> ingredients = [];

  @override
  void initState() {
    super.initState();
    refreshIngredients();
  }

  Future refreshIngredients() async {
    ingredients = await AppDatabase.instance.readAllInventory();
    recipes = await AppDatabase.instance.searchRecipeIngredients(ingredients);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, indexOfRecipeList) {
            return Column(
              children: [
                const Image(image: AssetImage('assets/images/Meatballs.jpeg')),
                ExpansionTile(
                  title: Text(recipes[indexOfRecipeList].name),
                  children: [
                    ListTile(
                      title: Text('Ingredients: ' + recipes[indexOfRecipeList].ingredients),
                    ),
                    ListTile(
                      title:
                          Text('Instructions: ' + recipes[indexOfRecipeList].instructions),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
