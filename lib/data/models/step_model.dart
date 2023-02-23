import 'dart:convert';

import 'package:receitas/data/models/ingredient_model.dart';
import 'package:receitas/domain/entities/step.dart';

class StepModel extends Step {
  StepModel({required super.number, required super.step, ingredients});

  static StepModel fromMap(Map<String, dynamic> json) {
    return StepModel(
      number: json['number'],
      step: json['step'],
      ingredients: IngredientModel.fromMapList(json['ingredients']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'step': step,
      'ingredients': ingredients?.map((e) => e.toJson()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  static StepModel fromJson(String source) => fromMap(json.decode(source));

  //retornar uma lista de steps
  static List<StepModel> fromMapList(List<dynamic> json) {
    return json.map((e) => StepModel.fromMap(e)).toList();
  }
}
