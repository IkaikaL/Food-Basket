const String tableIngredients = 'inventory';

class IngredientFields {
  static final List<String> values = [
    id,
    name,
    quantity,
    unit,
  ];

  static const id = '_id';
  static const name = 'name';
  static const quantity = 'quantity';
  static const unit = 'unit';
}

class Ingredient {
  final int? id;
  final String name;
  final int quantity;
  final String unit;

  const Ingredient({
    this.id,
    required this.name,
    required this.quantity,
    required this.unit,
  });

  Ingredient copy({
    int? id,
    String? name,
    int? quantity,
    String? unit,
  }) =>
      Ingredient(
        id: id ?? this.id,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
      );

  static Ingredient fromJson(Map<String, Object?> json) => Ingredient(
        id: json[IngredientFields.id] as int?,
        name: json[IngredientFields.name] as String,
        quantity: json[IngredientFields.quantity] as int,
        unit: json[IngredientFields.unit] as String,
      );

  Map<String, Object?> toJson() => {
        IngredientFields.id: id,
        IngredientFields.name: name,
        IngredientFields.quantity: quantity,
        IngredientFields.unit: unit,
      };
}
