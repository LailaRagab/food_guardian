import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/recipes_cubit/recipes_states.dart';

import '../../../../../core/utils/constants/constants.dart';
import '../../../recipes_models/recipes_model.dart';

class RecipesCubit extends Cubit<RecipesStates> {
  RecipesCubit() : super(InitialLoadingState());
  static var dio = Constants.dio;
  static String basePath = "https://api.spoonacular.com/recipes";
  static String apiKey = "61d9443f7f2a4e75a9852d346df1c217";

  Future<List<RecipesModel>> fetchRecipesFromApi(
      BuildContext context, var listModels) async {
    emit(InitialLoadingState());
    try {
      final model = listModels.map((model) => model);
      String ingredient = model.map((item) => item.annotation).join(",");

      Response request = await dio.get(
          "$basePath/findByIngredients?apiKey=$apiKey&ingredients=$ingredient&number=100&ignorePantry=false");

      if (request.statusCode == 200) {
        emit(RecipesSuccess());
        List<dynamic> recipesDataField = request.data;
        List<RecipesModel> recipesList =
            recipesDataField.map((item) => RecipesModel.model(item)).toList();
        return recipesList;
      }
    } on DioException catch (ex) {
      final badResponse = ex.response?.statusMessage;
      if (badResponse == "Not Found" && context.mounted) {
        emit(RecipesFailure(
            errorMessage: "Sorry, there is no recipes for this item"));
      } else {
        emit(RecipesFailure(errorMessage: "Network error: $badResponse"));
      }
    } catch (e) {
      if (context.mounted) {
        emit(RecipesFailure(
            errorMessage: "There is an error, please try again+$e"));
      }
    }
    throw Exception("Failed to fetch recipe");
  }
}
