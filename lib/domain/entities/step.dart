import 'package:receitas/data/models/ingredient_model.dart';

class Step {
  final int number;
  final String step;
  final List<IngredientModel>? ingredients;

  Step({required this.number, required this.step, this.ingredients});
}
