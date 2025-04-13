import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/text_field_edit_dialog.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/edit_logic.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../models/card_itme_model.dart';
import '../../../models/inventory_category_cubit.dart';
import 'alert_dialog_text_button.dart';
import 'custom_show_my_date_picker_widget.dart';

class EditAction extends StatelessWidget {
  EditAction(
      {super.key,
      required this.item,
      required this.subCategory,
      required this.docID});

  final CardItemModel item;
  final String subCategory;
  final String docID;

  EditLogic? editLogic;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            editLogic = EditLogic(
              item: item,
            );
            editLogic!.editShowDialog(context, subCategory, docID);
          },
          child: Icon(
            Icons.edit,
            color: AppColors.kWhite,
            size: 30,
          ),
        ),
        Text(
          "Edit",
          style: AppFonts.font14,
        )
      ],
    );
  }
}
