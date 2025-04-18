import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/recipes_api_service_logic.dart';

import '../../../../core/utils/constants/constants.dart';
import '../../../barcode_reader_feature/presentation/barcode_view_model/custom_show_snak_bar.dart';
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
        final List<dynamic> dataField = response.data;
        if (dataField.isNotEmpty) {
          final List<dynamic> stepsDataField = dataField[0]['steps'];
          List<RecipeDetailsModel> recipeSteps = stepsDataField
              .map((item) => RecipeDetailsModel.factoryRecipeDetailsModel(item))
              .toList();
          print(recipeSteps.isNotEmpty);
          return recipeSteps;
        } else {
          return [];
        }
      } else {
        throw Exception("Failed to fetch recipe: ${response.statusMessage}");
      }
    } on DioException catch (ex) {
      final badResponse = ex.response?.statusMessage;
      if (badResponse == "Not Found" && context.mounted) {
        ShowSnackBarHandlingBarcodeReader.customSnackBarAction(context);
      }
    } catch (e) {
      if (context.mounted) {
        ShowSnackBarHandlingBarcodeReader.snackBarForOtherErrorsTypes(context);
      }
    }

    throw Exception("Failed to fetch recipe");
  }
}
