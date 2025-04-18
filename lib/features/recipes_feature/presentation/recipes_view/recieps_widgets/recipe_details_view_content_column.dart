import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_details_view_time.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipe_details_model.dart';

import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../recipes_view_model/recipe_details_view_ingredients_section_logic.dart';
import '../../recipes_view_model/recipe_details_view_instructions_section_logic.dart';
import 'built_icon_info.dart';
import 'custom_clip_r_rect.dart';

class RecipeDetailsViewContentColumn extends StatelessWidget {
  RecipeDetailsViewContentColumn({
    super.key,
  });
  RecipeDetailsModel? details;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomClipRRect(),
        const SizedBox(height: 20),
        CustomText(text: "Spaghetti Carbonara", style: AppFonts.font26),
        // const SizedBox(height: 10),
        // RecipeDetailsViewTime(),
        // const SizedBox(height: 30),
        // CustomText(text: "Ingredients", style: AppFonts.font20Black),
        // const SizedBox(height: 12),
        // RecipeDetailsViewIngredientsSectionLogic.buildIngredientsList([
        //   "200g spaghetti",
        //   "2 large eggs",
        //   "100g pancetta",
        //   "50g grated cheese",
        //   "Salt & pepper to taste",
        // ]),
        const SizedBox(height: 30),
        CustomText(text: "Instructions", style: AppFonts.font20Black),
        const SizedBox(height: 12),
        if (details != null)
          RecipeDetailsViewInstructionsSectionLogic.buildStepsList(
              [details!.step])
        else
          const Text("No instructions available"),
      ],
    );
  }
}
