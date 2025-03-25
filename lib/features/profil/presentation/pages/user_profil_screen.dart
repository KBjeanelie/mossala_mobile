// ignore_for_file: use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/edit_account_screen.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/realisation_screen.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    Future.microtask(() {
      context.read<ProfilBloc>().add(ProfilEventAssignedProject());
      context.read<ProfilBloc>().add(ProfilEventCreatedProject());
      context.read<ProfilBloc>().add(ProfilEventExperience());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: mediumTextApp("KUBEMBULA Jean-Élie", context),
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
                Tab(text: "Réalisations"),
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
                _buildRealisationTab(context),
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
                spacing: 8,
                children: [
                  mediumTextApp("KUBEMBULA Jean-Élie", context),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.pin, color: AppColors.secondary),
                      normalTextApp("50 rue nkouma, Moungali", context)
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.email, color: AppColors.secondary),
                      normalTextApp("contact@example.com", context)
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.briefcase, color: AppColors.secondary),
                      normalTextApp("Ingénieur Logiciel", context)
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.phone, color: AppColors.secondary),
                      normalTextApp("06 12 34 56 78", context)
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.map, color: AppColors.secondary),
                      normalTextApp("Brazzaville", context)
                    ],
                  ),
              
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.facebook, color: AppColors.secondary),
                      normalTextApp("Facebook", context)
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.linkedin, color: AppColors.secondary),
                      normalTextApp("Brazzaville", context)
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(EvaIcons.alertCircle, color: AppColors.secondary),
                      normalTextApp("Congolaise", context)
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    children: [
                      normalTextApp("Compétence : ", context),
                      BadgeApp(i: 1), BadgeApp(i: 1), BadgeApp(i: 1), BadgeApp(i: 1), BadgeApp(i: 1)
                    ],
                  ),
                  SizedBox(height: 10,),
                  mediumTextApp("Description: ", context),
                  normalTextApp("Elijah Walter est un ingénieur logiciel spécialisé dans le développement d'applications mobiles pour les entreprises. Il a travaillé dans le secteur de l'informatique pendant plus de 15 ans et a obtenu un diplôme de l'Université de Brazzaville en 2019.", context)
              
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

  Widget _buildRealisationTab(BuildContext context) {
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

        if (state is ProfilExperienceLoaded) {
          // Afficher les réalisations récupérées
          return ListView(
            children: [
              // Vérifier si la liste est vide
              if (state.experiences.isEmpty) 
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: normalTextApp("Aucune réalisation trouvée", context),
                  ),
                )
              else 
                ...state.experiences.map((realisation) => CardRealisation()),

              SizedBox(height: 15),
            ],
          );

        }

        return Center(child: normalTextApp("Aucune réalisation trouvée", context));
      },
    );
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}