import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
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
        spacing: 5,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(AppSizes.borderRadius), topRight: Radius.circular(AppSizes.borderRadius)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/user.jpg')
              )
            ),
          ),
          Padding(
            padding: AppSizes.spaceHV,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mediumTextApp("KUBEMBULA Jean Elie", context),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Icon(EvaIcons.briefcase, size: 20, color: AppColors.secondary,),
                          normalTextApp("63 projets réalisé", context)
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Icon(EvaIcons.pin, size: 20, color: AppColors.secondary,),
                          Expanded(child: normalTextApp("Moungali", context))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios, color: AppColors.secondary),
                    Expanded(child: normalTextApp("Aide Maçon, Developpeur Informatique",context)),
                  ],
                ),
                SizedBox(height: 30),
                mainButtonApp(context, (){}, 'Voir profil')
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