import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/recipes_api_service_logic.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../recipes_models/recipe_details_model.dart';

class RecipeDetailsApiService {
  static var dio = Constants.dio;
  static String apiKey = RecipesApiServiceLogic.apiKey;
  static String base = RecipesApiServiceLogic.basePath;

  static Future<List<RecipeDetailsModel>> getRecipeDetails(
      String id, BuildContext context) async {
    try {
      Response response = await dio.get(
        "$base/$id/analyzedInstructions?apiKey=$apiKey",
      );

      if (response.statusCode == 200) {
        final dynamic dataField = response.data;
        if (dataField.isNotEmpty) {
          final List<dynamic> stepsDataField = dataField[0]['steps'];
          List<RecipeDetailsModel> recipeSteps = stepsDataField
              .map((item) => RecipeDetailsModel.factoryRecipeDetailsModel(item))
              .toList();
          return recipeSteps;
        }
      } else {
        throw Exception("Failed to fetch recipe: ${response.statusMessage}");
      }
    } on DioException catch (ex) {
      final badResponse = ex.response?.statusMessage;
      if (badResponse == "Not Found" && context.mounted) {
        snackBar(
            context, "Sorry, there is no instructions of this recipe", null);
        return []; // Don't throw again
      } else if (context.mounted) {
        snackBar(context, "There is a network error, please try again", null);
        return [];
      }
    } catch (e) {
      if (context.mounted) {
        snackBar(context, "There is an error, please try again", null);
        return [];
      }
    }
    // We should never reach here, but just in case
    return [];
  }
}
