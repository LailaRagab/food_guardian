import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/core/widgets/custom_text.dart';
import 'package:food_guardian/core/widgets/custom_elevated_button.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

import '../../recipes_models/recipes_api_service_logic.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  List<RecipesModel> recipes = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    final fetchedRecipes =
        await RecipesApiServiceLogic.fetchRecipesFromApi(context);
    print(fetchedRecipes);
    setState(() {
      recipes = fetchedRecipes as List<RecipesModel>;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final recipe = recipes[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: AppColors.kItemCardBg,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(35)),
                            child: Image.network(
                              recipe.image,
                              width: double.infinity,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: recipe.name,
                                    style: AppFonts.fontBlack18),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(Icons.percent,
                                        size: 18, color: AppColors.kPrimary),
                                    const SizedBox(width: 4),
                                    CustomText(
                                        text: "Match: %",
                                        style: AppFonts.font14
                                            .copyWith(color: AppColors.kGrey))
                                  ],
                                ),
                                const SizedBox(height: 10),
                                if (recipe.missIngredients != null &&
                                    (recipe.missIngredients as List).isNotEmpty)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Missing Ingredients:",
                                        style: AppFonts.font14.copyWith(
                                            color: AppColors.kPrimary),
                                      ),
                                      const SizedBox(height: 4),
                                      Wrap(
                                        spacing: 6,
                                        children: (recipe.missIngredients
                                                as List<String>)
                                            .map((item) => Chip(
                                                  label: Text(item),
                                                  backgroundColor:
                                                      Colors.grey[200],
                                                  labelStyle: AppFonts.font12,
                                                ))
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                CustomElevatedButton(
                                  onPressed: () {},
                                  text: "View Recipe",
                                  textStyle: AppFonts.font14,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.kPrimary),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  childCount: recipes.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
