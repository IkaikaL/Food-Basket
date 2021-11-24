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
}
