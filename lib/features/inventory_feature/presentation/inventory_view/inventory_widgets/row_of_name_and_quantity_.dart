import 'package:flutter/material.dart';
import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';

class RowOfNameAndQuantity extends StatelessWidget {
  const RowOfNameAndQuantity(
      {super.key,
      required this.textLabel,
      required this.input,
      required this.numLines,
      required this.textLabelSize});
  final String textLabel;
  final String input;
  final int numLines;
  final double textLabelSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: textLabelSize,
          child: Text(
            "$textLabel",
            style: AppFonts.font16,
          ),
        ),
        SizedBox(width: 2),
        Expanded(
          child: Text(
            "$input",
            style: AppFonts.font14.copyWith(color: AppColors.kDarkGrey),
            overflow: TextOverflow.ellipsis,
            maxLines: numLines,
          ),
        ),
      ],
    );
  }
}
