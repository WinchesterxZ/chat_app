import 'package:chat_app/core/strings.dart';
import 'package:chat_app/presentation/login/login_screen.dart';
import 'package:chat_app/presentation/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(routes: [
  GoRoute(path: AppStrings.splashScreenRoute,
  builder: (context,state) => const SplashScreen(),),
  GoRoute(path: AppStrings.loginScreenRoute,
  builder: (context,state) => const LoginScreen(),),
]);
