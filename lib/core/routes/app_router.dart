import 'package:go_router/go_router.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/forgetpassword_screen.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/register_screen.dart';
import 'package:mossala_mobile/features/offers/presentation/pages/create_service_screen.dart';
import 'package:mossala_mobile/features/offers/presentation/pages/detail/more_offer_screen.dart';
import 'package:mossala_mobile/features/offers/presentation/pages/single_offer_screen.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/menu/about_app_screen.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/menu/feedback_screen.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/menu/notifications_screen.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/menu/warning_screen.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/projet_remport%C3%A9.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/realisation_screen.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/user_profil_screen.dart';
import 'package:mossala_mobile/features/worker/presentation/pages/profil_worker_screen.dart';
import 'package:mossala_mobile/screen/main/home_screen.dart';
import 'package:mossala_mobile/screen/onboarding_screen.dart';
import 'package:mossala_mobile/services/auth_guard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/profil/presentation/pages/projet_creer_screen.dart';

Future<bool> isFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('onboarding_done') ?? false;
}

Future<GoRouter> createRouter() async {
  final firstLaunch = await isFirstLaunch();
  return GoRouter(
    initialLocation: firstLaunch ? '/' : '/onboarding',
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
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: '/forgetpassword',
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
        redirect: (context, state) => AuthGuard.redirect(context, state),
        routes: [
          ///########################## APP ROUTE ######################
          ///
          GoRoute(
            path: '/create_project',
            builder: (context, state) {
              return CreateProjectScreen();
            },
          ),
          GoRoute(
            path: '/project/:id',
            builder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
              return SingleOfferScreen(projectId: id);
            },
          ),
          GoRoute(
            path: '/project/:id/mores',
            builder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
              return MoreOfferScreen(projectId: id);
            },
          ),
          GoRoute(
            path: '/worker/:id',
            builder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
              return ProfilWorkerScreen(workerId: id);
            },
          ),
          ///END HOME SCREEN ROUTE
          ///
          ///########################## MENU ROUTE ######################
          GoRoute(
            path: '/profil',
            builder: (context, state) => UserProfilScreen(),
          ),
          GoRoute(
            path: '/realisations',
            builder: (context, state) => RealisationScreen(),
          ),
          GoRoute(
            path: '/project_create',
            builder: (context, state) => ProjetCreerScreen(),
          ),
          GoRoute(
            path: '/project_assigned',
            builder: (context, state) => ProjetRemporteScreen(),
          ),
          GoRoute(
            path: '/notifications',
            builder: (context, state) => NotificationsScreen(),
          ),
          GoRoute(
            path: '/warning',
            builder: (context, state) => WarningScreen(),
          ),
          GoRoute(
            path: '/feedback',
            builder: (context, state) => FeedbackScreen(),
          ),
          GoRoute(
            path: '/about',
            builder: (context, state) => AboutAppScreen(),
          ),
          ///END MENU SCREEN ROUTE
        ]
      ),


    ],
  );
}
