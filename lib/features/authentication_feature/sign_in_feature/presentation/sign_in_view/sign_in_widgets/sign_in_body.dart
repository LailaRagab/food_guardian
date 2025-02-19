import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/common_button.dart';
import '../../../../register_feature/presentation/register_view/register_widgets/auth_custom_text_field.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 200),
      child: ListView(
        children: [
          AuthCustomTextField(
              hintText: "E-mail", preIcon: Icon(Icons.email_outlined)),
          SizedBox(
            height: 30,
          ),
          AuthCustomTextField(
              hintText: "Password",
              forSecure: true,
              preIcon: Icon(Icons.lock_rounded),),
          SizedBox(
            height: 90,
          ),
          CommonButton(onTap: () {
            GoRouter.of(context).push("/home");
          },)
        ],
      ),
    );
  }
}
