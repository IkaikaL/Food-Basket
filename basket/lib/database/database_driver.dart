import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'recipe.dart';
import 'ingredient.dart';
import 'ingredient_property.dart';

//Database Imports
import 'package:basket/database/app_database.dart';
import 'package:basket/database/recipe.dart';class DatabaseDriver {

  void addAllDemoRecipes(){
    //AppDatabase.instance.deleteDB();
    AppDatabase.instance.resetTableRecipes();
    AppDatabase.instance.resetTableInventory();
    addSalad();
    addGreenBeanSalad();
    addMeatBalls();

    testLettuce();
  }

  addSalad(){
    AppDatabase.instance.createRecipe(const Recipe(
        name: 'salad',
        ingredients: 'lettuce, cheese, ranch',
        instructions: 'throw that shit in a bowl',
      ));
  }
  addGreenBeanSalad(){
    AppDatabase.instance.createRecipe(const Recipe(
        name: 'GreenBeanSalad',
        ingredients: 'GreenBeans, balsamic vinaigrette, walnuts',
        instructions: 'throw that shit in a bowl, add heat',
      ));
  }
  addMeatBalls(){
    AppDatabase.instance.createRecipe(const Recipe(
        name: 'Meatballs',
        ingredients: 'Groundmeat, salt, pepper',
        instructions: 'throw that shit in a bowl, add heat',
      ));
  }

  testLettuce() {
    AppDatabase.instance.addIngredientInventory(const Ingredient(
        name: 'lettuce',
        quantity: 0,
        unit: 'oz',
        calories: 0,
        barcode: 145141,
      ));
  }
}