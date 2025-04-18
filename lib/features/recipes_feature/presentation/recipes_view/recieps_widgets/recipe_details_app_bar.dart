import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class RecipeDetailsAppBar extends StatelessWidget implements PreferredSize {
  const RecipeDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      firstText: "Recipe",
      secondText: "Details",
      leading: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
