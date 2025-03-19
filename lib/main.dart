import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:mossala_mobile/features/auth/domain/usecases/logout_usecase.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/datasources/auth_local_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/profil/data/repositories/profil_repository_impl.dart';
import 'features/profil/domain/usecases/experience_usecase.dart';
import 'features/profil/presentation/bloc/profil_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final router = await createRouter();
  final Dio dio = Dio();
  final secureStorage = FlutterSecureStorage();
  final authLocalDataSource = AuthLocalDataSource(secureStorage: secureStorage);
  final authRepository = AuthRepositoryImpl(authLocalDataSource, dio: dio);
  final profilRepository = ProfileRepositoryImpl(dio);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Mode portrait uniquement
  ]).then((_) {
    runApp(MyApp(
      router: router, 
      authRepository: authRepository,
      profilRepository: profilRepository));
  });
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  final AuthRepositoryImpl authRepository;
  final ProfileRepositoryImpl profilRepository;
  const MyApp({super.key, required this.router, required this.authRepository, required this.profilRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            loginUseCase: LoginUseCase(authRepository),
            registerUseCase: RegisterUseCase(authRepository),
            logoutUseCase: LogoutUsecase(authRepository),
          ),

        ),
        BlocProvider(
          create: (context) => ProfilBloc(
            experienceUsecase: ExperienceUsecase(profilRepository),
          ),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Mosala',
        scrollBehavior: ScrollBehavior(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}
