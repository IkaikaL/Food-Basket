// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

// Database Imports
import 'package:basket/database/app_database.dart';
import 'package:basket/database/recipe_ui.dart';

int indexOfFavoritesList = 0;
List<RecipeUI> favoritedRecipes = [];

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPage createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    refreshFavorites();
  }

  Future refreshFavorites() async {
    favoritedRecipes = await AppDatabase.instance.readAllFavorites();
    //print(favoritedRecipes[0].name);
    setState(() {});
  }

  String findWhichImageToUse(int index) {
    String recipeName = favoritedRecipes[index].name;
    String fileFinder = 'assets/images/' + recipeName + '.jpg';
    return fileFinder;
  }

  @override
  Widget build(BuildContext context) {
    refreshFavorites();
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        backgroundColor: (Colors.lightGreen),
      ),
      body: ListView.builder(
        itemCount: favoritedRecipes.length,
        itemBuilder: (context, indexOfFavoritesList) {
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
                              findWhichImageToUse(indexOfFavoritesList)),
                          child: InkWell(
                            onTap: () {},
                          ),
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            AppDatabase.instance.deleteFavorites(
                                favoritedRecipes[indexOfFavoritesList].id!);
                            setState(() {
                              build(context);
                            });
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
                            favoritedRecipes[indexOfFavoritesList].name,
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
              )
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
    favoritedRecipes = await AppDatabase.instance.readAllFavorites();
  }

  String findWhichNameToPutAtTop(int index) {
    String name = favoritedRecipes[index].name;
    return name;
  }

  String findWhichImageToUse(int index) {
    String recipeName = favoritedRecipes[index].name;
    String fileFinder = 'assets/images/' + recipeName + '.jpg';
    return fileFinder;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(findWhichNameToPutAtTop(indexOfFavoritesList)),
        backgroundColor: (Colors.lightGreen),
      ),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Ink.image(
                  image: AssetImage(findWhichImageToUse(indexOfFavoritesList)),
                  child: InkWell(
                    onTap: () {},
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 1),
            Padding(
              padding: EdgeInsets.all(10).copyWith(left: 5),
              child: Column(
                children: [
                  for (final currentIngredient
                      in favoritedRecipes[indexOfFavoritesList]
                          .getIngredients()) ...[
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
                      in favoritedRecipes[indexOfFavoritesList]
                          .getInstructions()) ...[
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
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          AppDatabase.instance.addGroceryList(
              (favoritedRecipes[indexOfFavoritesList]).toRecipe());
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Ingredients to Grocery List'),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
        ),
      ),
    );
  }
}
