import 'package:basket/database/recipe.dart';
import 'package:basket/database/ingredient.dart';

//Database Imports
import 'package:basket/database/app_database.dart';
import 'package:basket/database/grocery_item.dart';

class DatabaseDriver {
  void addAllDemoRecipes() {
    //AppDatabase.instance.deleteDB();
    AppDatabase.instance.resetTableRecipes();
    AppDatabase.instance.resetTableInventory();
    AppDatabase.instance.resetTableIngredientProperties();
    AppDatabase.instance.resetTableGroceries();
    AppDatabase.instance.readAllFavorites();
    addSalad();
    addGreenBeanSalad();
    addMeatBalls();
    AddIngredientLettuce();
  }

  addSalad() {
    AppDatabase.instance.createRecipe(const Recipe(
      name: 'salad',
      ingredients: 'l',
      instructions: 'mix,eat',
    ));
  }

  addGreenBeanSalad() {
    AppDatabase.instance.createRecipe(const Recipe(
      name: 'GreenBeanSalad',
      ingredients: 'f,b,w',
      instructions: 'throw that shit in a bowl,add heat',
    ));
  }

  addMeatBalls() {
    AppDatabase.instance.createRecipe(const Recipe(
      name: 'Meatballs',
      ingredients: 'Groundmeat,salt,pepper',
      instructions: 'throw that shit in a bowl,add heat',
    ));
  }

  addGrocery() {
    AppDatabase.instance.addGroceryItem(const GroceryItem(
      name: 'lettuce',
    ));
  }

  addFavorites() {
    AppDatabase.instance.addFavorite(const Recipe(
      name: 'Meatballs',
      ingredients: 'Groundmeat,salt,pepper',
      instructions: 'throw that shit in a bowl,add heat',
    ));
  }

  AddIngredientLettuce() {
    AppDatabase.instance.addIngredientInventory(const Ingredient(
      name: 'lettuce',
      quantity: 0,
      unit: 'oz',
      calories: 0,
      barcode: 145141,
    ));
  }
}
