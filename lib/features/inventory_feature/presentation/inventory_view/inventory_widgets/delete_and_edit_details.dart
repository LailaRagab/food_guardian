import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/alert_dialog_text_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_add_manually_bottom_sheet.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/inventory_category_cubit.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';

class DeleteAndEditDetails extends StatelessWidget {
  DeleteAndEditDetails({super.key, required this.subCategory});

  final String subCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Confirm Delete"),
                        content: Text(
                          "Are you sure you want to delete this item?",
                        ),
                        actions: [
                          AlertDialogTextButton(
                            text: "Cancel",
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          AlertDialogTextButton(
                            text: "Confirm",
                            onTap: () {
                              Navigator.of(context).pop();
                              BlocProvider.of<InventoryCategoryCubit>(context)
                                  .deleteItem(subCategory);
                            },
                          )
                        ],
                      );
                    });
              },
              child: Icon(
                Icons.delete,
                color: AppColors.kWhite,
                size: 30,
              ),
            ),
            Text(
              "Delete",
              style: AppFonts.font14,
            )
          ],
        ),
        SizedBox(
          width: 10,
        ),
        VerticalDivider(
          thickness: 1,
          color: AppColors.kWhite,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                BlocProvider.of<InventoryCategoryCubit>(context)
                    .editItem(subCategory, context);
              },
              child: Icon(
                size: 30,
                Icons.edit,
                color: AppColors.kWhite,
              ),
            ),
            Text(
              "Edit",
              style: AppFonts.font14,
            )
          ],
        )
      ],
    );
  }
}
