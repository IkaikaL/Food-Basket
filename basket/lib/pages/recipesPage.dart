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

  @override
  void initState() {
    super.initState();

    //to clear recipe table
    //AppDatabase.instance.resetTableRecipes()

    addRecipe();
    refreshIngredients();
  }

  addRecipe() => AppDatabase.instance.createRecipe(Recipe(
        name: 'salad',
        ingredients: 'lettuce, cheese, ranch',
        instructions: 'throw that shit in a bowl',
      ));

  Future refreshIngredients() async {
    recipes = await AppDatabase.instance.readAllRecipes();

    //testing statement
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
