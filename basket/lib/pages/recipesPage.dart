// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

// Database Imports
import 'package:basket/database/recipe.dart';
import 'package:basket/database/ingredient.dart';
import 'package:basket/database/app_database.dart';

int indexOfRecipeList = 0;
List<Recipe> recipes = [];
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Recipes'),
          backgroundColor: (Colors.lightGreen),
        ),
        body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, indexOfRecipeList) {
              return Column(children: [
                Card(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
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
                        ],
                      ),
                      SizedBox(height: 1),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              recipes[indexOfRecipeList].name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: Text(
                              'Share',
                            ),
                            onPressed: () {},
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black,
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
                )
              ]);
            }));
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
          children: [
            Stack(
              alignment: Alignment.bottomRight,
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
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(10).copyWith(left: 0),
              child: Text(
                recipes[indexOfRecipeList].ingredients,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(10).copyWith(left: 0),
              child: Text(
                recipes[indexOfRecipeList].instructions,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
