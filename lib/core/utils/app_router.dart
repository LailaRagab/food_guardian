import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_view.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view/sign_in_view.dart';
import 'package:food_guardian/features/home_feature/presentation/home_view/home_view.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recipes_details_view.dart';
import 'package:food_guardian/features/splash_feature/presentation/splash_view/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/barcode_reader_feature/presentation/barcode_reader_view/barcode_reader_view.dart';
import '../../features/recipes_feature/recipes_models/recipe_details_model.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashView()),
      GoRoute(
        path: "/register",
        builder: (context, state) => RegisterView(),
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => SignInView(),
      ),
      GoRoute(path: "/home", builder: (context, state) => HomeView()),
      GoRoute(path: "/scan", builder: (context, state) => ScanView()),
      GoRoute(
        path: '/recipesDetails',
        builder: (context, state) {
          final stepsList = state.extra;
          // if (stepsList == null || stepsList is! List<RecipeDetailsModel>) {
          //   return const Scaffold(
          //     body: Center(child: Text("Error loading recipe steps.")),
          //   );
          // }

          return RecipesDetailsView(
              stepsList: stepsList as List<RecipeDetailsModel>);
        },
      )
    ],
  );
}
