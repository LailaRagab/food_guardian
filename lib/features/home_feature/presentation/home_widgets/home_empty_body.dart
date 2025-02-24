import 'package:flutter/material.dart';

import '../../../../core/utils/assets/images.dart';

class HomeEmptyBody extends StatelessWidget {
  const HomeEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppImages.bgHome),
        fit: BoxFit.fill,
      )),
    );
  }
}
