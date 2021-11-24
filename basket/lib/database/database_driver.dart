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
      ingredients:
          '3/4 cup canola oil \n1/4 cup lemon juice\n2 garlic cloves, minced\n1/2 teaspoon salt\n1/2 teaspoon pepper\n2 bunches (1 pound each) romaine, torn\n2 cups chopped tomatoes\n1 cup shredded Swiss cheese\n2/3 cup slivered almonds, toasted, optional\n1/2 cup grated Parmesan cheese\n8 bacon strips, cooked and crumbled\n1 cup Caesar salad croutons',
      instructions:
          'In a jar with a tight-fitting lid, combine the oil, lemon juice, garlic, salt and pepper; cover and shake well. Chill.\nIn a large serving bowl, toss the romaine, tomatoes, Swiss cheese, almonds if desired, Parmesan cheese and bacon.\nShake dressing; pour over salad and toss. Add croutons and serve immediately.',
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
