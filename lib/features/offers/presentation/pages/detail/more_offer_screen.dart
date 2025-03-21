import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../../../widgets/cards.dart';

class MoreOfferScreen extends StatelessWidget {
  final int projectId;
  const MoreOfferScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mediumTextApp("Besoin d’artisant pour renovation de toiture", context),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Icon(EvaIcons.creditCard, color: AppColors.secondary,),
                            Expanded(child: normalTextApp("10 000F CFA", context))
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Icon(EvaIcons.pin,color: AppColors.secondary,),
                            Expanded(child: normalTextApp("Moungali", context))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, size: 15, color: AppColors.open,),
                          normalTextApp("Ouvert", context)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  normalTextApp("6 dévis envoyés", context),
                  SizedBox(height: 20),
                  normalTextApp("Details: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.", context),
                  SizedBox(height: 30),
                  Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(child: Icon(EvaIcons.calendar, color: AppColors.secondary,)),
                      normalTextApp("Publié le : ",context),
                      Expanded(child: Text("01 mars 2025 à 20h15",style: GoogleFonts.poppins(color: AppColors.darkTextDisabled, fontWeight: FontWeight.w500, fontSize: 15))),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    spacing: 5,
                    children: [
                      CircleAvatar(child: Icon(EvaIcons.people, color: AppColors.secondary,)),
                      normalTextApp("Profil : ",context),
                      Expanded(
                        child: Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            for (int i = 0; i < 2; i++)
                              BadgeApp(i: i),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Image.asset("assets/offre2.jpg"),
                  SizedBox(height: 10,),
                  Image.asset("assets/offre2.jpg"),
                  SizedBox(height: 10,),
                  Image.asset("assets/offre2.jpg")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}