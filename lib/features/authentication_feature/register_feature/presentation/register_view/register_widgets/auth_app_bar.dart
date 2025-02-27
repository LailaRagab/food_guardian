import 'package:flutter/material.dart';
import '../../../../../../core/utils/assets/colors.dart';
import '../../../../../../core/utils/assets/fonts.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key, required this.titleAppBar, required this.onTap});

  final String titleAppBar;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: onTap,
                child: Container(
                  width: 107,
                  height: 31,
                  decoration: BoxDecoration(
                      color: AppColors.kSecondary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      titleAppBar,
                      style: AppFonts.fontWhite20.copyWith(
                          color: AppColors.kHintText,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
