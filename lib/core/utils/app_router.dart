
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_view.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view/sign_in_view.dart';
import 'package:food_guardian/features/home_feature/presentation/home_view/home_view.dart';
import 'package:food_guardian/features/splash_feature/presentation/splash_view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashView()),
      GoRoute(path: "/register", builder: (context, state) => RegisterView(),),
  GoRoute(path: "/login", builder: (context, state) => SignInView(),),
  GoRoute(path: "/home", builder: (context, state) => HomeView(),)

    ],
  );
}
