import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/fonts.dart';

class CustomUploadPhotoAptionsText extends StatelessWidget {
  const CustomUploadPhotoAptionsText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: AppFonts.fontBlack18,
      ),
    );
  }
}
