import 'package:receitas/data/models/ingredient_model.dart';
import 'package:receitas/data/models/instruction_model.dart';

class Recipe {
  final int id;
  final String title;
  final bool vegetarian;
  final bool? glutenFree;
  final bool? dairyFree;
  final bool? veryHealthy;
  final bool? cheap;
  final bool? vegan;
  final String imagePath;
  final bool? sustainable;
  final List<IngredientModel> ingredients;
  final int? servings;
  final String instructions;
  final List<InstructionModel>? extendedInstructions;
  final bool? popular;
  final int duration;

  Recipe({
    required this.id,
    required this.title,
    required this.vegetarian,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.vegan,
    required this.imagePath,
    this.sustainable,
    required this.ingredients,
    this.servings,
    required this.instructions,
    this.extendedInstructions,
    this.popular,
    required this.duration,
  });
}
