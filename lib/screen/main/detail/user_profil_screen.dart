import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/screen/main/detail/edit_account_screen.dart';
import 'package:mossala_mobile/screen/main/detail/realisation_screen.dart';
import 'package:mossala_mobile/widgets/cards.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../core/theme/app_colors.dart';

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
    return ListView(children: List.generate(10,(index) => CardOfferView()));
  }
  Widget _buildProjectsCreateTab(BuildContext context) {
    return ListView(children: List.generate(10,(index) => CardOfferView()));
  }

  Widget _buildRealisationTab(BuildContext context) {
    return ListView(children: List.generate(10,(index) => CardRealisation()));
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}