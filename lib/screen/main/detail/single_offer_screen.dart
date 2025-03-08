import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../core/theme/app_colors.dart';
import '../../../widgets/cards.dart';

class SingleOfferScreen extends StatefulWidget {
  const SingleOfferScreen({super.key});

  @override
  State<SingleOfferScreen> createState() => _SingleOfferScreenState();
}

class _SingleOfferScreenState extends State<SingleOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                  normalTextApp("Details: Nous recherchons des artisans pour la renovation d’une toiture...", context),
                  SizedBox(height: 30),
                  Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(child: Icon(EvaIcons.calendar, color: AppColors.secondary,)),
                      normalTextApp("Publié le : ",context),
                      Text("01 mars 2025 à 20h15",style: GoogleFonts.poppins(color: AppColors.darkTextDisabled, fontWeight: FontWeight.w500, fontSize: 16)),
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
                  SizedBox(height: 10,),
                  Row(
                    spacing: 5,
                    children: [
                      Expanded(child: mainButtonApp(context, (){}, "Faire une offre", size: 0.5)),
                      Expanded(child: mainOutlinedButtonApp(context, (){}, "Voir plus", size: 0.3))
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              child: ListView(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    elevation: 2,
                    child: Padding(
                      padding: AppSizes.spaceHV,
                      child: headingTextApp("Offres pour ce projet :", context),
                    )
                  ),
                  for(int i = 0; i < 10; i++)
                    CardWorkerOffer(),
                  SizedBox(height: 10)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardWorkerOffer extends StatelessWidget {
  const CardWorkerOffer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 5, right: 5, top: 3),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListTile(
          onTap: (){},
          leading: CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/user.jpg"),),
          title: mediumTextApp("Elijah Walter", context),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(EvaIcons.clock, size: 20,),
              SizedBox(width: 4,),
              normalTextApp("2 Jours", context),
              SizedBox(width: 4,),
              normalTextApp("10 000F CFA", context)
            ],
          ),
          trailing: CircleAvatar(
            backgroundColor: AppColors.working,
            child: Text("1", style: GoogleFonts.poppins(color: AppColors.darkText, fontSize: 20, fontWeight: FontWeight.w600),),
          ),
        ),
      ),
    );
  }
}