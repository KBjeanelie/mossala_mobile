import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
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
      child: Container(
        margin: EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          spacing: 5,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/user.jpg')
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mediumTextApp("KUBEMBULA Jean Elie", size: 20.0, font: FontWeight.bold),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.home_repair_service, size: 25, color: AppColors.backgroundLight,),
                          normalTextApp("63 projets réalisés")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 25, color: AppColors.backgroundLight,),
                          normalTextApp("Moungali")
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios, size: 25, color: AppColors.backgroundLight,),
                      Expanded(child: mediumTextApp("Aide Maçon, Developpeur Informatique", font: FontWeight.w700))
                    ],
                  ),
                  SizedBox(height: 30),
                  mainButtonApp(context, (){}, 'Voir profil')
                ],
              ),
            )
          ],
        ),
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
      color: AppColors.textDark,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mediumTextApp("Besoin d’artisant pour renovation de toiture", color: AppColors.backgroundLight, font: FontWeight.w700),
            SizedBox(height: 10),
            Row(
              spacing: 15,
              children: [
                Row(
                  children: [
                    Icon(Icons.money, size: 25, color: AppColors.backgroundLight,),
                    normalTextApp("10 000F CFA")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 25, color: AppColors.backgroundLight,),
                    normalTextApp("Moungali")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.circle, size: 15, color: AppColors.secondary,),
                    normalTextApp("Ouvert")
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            normalTextApp("6 dévis envoyés"),
            SizedBox(height: 20),
            normalTextApp("Details: Nous recherchons des artisans pour la renovation d’une toiture...", font: FontWeight.w500),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios, size: 25, color: AppColors.backgroundLight,),
                    mediumTextApp("Charpentier, Plafonier", font: FontWeight.w700)
                  ],
                ),
                normalTextApp("Il y a 2 min")
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