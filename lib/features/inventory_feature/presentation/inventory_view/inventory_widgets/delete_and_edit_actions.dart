import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/delete_and_edit_details.dart';

import '../../../../../core/utils/assets/colors.dart';

class DeleteAndEditActions extends StatelessWidget {
  const DeleteAndEditActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 379,
      height: 123,
      decoration: BoxDecoration(
        color: AppColors.kRed,
        borderRadius: BorderRadius.all(Radius.circular(35)),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: DeleteAndEditDetails()),
    );
  }
}
