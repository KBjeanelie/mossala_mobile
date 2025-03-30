import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/datasources/auth_local_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/auth_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/offers/data/repositories/offer_repository_impl.dart';
import 'features/offers/domain/usecases/offer_usecase.dart';
import 'features/offers/presentation/bloc/offer_bloc.dart';
import 'features/profil/data/repositories/profil_repository_impl.dart';
import 'features/profil/domain/usecases/profil_usecase.dart';
import 'features/profil/presentation/bloc/profil_bloc.dart';
import 'features/worker/data/repositories/worker_repository_impl.dart';
import 'features/worker/domain/usecases/worker_usecase.dart';
import 'features/worker/presentation/bloc/worker_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final router = await createRouter();
  final Dio dio = Dio();
  final secureStorage = FlutterSecureStorage();
  final authLocalDataSource = AuthLocalDataSource(secureStorage: secureStorage);
  final authRepository = AuthRepositoryImpl(authLocalDataSource, dio: dio);
  final profilRepository = ProfileRepositoryImpl(dio);
  final offerRepository = OfferRepositoryImpl(dio);
  final workerRepository = WorkerRepositoryImpl(dio);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Mode portrait uniquement
  ]).then((_) {
    runApp(MyApp(
      router: router, 
      authRepository: authRepository,
      profilRepository: profilRepository,
      offerRepository: offerRepository,
      workerRepository : workerRepository,
    ));
  });
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  final AuthRepositoryImpl authRepository;
  final ProfileRepositoryImpl profilRepository;
  final OfferRepositoryImpl offerRepository;
  final WorkerRepositoryImpl workerRepository;
  const MyApp({
    super.key, 
    required this.router, 
    required this.authRepository, 
    required this.profilRepository, 
    required this.offerRepository,
    required this.workerRepository,
  });

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
            projetAssignedUsecase: ProjetAssignedUsecase(profilRepository),
            projetCreatedUsecase: ProjetCreatedUsecase(profilRepository),
            realisationUsecase: RealisationUsecase(profilRepository),
            sendFeebBackUsecase: SendFeebBackUsecase(profilRepository), 
            sendWarningUsecase: SendWarningUsecase(profilRepository), 
            addUserRealisationUsecase: AddUserRealisationUsecase(profilRepository),
            updateUserProfileUsecase: UpdateUserProfileUsecase(profilRepository)
          )
        ),
        BlocProvider(
          create: (context) => OfferBloc(
            getOfferUsecase: GetOfferUsecase(offerRepository), 
            getOfferByIdUsecase: GetOfferByIdUsecase(offerRepository), 
            createOfferUsecase: CreateOfferUsecase(offerRepository), 
            deleteOfferUsecase: DeleteOfferUsecase(offerRepository), 
            assignedOfferToWorker: AssignedOfferToWorker(offerRepository),
            getOpenOffer: GetOpenOffer(offerRepository), 
            closedOfferUsecase: ClosedOfferUsecase(offerRepository),
            getAppliesOffersUsecase: GetAppliesOffersUsecase(offerRepository),
            getApplyOfferByIdUsercase: GetApplyOfferByIdUsercase(offerRepository),
            cancelApplyOfferUsecase: CancelApplyOfferUsecase(offerRepository),
            applyOfferUsecase: ApplyOfferUsecase(offerRepository), 
            getProjectWithApplicationUsecase: GetProjectWithApplicationUsecase(offerRepository)
          )
        ),
        BlocProvider(
          create: (context) => WorkerBloc(
            getWorkersUsecase: GetWorkersUsecase(workerRepository), 
            getSingleWorkerUsecase: GetSingleWorkerUsecase(workerRepository), 
            experienceOfWorkerUsecase: ExperienceOfWorkerUsecase(workerRepository), 
            projectAssignedToWorkerUsecase: ProjectAssignedToWorkerUsecase(workerRepository), 
            projectCreatedByWorkerUsecase: ProjectCreatedByWorkerUsecase(workerRepository),
          )
        ),
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
