import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/widgets/custom_text.dart';
import 'package:food_guardian/features/inventory_feature/inventory_models/card_itme_model.dart';
import 'package:food_guardian/features/inventory_feature/inventory_models/inventory_category_cubit.dart';

import '../../../../core/utils/assets/fonts.dart';

class CheckBoxItemIsUsed extends StatefulWidget {
  const CheckBoxItemIsUsed({
    super.key,
    required this.item,
    required this.subCategory,
  });

  final CardItemModel item;
  final String subCategory;

  @override
  State<CheckBoxItemIsUsed> createState() => _CheckBoxItemIsUsedState();
}

class _CheckBoxItemIsUsedState extends State<CheckBoxItemIsUsed> {
  late bool isUsed;

  @override
  void initState() {
    super.initState();
    isUsed = widget.item.itemIsUsed;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          visualDensity: VisualDensity.compact,
          value: isUsed,
          onChanged: (val) {
            if (val == null || val == isUsed) return; // avoid redundant update

            setState(() {
              isUsed = val;
            });

            BlocProvider.of<InventoryCategoryCubit>(context)
                .updateItemUsedStatus(
              widget.subCategory,
              widget.item.docIDForDeleteAndEdit,
              isUsed,
            );
          },
          activeColor: AppColors.kPrimary,
          side: BorderSide(color: AppColors.kWhite),
        ),
        CustomText(text: "Used", style: AppFonts.font14),
      ],
    );
  }
}
