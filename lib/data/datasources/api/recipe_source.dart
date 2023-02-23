import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/recipe_model.dart';

class RecipeSource {
  final String apiKey = '287f216933084c278908c14d55470e99';

  Future<List<RecipeModel>> getResults(String query, String number) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=$query&number=$number'));
    if (response.statusCode == 200) {
      return RecipeModel.fromMapList(jsonDecode(response.body)['results']);
    } else {
      throw Exception('Failed to load API');
    }
  }

  Future<RecipeModel> getRecipe(String id) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$id/information?apiKey=$apiKey'));
    if (response.statusCode == 200) {
      return RecipeModel.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load API');
    }
  }

  Future<List<RecipeModel>> getRecipesByIngredients(
      String ingredients, String number) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/findByIngredients?apiKey=$apiKey&ingredients=$ingredients&number=$number'));
    if (response.statusCode == 200) {
      return RecipeModel.fromMapList(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load API');
    }
  }
}
