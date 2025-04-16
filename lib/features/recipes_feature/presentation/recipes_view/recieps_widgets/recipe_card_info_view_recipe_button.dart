import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class RecipeCardInfoViewRecipeButton extends StatelessWidget {
  const RecipeCardInfoViewRecipeButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        GoRouter.of(context).push("/recipesDetails");
      },
      text: "View Recipe",
      textStyle: AppFonts.font14,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.kPrimary),
    );
  }
}
