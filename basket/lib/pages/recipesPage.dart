// ignore_for_file: file_names, camel_case_types

import 'package:basket/database/recipe.dart';
import 'package:flutter/material.dart';

// Database Imports
import 'package:basket/database/ingredient.dart';
import 'package:basket/database/app_database.dart';
import 'package:basket/database/recipe_ui.dart';

int indexOfRecipeList = 0;
List<RecipeUI> recipes = [];
List<Ingredient> ingredients = [];

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPage createState() => _RecipesPage();
}

class _RecipesPage extends State<RecipesPage> {
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

  String findWhichImageToUse(int index) {
    String recipeName = recipes[index].name;
    String fileFinder = 'assets/images/' + recipeName + '.jpg';
    return fileFinder;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('Recipes'),
        centerTitle: true,
        backgroundColor: (Colors.lightGreen),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, indexOfRecipeList) {
          return Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Ink.image(
                          image: AssetImage(
                              findWhichImageToUse(indexOfRecipeList)),
                          child: InkWell(
                            onTap: () {},
                          ),
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            AppDatabase.instance.addFavorite(
                                (recipes[indexOfRecipeList]).toRecipe());
                          },
                          child: Icon(Icons.star),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          mini: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 1),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              recipes[indexOfRecipeList].name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                          child: Text(
                            'View Recipe',
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const singleRecipe()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class singleRecipe extends StatefulWidget {
  const singleRecipe({Key? key}) : super(key: key);

  @override
  _singleRecipe createState() => _singleRecipe();
}

class _singleRecipe extends State<singleRecipe> {
  Future refreshIngredients() async {
    ingredients = await AppDatabase.instance.readAllInventory();
    recipes = await AppDatabase.instance.searchRecipeIngredients(ingredients);
  }

  String findWhichNameToPutAtTop(int index) {
    String name = recipes[index].name;
    return name;
  }

  String findWhichImageToUse(int index) {
    String recipeName = recipes[index].name;
    String fileFinder = 'assets/images/' + recipeName + '.jpg';
    return fileFinder;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(findWhichNameToPutAtTop(indexOfRecipeList)),
        backgroundColor: (Colors.lightGreen),
      ),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Ink.image(
                  image: AssetImage(findWhichImageToUse(indexOfRecipeList)),
                  child: InkWell(
                    onTap: () {},
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10).copyWith(left: 5),
              child: Column(
                children: [
                  for (final currentIngredient
                      in recipes[indexOfRecipeList].getIngredients()) ...[
                    Text(
                      currentIngredient,
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10).copyWith(left: 5),
              child: Column(
                children: [
                  for (final currentInstructions
                      in recipes[indexOfRecipeList].getInstructions()) ...[
                    Text(
                      currentInstructions,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
