import 'package:food_guardian/features/authentication_feature/log_in_feature/presentation/log_in_view/log_in_view.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_view.dart';
import 'package:food_guardian/features/splash_feature/presentation/splash_view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashView()),
      GoRoute(path: "/register", builder: (context, state) => RegisterView(),),
  GoRoute(path: "/login", builder: (context, state) => LogInView(),)
    ],
  );
}
