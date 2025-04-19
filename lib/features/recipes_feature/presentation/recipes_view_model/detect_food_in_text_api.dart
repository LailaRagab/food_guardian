import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/recipes_api_service_logic.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/detect_text_in_food_model.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../recipes_models/for_passing_expire_ingredient.dart';

class DetectFoodInTextApi {
  static var dio = Constants.dio;
  static String apiKey = RecipesApiServiceLogic.apiKey;
  static Future<List<DetectTextInFoodModel>> detectFood(
      BuildContext context) async {
    try {
      final text = ForPassingExpireIngredient.instance.getIngredients;

      Response response = await dio.post(
        "https://api.spoonacular.com/food/detect",
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        queryParameters: {
          'apiKey': apiKey,
        },
        data: {
          'text': text,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['annotations'] as List<dynamic>;

        List<DetectTextInFoodModel> originalList = data
            .map((item) => DetectTextInFoodModel.factoryModel(item))
            .toList();

        // Step 1: Remove short/redundant items
        List<DetectTextInFoodModel> filteredList =
            filterMeaningfulAnnotations(originalList);

        // Step 2: Prefer dishes over ingredients
        List<DetectTextInFoodModel> prioritizedList =
            prioritizeDishes(filteredList);

        return prioritizedList;
      } else {
        throw Exception("Failed to detect food.");
      }
    } on DioException catch (ex) {
      final badResponse = ex.response?.statusMessage;
      if (context.mounted) {
        snackBar(context, "Network error: $badResponse", null);
      }
      return [];
    } catch (e) {
      if (context.mounted) {
        snackBar(context, "Error: $e", null);
      }
      return [];
    }
  }

  /// Remove annotations that are substrings of longer ones
  static List<DetectTextInFoodModel> filterMeaningfulAnnotations(
      List<DetectTextInFoodModel> list) {
    List<DetectTextInFoodModel> cleanedList = [];

    for (var item in list) {
      // Skip any that contain a comma (e.g. "tuna,oil")
      if (item.annotation.contains(',')) continue;

      // Keep items that aren't substrings of longer ones
      bool isPartOfAnother = list.any((other) =>
          other != item &&
          other.annotation
              .toLowerCase()
              .contains(item.annotation.toLowerCase()));
      if (!isPartOfAnother) {
        cleanedList.add(item);
      }
    }

    return cleanedList;
  }

  /// Prefer 'dish' tag over 'ingredient'
  static List<DetectTextInFoodModel> prioritizeDishes(
      List<DetectTextInFoodModel> list) {
    List<DetectTextInFoodModel> dishes =
        list.where((item) => item.tag == 'dish').toList();
    return dishes.isNotEmpty ? dishes : list;
  }
}
