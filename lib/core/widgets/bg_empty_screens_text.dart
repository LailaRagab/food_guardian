import 'package:flutter/material.dart';

import '../utils/assets/fonts.dart';

class BgEmptyScreensText extends StatelessWidget {
  const BgEmptyScreensText({super.key, required this.text, required this.top});

  final String text;
  final double top;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, right: 30, left: 30),
      child: Center(
        child: Text(
          text,
          style: AppFonts.fontGrey20,
        ),
      ),
    );
  }
}
