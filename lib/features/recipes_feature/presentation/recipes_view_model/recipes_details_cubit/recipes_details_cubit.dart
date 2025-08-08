import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/recipes_details_cubit/recipes_details_states.dart';

import '../../../../../core/utils/constants/constants.dart';
import '../../../recipes_models/recipe_details_model.dart';
import '../recipes_cubit/recipes_cubit.dart';

class RecipesDetailsCubit extends Cubit<RecipesDetailsStates> {
  RecipesDetailsCubit() : super(InitialLoadingDetailsState());

  static var dio = Constants.dio;
  static String apiKey = RecipesCubit.apiKey;
  static String base = RecipesCubit.basePath;

  Future<List<RecipeDetailsModel>> getRecipeDetails(
      String id, BuildContext context) async {
    emit(InitialLoadingDetailsState());
    try {
      Response response = await dio.get(
        "$base/$id/analyzedInstructions?apiKey=$apiKey",
      );

      if (response.statusCode == 200) {
        emit(RecipeDetailsSuccessful());
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
        emit(RecipeDetailsFailure(
            errorMessage: "Sorry, there is no instructions of this recipe"));
        return []; // Don't throw again
      } else if (context.mounted) {
        emit(RecipeDetailsFailure(
            errorMessage: "There is a network error, please try again"));
        return [];
      }
    } catch (e) {
      if (context.mounted) {
        emit(RecipeDetailsFailure(
            errorMessage: "There is an error, please try again"));
        return [];
      }
    }
    // We should never reach here, but just in case
    return [];
  }
}
