import 'package:flutter/material.dart';

import 'built_icon_info.dart';

class RecipeDetailsViewTime extends StatelessWidget {
  const RecipeDetailsViewTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuiltIconInfo.buildInfoIcon(Icons.schedule, "25 min"),
        const SizedBox(width: 20),
        // BuiltIconInfo.buildInfoIcon(Icons.restaurant, "2 servings"),
      ],
    );
  }
}
