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