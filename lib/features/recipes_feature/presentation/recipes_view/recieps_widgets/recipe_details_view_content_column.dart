import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/for_passing_shared_data_for_recipes_feature.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipe_details_model.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../recipes_view_model/recipe_details_view_instructions_section_logic.dart';
import 'custom_clip_r_rect.dart';

class RecipeDetailsViewContentColumn extends StatelessWidget {
  const RecipeDetailsViewContentColumn({
    super.key,
    required this.stepsList,
  });

  final List<RecipeDetailsModel> stepsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomClipRRect(
          imageUrl: ForPassingSharedDataForRecipesFeature.obj.getImage,
        ),
        const SizedBox(height: 20),
        CustomText(
            text: ForPassingSharedDataForRecipesFeature.obj.getTitle ?? "",
            style: AppFonts.font26.copyWith(color: AppColors.kPrimary)),
        const SizedBox(height: 30),
        CustomText(text: "Instructions", style: AppFonts.font20Black),
        const SizedBox(height: 12),

        // Use the steps here
        RecipeDetailsViewInstructionsSectionLogic.buildStepsList(
          stepsList.map((e) => e.step).toList(),
        ),
      ],
    );
  }
}
