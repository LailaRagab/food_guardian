import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/fonts.dart';

class CustomAddManuallyBottomSheetDetails extends StatelessWidget {
  const CustomAddManuallyBottomSheetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add new item",
              style: AppFonts.fontBlack18,
            )
          ],
        ),
        TextField(),
      ],
    );
  }
}
