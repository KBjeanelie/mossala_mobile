// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:mossala_mobile/features/auth/data/models/user_model.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/edit_account_screen.dart';
import 'package:mossala_mobile/widgets/cards.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../../core/theme/app_colors.dart';
import '../bloc/profil_bloc.dart';
import '../bloc/profil_event.dart';
import '../bloc/profil_state.dart';

class UserProfilScreen extends StatefulWidget {
  const UserProfilScreen({super.key});

  @override
  State<UserProfilScreen> createState() => _UserProfilScreenState();
}

class _UserProfilScreenState extends State<UserProfilScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final AuthLocalDataSource authLocalDataSource = AuthLocalDataSource(secureStorage: FlutterSecureStorage());
  User? currentUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    Future.microtask(() {
      context.read<ProfilBloc>().add(ProfilEventAssignedProject());
      context.read<ProfilBloc>().add(ProfilEventCreatedProject());
      context.read<ProfilBloc>().add(ProfilEventRealisation());
      _loadUser();
    });
  }
  Future<void> _loadUser() async {
    try {
      final user = await authLocalDataSource.getUser();
      //log("user : $user");
      setState(() {
        currentUser = UserModel.fromJson(user!);
        isLoading = false;
      });
    } catch (e) {
      log("ERROR : $e");
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: normalTextApp("Erreur lors du chargement des informations.", context), backgroundColor: AppColors.closed,),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: mediumTextApp("${currentUser?.lastname} ${currentUser?.firstname}", context),
      ),
      body: Column(
        children: [
          _buildProfileCard(context),
          Card(
            margin: EdgeInsets.only(top: 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
            child: TabBar(
              controller: _tabController,
              dividerHeight: 0.0,
              indicatorColor: AppColors.secondary,
              labelStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.secondary,
                fontWeight: FontWeight.w600
              ),
              tabs: [
                Tab(text: "À propos"),
                Tab(text: "Projets réalisés"),
                Tab(text: "Projets créés"),
                //Tab(text: "Réalisations"),
              ],
            ),
          ),
          Expanded( // Important pour que le TabBarView prenne tout l'espace restant
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAboutCard(context),
                _buildProjectsDoneTab(context),
                _buildProjectsCreateTab(context),
                //_buildRealisationTab(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccountScreen()));
        },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: AppColors.secondary,
          mini: true,
          child: Icon(EvaIcons.edit, color: AppColors.darkText),
      ),
    );
  }
  Widget _buildAboutCard(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: AppSizes.spaceHV,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  mediumTextApp("${currentUser?.lastname} ${currentUser?.firstname}", context),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.at, color: AppColors.secondary),
                      if(currentUser?.username == null || currentUser?.username == "")...[
                        normalTextApp("Nom utilisateur non renseignée", context)
                      ]else...[
                        normalTextApp(currentUser!.username ?? "", context)
                      ]
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.globe, color: AppColors.secondary),
                      if(currentUser?.nickname == null || currentUser?.nickname == "")...[
                        normalTextApp("Surnon non renseignée", context)
                      ]else...[
                        normalTextApp(currentUser!.nickname ?? "", context)
                      ]
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.personAdd, color: AppColors.secondary),
                      if(currentUser?.gender == null || currentUser?.gender == "")...[
                        normalTextApp("Genre non renseignée", context)
                      ]else...[
                        normalTextApp(currentUser!.gender ?? "", context)
                      ]
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.pin, color: AppColors.secondary),
                      if(currentUser?.address == null || currentUser?.address == "")...[
                        normalTextApp("Adresse non renseignée", context)
                      ]else...[
                        normalTextApp(currentUser!.address ?? "", context)
                      ]
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.email, color: AppColors.secondary),
                      if(currentUser?.email == null || currentUser?.email == "")...[
                        normalTextApp("Email non renseignée", context)
                      ]else...[
                        normalTextApp(currentUser!.email ?? "", context)
                      ]
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.phone, color: AppColors.secondary),
                      normalTextApp(currentUser?.tel ?? "", context)
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.calendar, color: AppColors.secondary),
                      if(currentUser?.dateOfBirth == null || currentUser?.dateOfBirth == "")...[
                        normalTextApp("Date de naissance non renseignée", context)
                      ]else...[
                        normalTextApp(currentUser!.dateOfBirth ?? "", context)
                      ]
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.facebook, color: AppColors.secondary),
                      if(currentUser?.facebook == null || currentUser?.facebook == "")...[
                        normalTextApp("Compte facebook non renseignée", context)
                      ]else...[
                        normalTextApp(currentUser!.facebook ?? "", context)
                      ]
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.alertCircle, color: AppColors.secondary),
                      if(currentUser?.nationality == null || currentUser?.nationality == "")...[
                        normalTextApp("Nationnalité non renseignée", context)
                      ]else...[
                        normalTextApp(currentUser!.nationality ?? "", context)
                      ]
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.briefcase, color: AppColors.secondary),
                      if(currentUser?.nationality == null || currentUser?.nationality == "")...[
                        normalTextApp("Metier non renseignée", context)
                      ]else...[
                        normalTextApp(currentUser!.nationality ?? "", context)
                      ]
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    children: [
                      mediumTextApp("Compétence : ", context),
                      BadgeApp(i: 1), BadgeApp(i: 1), BadgeApp(i: 1), BadgeApp(i: 1), BadgeApp(i: 1)
                    ],
                  ),
                  SizedBox(height: 10,),
                  mediumTextApp("Bio: ", context),
                  if(currentUser?.nationality == null || currentUser?.nationality == "")...[
                    normalTextApp("Salut, je suis un prestataire sur Mosala et je suis disponible à l'instant si tu as besoin de mes services. \nMerci!", context),
                  ]else...[
                    normalTextApp(currentUser!.nationality ?? "", context)
                  ]
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
      child: Padding(
        padding: AppSizes.spaceHV,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/user.jpg"),
              radius: 36,
            ),
            SizedBox(height: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mediumTextApp("10", context),
                normalTextApp("Projets réalisés", context),
              ],
            ),
            Column(
              children: [
                mediumTextApp("5", context),
                normalTextApp("Projets créés", context),
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _buildProjectsDoneTab(BuildContext context) {
    return BlocConsumer<ProfilBloc, ProfilState>(
      listener: (context, state) {
        if (state is ProfilLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // Fermer le dialogue quand le chargement est terminé
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (state is ProfilError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: normalTextApp(state.message, context)),
          );
        }
      },
      builder: (context, state) {
        if (state is ProfilLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is ProfilAssignedProjectLoaded) {
          // Afficher les réalisations récupérées
          return ListView(
            children: [
              // Vérifier si la liste est vide
              if (state.assignedProjects.isEmpty) 
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: normalTextApp("Aucun projet remporté trouvé", context),
                  ),
                )
              else 
                ...state.assignedProjects.map((offer) => CardOfferView(offer: offer,)),

              SizedBox(height: 15),
            ],
          );

        }

        return Center(child: normalTextApp("Aucun projet remporté trouvée", context));
      },
    );
  }
  Widget _buildProjectsCreateTab(BuildContext context) {
    return BlocConsumer<ProfilBloc, ProfilState>(
      listener: (context, state) {
        if (state is ProfilLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // Fermer le dialogue quand le chargement est terminé
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (state is ProfilError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is ProfilLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is ProfilCreatedProjectLoaded) {
          // Afficher les réalisations récupérées
          return ListView(
            children: [
              // Vérifier si la liste est vide
              if (state.createdProjects.isEmpty) 
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: normalTextApp("Aucun projet créé trouvé", context),
                  ),
                )
              else 
                ...state.createdProjects.map((offer) => CardOfferView(offer: offer,)),

              SizedBox(height: 15),
            ],
          );

        }

        return Center(child: normalTextApp("Aucun projet créé trouvée", context));
      },
    );
  }

  // Widget _buildRealisationTab(BuildContext context) {
  //   return BlocConsumer<ProfilBloc, ProfilState>(
  //     listener: (context, state) {
  //       if (state is ProfilLoading) {
  //         showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (_) => Center(
  //             child: CircularProgressIndicator(),
  //           ),
  //         );
  //       } else {
  //         // Fermer le dialogue quand le chargement est terminé
  //         Navigator.of(context, rootNavigator: true).pop();
  //       }

  //       if (state is ProfilError) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: normalTextApp(state.message, context)),
  //         );
  //       }
  //     },
      
  //     builder: (context, state) {
  //       if (state is ProfilLoading) {
  //         return Center(child: CircularProgressIndicator());
  //       }

  //       if (state is ProfilRealisationLoaded) {
  //         // Afficher les réalisations récupérées
  //         return ListView(
  //           children: [
  //             // Vérifier si la liste est vide
  //             if (state.realisations.isEmpty) 
  //               Padding(
  //                 padding: const EdgeInsets.all(16.0),
  //                 child: Center(
  //                   child: normalTextApp("Aucune réalisation trouvée", context),
  //                 ),
  //               )
  //             else 
  //               ...state.realisations.map((realisation) => CardRealisation()),

  //             SizedBox(height: 15),
  //           ],
  //         );

  //       }

  //       return Center(child: normalTextApp("Aucune réalisation trouvée", context));
  //     },
  //   );
  // }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}