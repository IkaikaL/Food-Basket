import 'recipe.dart';
import 'ingredient.dart';

//Database Imports
import 'package:basket/database/app_database.dart';
import 'package:basket/database/recipe.dart';

class DatabaseDriver {
  void addAllDemoRecipes() {
    //AppDatabase.instance.deleteDB();
    AppDatabase.instance.resetTableRecipes();
    AppDatabase.instance.resetTableInventory();
    AppDatabase.instance.resetTableIngredientProperties();
    addSalad();
    addGreenBeanSalad();
    addMeatBalls();
    AddIngredientLettuce();
  }

  addSalad() {
    AppDatabase.instance.createRecipe(const Recipe(
      name: 'salad',
      ingredients: 'lettuce\n tomato, ranch, crutons',
      instructions: 'mix, eat',
    ));
  }

  addGreenBeanSalad() {
    AppDatabase.instance.createRecipe(const Recipe(
      name: 'GreenBeanSalad',
      ingredients: 'GreenBeans, balsamic vinaigrette, walnuts',
      instructions: 'throw that shit in a bowl, add heat',
    ));
  }

  addMeatBalls() {
    AppDatabase.instance.createRecipe(const Recipe(
      name: 'Meatballs',
      ingredients: 'Groundmeat, salt, pepper',
      instructions: 'throw that shit in a bowl, add heat',
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
