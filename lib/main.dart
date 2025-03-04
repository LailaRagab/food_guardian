import 'package:firebase_core/firebase_core.dart'; //import for using firebase
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/utils/app_router.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view_model/register_cubit/register_cubit.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/inventory_category_cubit.dart';

import 'firebase_options.dart'; //import for this DefaultFirebaseOptions

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FoodGuardian());
}

class FoodGuardian extends StatelessWidget {
  const FoodGuardian({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => InventoryCategoryCubit())
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
