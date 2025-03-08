import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';
import 'package:mossala_mobile/widgets/widgets.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple("Menu", context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizes.spaceH,
            Card(
              margin: AppSizes.spaceHorizontal,
              child: Column(
                children: [
                  ListTile(
                    onTap: (){},
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/user.jpg"),
                    ),
                    title: mediumTextApp("KUBEMBULA Jean Elie", context),
                    trailing: Icon(EvaIcons.arrowIosForward),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){},
                    leading: CircleAvatar(
                      child: Icon(EvaIcons.plus),
                    ),
                    title: normalTextApp("Créer un nouveau projet", context),
                    subtitle: smallTextApp("Créer un nouveau projet ou demander un service en toute simplicité", context),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: AppSizes.spaceHorizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: CardMenu(icon: EvaIcons.checkmarkSquare, title: "Réalisations",)),
                      Expanded(child: CardMenu(icon: EvaIcons.edit2, title: "Projets créés",)),
                    ],
                  ),
                  Row(
                    children: [
                      CardMenu(icon: EvaIcons.award, title: "Projets remportés",),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CardMenu2(icon: EvaIcons.bell, title: "Notifications",),
            CardMenu2(icon: EvaIcons.settings, title: "Paramètres",),
            CardMenu2(icon: EvaIcons.alertTriangle, title: "Signaler un problème",),
            CardMenu2(icon: EvaIcons.externalLink, title: "Envoyer un feedback"),
            CardMenu2(icon: EvaIcons.info, title: "À propos de nous",),

            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                color: const Color.fromARGB(33, 29, 114, 184)
              ),
              child: ListTile(
                leading: Icon(EvaIcons.logOut, color: AppColors.secondary),
                title: normalTextApp("Déconnexion", context),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  const CardMenu({
    super.key, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.secondary,),
            normalTextApp(title, context)
          ],
        ),
      ),
    );
  }
}



class CardMenu2 extends StatelessWidget {
  final IconData icon;
  final String title;
  const CardMenu2({
    super.key, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 5, right: 5, top: 3),
      child: ListTile(
        onTap: () {},
        leading: Icon(icon, color: AppColors.secondary,),
        title: normalTextApp(title, context),
      ),
    );
  }
}