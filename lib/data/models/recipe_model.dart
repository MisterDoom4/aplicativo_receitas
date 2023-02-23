import 'dart:convert';

import 'package:receitas/data/models/ingredient_model.dart';
import 'package:receitas/data/models/instruction_model.dart';
import 'package:receitas/domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel(
      {required super.id,
      required super.title,
      required super.vegetarian,
      required super.imagePath,
      required super.ingredients,
      required super.instructions,
      required super.duration,
      servings,
      glutenFree,
      dairyFree,
      veryHealthy,
      cheap,
      vegan,
      sustainable,
      extendedInstructions,
      popular});

  static RecipeModel fromMap(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      title: json['title'],
      servings: json['servings'],
      imagePath: json['image'],
      duration: json['readyInMinutes'],
      vegetarian: json['vegetarian'],
      glutenFree: json['glutenFree'],
      dairyFree: json['dairyFree'],
      veryHealthy: json['veryHealthy'],
      cheap: json['cheap'],
      vegan: json['vegan'],
      sustainable: json['sustainable'],
      instructions: json['instructions'],
      extendedInstructions:
          InstructionModel.fromJson(json['analyzedInstructions']),
      popular: json['verypopular'],
      ingredients: IngredientModel.fromMapList(json['extendedIngredients']),
    );
  }

  //TODO: arrumar para o meu proprio database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'servings': servings,
      'image': imagePath,
      'readyInMinutes': duration,
      'vegetarian': vegetarian,
      'glutenFree': glutenFree,
      'dairyFree': dairyFree,
      'veryHealthy': veryHealthy,
      'cheap': cheap,
      'vegan': vegan,
      'sustainable': sustainable,
      'instructions': instructions,
      'analyzedInstructions':
          extendedInstructions?.map((e) => e.toJson()).toList(),
      'verypopular': popular,
      'extendedIngredients': ingredients.map((e) => e.toJson()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  static RecipeModel fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source));

  //retornar uma lista de receitas
  static List<RecipeModel> fromMapList(List<dynamic> json) {
    return json.map((e) => RecipeModel.fromMap(e)).toList();
  }
}
