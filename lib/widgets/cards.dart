import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class WorkerCardView extends StatefulWidget {
  const WorkerCardView({super.key});

  @override
  State<WorkerCardView> createState() => _WorkerCardViewState();
}

class _WorkerCardViewState extends State<WorkerCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/user.jpg"),
            ),
            title: mediumTextApp("Elijah Walter", context),
            subtitle: Row(
              spacing: 5,
              children: [
                Icon(Icons.circle, size: 10, color: AppColors.open,),
                Text("Disponible", style: GoogleFonts.poppins(
                  color: AppColors.open,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),)
              ],
            ),
          ),
          Container(
            margin: AppSizes.spaceHV,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                normalTextApp("Salut, je suis un prestataire sur Mosala et je suis disponible à l'instant si tu as besoin de mes services. \nMerci!", context),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Badge(
                        backgroundColor: AppColors.lightBorder,
                        padding: EdgeInsets.all(5),
                        label: Text("Metier ${i+1}", style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.lightText,
                        ),),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Icon(EvaIcons.checkmarkSquare2, size: 20, color: AppColors.secondary,),
                          Expanded(child: smallTextApp("64 projets réalisés", context))
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Icon(EvaIcons.pin, size: 20, color: AppColors.secondary,),
                          Expanded(child: smallTextApp("Mfilou", context))
                        ],
                      ),
                    ),
                  ],
                ),
                mainButtonApp(context, (){}, "Voir le profil")
              ],
            ),
          )
        ],
      ),
    );
  }
}



class CardOfferView extends StatefulWidget {
  const CardOfferView({super.key});

  @override
  State<CardOfferView> createState() => _CardOfferViewState();
}

class _CardOfferViewState extends State<CardOfferView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_ios,color: AppColors.secondary,),
                      Expanded(child: mediumTextApp("Charpentier, Plafonier", context))
                    ],
                  ),
                ),
                Flexible(child: normalTextApp("Il y a 2 min", context))
              ],
            ),
            SizedBox(height: 20),
            mainButtonApp(context, (){}, 'Envoyer un dévis')
          ],
        ),
      ),
    );
  }
}