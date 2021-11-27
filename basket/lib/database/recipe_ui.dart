import 'package:basket/database/recipe.dart';

class RecipeUI {
  final int? id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;

  const RecipeUI({
    this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
  });

  List<String> getIngredients() {
    return ingredients;
  }

  List<String> getInstructions() {
    return instructions;
  }

  Recipe toRecipe() {
    String ingr = '';
    String inst = '';
    for (final i in ingredients) {
      ingr = ingr + i;
    }

    for (final j in instructions) {
      inst = inst + j;
    }

    return Recipe(name: name, ingredients: ingr, instructions: inst);
  }
}
