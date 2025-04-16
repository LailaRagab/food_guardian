import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/core/widgets/custom_app_bar.dart';
import 'package:food_guardian/core/widgets/custom_text.dart';

class RecipesDetailsView extends StatelessWidget {
  const RecipesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kRecipesDetailsBg,
      appBar: CustomAppBar(firstText: "Recipe", secondText: "Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image Card
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/sample_recipe.jpg', // temporary placeholder
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            /// Title
            const Text(
              "Spaghetti Carbonara",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            /// Time & Servings
            Row(
              children: [
                _buildInfoIcon(Icons.schedule, "25 min"),
                const SizedBox(width: 20),
                _buildInfoIcon(Icons.restaurant, "2 servings"),
              ],
            ),
            const SizedBox(height: 30),

            /// Section: Ingredients
            const Text("Ingredients",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            _buildBulletList([
              "200g spaghetti",
              "2 large eggs",
              "100g pancetta",
              "50g grated cheese",
              "Salt & pepper to taste",
            ]),
            const SizedBox(height: 30),

            /// Section: Instructions
            const Text("Instructions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            _buildStepsList([
              "Boil the spaghetti in salted water.",
              "Fry the pancetta until crispy.",
              "Beat the eggs and mix with cheese.",
              "Combine everything and mix quickly.",
              "Serve immediately while hot.",
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              const Text("• ", style: TextStyle(fontSize: 18)),
              Expanded(child: Text(item, style: const TextStyle(fontSize: 16))),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStepsList(List<String> steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: steps.asMap().entries.map((entry) {
        final index = entry.key + 1;
        final step = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.green[100],
                child: Text(
                  "$index",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  step,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
