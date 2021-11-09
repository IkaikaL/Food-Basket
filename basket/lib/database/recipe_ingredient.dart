import 'app_database.dart';
import 'ingredient_property.dart';

class RecipeIngredient {
  final String name;
  final int quantityNeeded;
  final String unit;
  final int? id;

  const RecipeIngredient({
    required this.name,
    required this.quantityNeeded,
    required this.unit,
    this.id,
  });
}
