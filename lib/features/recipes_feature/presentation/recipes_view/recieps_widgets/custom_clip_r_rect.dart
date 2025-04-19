import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/images.dart';

class CustomClipRRect extends StatelessWidget {
  const CustomClipRRect({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
      child: imageUrl != null
          ? Image.network(
              imageUrl!,
              errorBuilder: (BuildContext context, error, stackTrace) {
                return Image.asset(AppImages.recipeImageNotFound);
              },
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            )
          : Image.asset(
              AppImages.recipeImageNotFound,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
    );
  }
}
