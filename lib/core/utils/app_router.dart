import 'package:food_guardian/features/splash_feature/presentation/splash_view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashView()),
      // GoRoute(path: "/register", builder: (context, state) => )
    ],
  );
}
