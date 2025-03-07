import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';
import 'package:mossala_mobile/widgets/widgets.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple("Menu"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: AppColors.textDark,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textDark,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 15,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/user.jpg'),
                                radius: 20,
                              ),
                              mediumTextApp("KUBEMBULA Jean Élie", font: FontWeight.w700),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios, size: 25, color: AppColors.grey,)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 3),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2EEFC),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                      ),
                      child: Row(
                        spacing: 15,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.textDark,
                            radius: 15,
                            child: Center(
                              child: Icon(Icons.add, size: 30, color: AppColors.backgroundLight,),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                normalTextApp("Créer un nouveau projet", size: 14.0, font: FontWeight.bold),
                                normalTextApp("Créer un nouveau projet ou demander un service en toute simplicité", size: 12.0)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                spacing: 10,
                children: [
                  Flexible(child: cardMenu(icon: Icons.stars, title: "Évaluations",)),
                  Flexible(child: cardMenu(icon: Icons.check_box, title: "Réalisations",)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                spacing: 10,
                children: [
                  Flexible(child: cardMenu(icon: Icons.school, title: "Formations",)),
                  Flexible(child: cardMenu(icon: Icons.fact_check, title: "Projets remportés",)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                spacing: 10,
                children: [
                  Flexible(child: cardMenu(icon: Icons.library_add_check, title: "Projet créés",)),
                ],
              ),
            ),
            SizedBox(height: 5),
            cardMenu2(icon: Icons.settings, title: "Paramètres",),
            cardMenu2(icon: Icons.balance, title: "Conditions et réglèments",),
            cardMenu2(icon: Icons.security, title: "Centre de confidentialité",),
            cardMenu2(icon: Icons.warning, title: "Signaler un problème",),
            SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFABCEF5),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: normalTextApp("Déconnexion", font: FontWeight.w500, color: AppColors.textDark)),
            )
          ],
        ),
      ),
    );
  }
}

class cardMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  const cardMenu({
    super.key, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 25, color: AppColors.backgroundLight,),
          normalTextApp(title, font: FontWeight.w800)
        ],
      ),
    );
  }
}



class cardMenu2 extends StatelessWidget {
  final IconData icon;
  final String title;
  const cardMenu2({
    super.key, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.textDark,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 25, color: AppColors.backgroundLight,),
          normalTextApp(title, font: FontWeight.w800)
        ],
      ),
    );
  }
}