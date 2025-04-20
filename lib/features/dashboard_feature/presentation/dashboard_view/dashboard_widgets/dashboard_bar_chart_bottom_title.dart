import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_text.dart';

class DashboardBarChartBottomTitle extends StatelessWidget {
  const DashboardBarChartBottomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 60),
        CustomText(text: "Fresh", style: AppFonts.font13),
        const SizedBox(width: 60),
        CustomText(text: "Used", style: AppFonts.font13),
        const SizedBox(width: 50),
        CustomText(text: "Expired", style: AppFonts.font13),
        const SizedBox(width: 30),
        CustomText(text: "Expire Soon", style: AppFonts.font13),
        const SizedBox(width: 30),
      ],
    );
    ;
  }
}
