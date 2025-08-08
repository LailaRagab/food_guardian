import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_details_view_scaffold.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/recipes_details_cubit/recipes_details_cubit.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/recipes_details_cubit/recipes_details_states.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipe_details_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RecipesDetailsView extends StatelessWidget {
  RecipesDetailsView({
    super.key,
    required this.stepsList,
  });
  final List<RecipeDetailsModel> stepsList;
  bool isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<RecipesDetailsCubit, RecipesDetailsStates>(
      builder: (BuildContext context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoaded,
          child: RecipeDetailsViewScaffold(
            stepsList: stepsList,
          ),
        );
      },
      listener: (BuildContext context, state) {
        if (state is InitialLoadingDetailsState) {
          isLoaded = true;
        }
        if (state is RecipeDetailsSuccessful) {
          isLoaded = true;
        }
        if (state is RecipeDetailsFailure) {
          snackBar(context, state.errorMessage, null);
          isLoaded = false;
        }
      },
    ));
  }
}
