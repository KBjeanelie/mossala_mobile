import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class RealisationScreen extends StatelessWidget {
  const RealisationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Mes Réalisations", context),
      ),
      body: ListView(
        children: [
          CardRealisation(),
          CardRealisation(),
          CardRealisation(),
          SizedBox(height: 15,)
        ],
      ),
    );
  }
}

class CardRealisation extends StatelessWidget {
  const CardRealisation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 3, left: 5, right: 5),
      child: Padding(
        padding: AppSizes.spaceHV,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            mediumTextApp("Entreprise Dératisation Paris", context),
            Row(
              spacing: 5,
              children: [
                Icon(EvaIcons.checkmarkCircle, size: 20,color: AppColors.secondary,),
                smallTextApp('Juin 2024', context)
              ],
            ),
            normalTextApp("Site professionnel pour courtier assurances dans la région de Brive, avec automate pour calcul devis en ligne assurance dommage ouvrage, site évolutif construit sur mesure en fonction du concept du client et son ciblage géographique sur Brive, site livré référencé SEO avec 70 mots clés. \nlien vers le site : https://solutions-courtage-assurance-brive.fr/", context),
            SizedBox(height: 15,),
            SizedBox(
              child: Image(
                image: AssetImage("assets/work.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}