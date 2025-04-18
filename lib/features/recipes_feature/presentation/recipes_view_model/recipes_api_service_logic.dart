import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/for_passing_expire_ingredient.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

import '../../../../core/utils/constants/constants.dart';
import '../../../barcode_reader_feature/presentation/barcode_view_model/custom_show_snak_bar.dart';

class RecipesApiServiceLogic {
  static var dio = Constants.dio;
  static String basePath = "https://api.spoonacular.com/recipes";
  static String apiKey = "61d9443f7f2a4e75a9852d346df1c217";
  static Future<List<RecipesModel>> fetchRecipesFromApi(
      BuildContext context) async {
    final fetchIngredient = ForPassingExpireIngredient.instance.getIngredients;
    try {
      Response request = await dio.get(
          "$basePath/findByIngredients?apiKey=$apiKey&ingredients=$fetchIngredient&number=100");

      if (request.statusCode == 200) {
        List<dynamic> recipesDataField = request.data;

        List<RecipesModel> recipesList =
            recipesDataField.map((item) => RecipesModel.model(item)).toList();

        return recipesList;
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
