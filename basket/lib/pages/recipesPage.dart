// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Routes
import 'package:basket/database/recipe.dart';
import 'package:basket/database/app_database.dart';
import 'package:basket/database/ingredient.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPage createState() => _RecipesPage();
}

class _RecipesPage extends State<RecipesPage> {
  int index = 0;
  List<Recipe> recipes = [];
  List<Ingredient> ingredients = [];

  @override
  void initState() {
    super.initState();

    //to clear recipe table
    //AppDatabase.instance.resetTableRecipes();
    AppDatabase.instance.deleteDB();
    addIngredient();
    addRecipe();

    refreshIngredients();
  }

  addIngredient() =>
      AppDatabase.instance.addIngredientInventory(const Ingredient(
        name: 'lettuce',
        quantity: 0,
        unit: 'oz',
        calories: 0,
        barcode: 145141,
      ));
  addRecipe() => AppDatabase.instance.createRecipe(const Recipe(
        name: 'salad',
        ingredients: 'lettuce, cheese, ranch',
        instructions: 'throw that shit in a bowl',
      ));

  Future refreshIngredients() async {
    ingredients = await AppDatabase.instance.readAllInventory();
    recipes = await AppDatabase.instance.searchRecipeIngredients(ingredients);

    //testing statement
    //print(recipes.length);
    print(recipes.length);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const Image(image: AssetImage('assets/images/Meatballs.jpeg')),
                ExpansionTile(
                  title: Text(recipes[index].name),
                  children: [
                    ListTile(
                      title: Text('Ingredients: ' + recipes[index].ingredients),
                    ),
                    ListTile(
                      title:
                          Text('Instructions: ' + recipes[index].instructions),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
