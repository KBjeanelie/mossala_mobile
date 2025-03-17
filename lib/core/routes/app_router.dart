import 'package:go_router/go_router.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/forgetpassword_screen.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/register1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../screen/onboarding_screen.dart';

Future<bool> isFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('onboarding_done') ?? false;
}

Future<GoRouter> createRouter() async {
  final firstLaunch = await isFirstLaunch();
  return GoRouter(
    initialLocation: firstLaunch ? '/login' : '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => Register1(),
      ),
      GoRoute(
        path: '/forgetpassword',
        builder: (context, state) => ForgetPasswordScreen(),
      ),

    ],
  );
}
