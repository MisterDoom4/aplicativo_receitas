import 'dart:convert';

import 'package:receitas/domain/entities/ingredient.dart';

class IngredientModel extends Ingredient {
  IngredientModel(
      {required super.id,
      required super.name,
      required super.amount,
      required super.imagePath});

  static IngredientModel fromMap(Map<String, dynamic> json) {
    return IngredientModel(
      id: json['id'],
      name: json['name'],
      amount: json['amount'],
      imagePath: json['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'image': imagePath,
    };
  }

  String toJson() => json.encode(toMap());

  static IngredientModel fromJson(String source) =>
      fromMap(json.decode(source));

  //retornar uma lista de ingredientes
  static List<IngredientModel> fromMapList(List<dynamic> json) {
    return json.map((e) => IngredientModel.fromMap(e)).toList();
  }
}
