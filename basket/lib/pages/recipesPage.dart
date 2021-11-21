// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Routes
import 'samplePage.dart';
import 'package:basket/database/recipe.dart';
import 'package:basket/main.dart';
import 'package:basket/database/app_database.dart';
import 'package:basket/database/ingredient.dart';

class recipesPageRoute extends StatefulWidget {
  const recipesPageRoute({Key? key}) : super(key: key);

  @override
  _recipesPageRoute createState() => _recipesPageRoute();
}

class _recipesPageRoute extends State<recipesPageRoute> {
  int index = 0;
  List<Recipe> recipes = [];
  List<Ingredient> ingredients = [];

  @override
  void initState() {
    super.initState();

    //The statement below will cause 'sqflitedatabaseexception (databaseexception(database_closed))' error when switching pages
    //just comment it out again and the error will go away
    //AppDatabase.instance.deleteDB(); //only use whenever Anthony changes the database structure, or just once whenever using a new pull
    //
    //if you want to clear database contents, use these statements instead:
    //AppDatabase.instance.resetTableRecipes();
    //AppDatabase.instance.resetTableInventory();
    //AppDatabase.instance.resetTableIngredientProperties();

    addIngredient();
    addRecipe();

    refreshIngredients();
  }

  addIngredient() =>
      AppDatabase.instance.addIngredientInventory(const Ingredient(
        name: 'lettuce',
        quantity: 20.7,
        unit: 'oz',
        calories: 100.50,
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
    print(ingredients[0].quantity);
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
