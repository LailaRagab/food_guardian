import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/snack_bar.dart';

class RecipesApiServiceLogic {
  static var dio = Constants.dio;
  static String basePath = "https://api.spoonacular.com/recipes";
  static String apiKey = "61d9443f7f2a4e75a9852d346df1c217";
  static Future<List<RecipesModel>> fetchRecipesFromApi(
      BuildContext context, var listModels) async {
    try {
      final model = listModels.map((model) => model);
      String ingredient = model.map((item) => item.annotation).join(",");

      Response request = await dio.get(
          "$basePath/findByIngredients?apiKey=$apiKey&ingredients=$ingredient&number=100&ignorePantry=false");

      if (request.statusCode == 200) {
        List<dynamic> recipesDataField = request.data;
        List<RecipesModel> recipesList =
            recipesDataField.map((item) => RecipesModel.model(item)).toList();
        return recipesList;
      }
    } on DioException catch (ex) {
      final badResponse = ex.response?.statusMessage;
      if (badResponse == "Not Found" && context.mounted) {
        snackBar(context, "Sorry, there is no recipes for this item", null);
      } else {
        snackBar(context, "Network error: $badResponse", null);
      }
    } catch (e) {
      if (context.mounted) {
        snackBar(context, "There is an error, please try again+$e", null);
      }
    }

    throw Exception("Failed to fetch recipe");
  }
}
