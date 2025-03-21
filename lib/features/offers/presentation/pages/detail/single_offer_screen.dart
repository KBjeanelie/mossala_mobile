import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
import 'package:mossala_mobile/features/offers/presentation/pages/detail/more_offer_screen.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../widgets/cards.dart';

class SingleOfferScreen extends StatefulWidget {
  final int projectId;
  const SingleOfferScreen({super.key, required this.projectId});

  @override
  State<SingleOfferScreen> createState() => _SingleOfferScreenState();
}

class _SingleOfferScreenState extends State<SingleOfferScreen> {

  final TextEditingController controle = TextEditingController();
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
                  normalTextApp("Details: Nous recherchons des artisans pour la renovation d’une toiture...", context),
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
                  SizedBox(height: 10,),
                  Row(
                    spacing: 5,
                    children: [
                      Expanded(child: mainButtonApp(context, (){
                        _showCustomModal(context, controle);
                      }, "Faire une offre", size: 0.5)),
                      Expanded(child: mainOutlinedButtonApp(context, (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MoreOfferScreen(projectId: 1,)));
                      }, "Voir plus", size: 0.3))
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 5),
            elevation: 2,
            child: Padding(
              padding: AppSizes.spaceHV,
              child: headingTextApp("Offres pour ce projet :", context),
            )
          ),
          for(int i = 0; i < 5; i++)
            CardWorkerOffer(),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

void _showCustomModal(BuildContext context, controler) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          padding: AppSizes.spaceHV,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: headingTextApp("Proposez votre offre", context)),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 20),
              normalTextApp("Montant", context),
              inputForm("", controler, Validators.validateInput, type: TextInputType.number),
              SizedBox(height: 10),
              normalTextApp("Durée de travail", context),
              inputForm("",controler, Validators.validateInput, type: TextInputType.number),
              SizedBox(height: 10),
              normalTextApp("Laisser un petit commentaire", context),
              inputForm("", controler, Validators.validateInput, lines: 5, length: 700),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Fermer"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Action à exécuter
                      Navigator.pop(context);
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
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
        padding: const EdgeInsets.only(top: 2, bottom: 2),
        child: ListTile(
          onTap: (){},
          leading: CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/user.jpg"),),
          title: mediumTextApp("Elijah Walter", context),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(EvaIcons.clock, size: 15,),
              SizedBox(width: 4,),
              smallTextApp("2 Jours", context),
              SizedBox(width: 4,),
              smallTextApp("10 000F CFA", context)
            ],
          ),
          trailing: CircleAvatar(
            backgroundColor: AppColors.working,
            radius: 15,
            child: Text("1", style: GoogleFonts.poppins(color: AppColors.darkText, fontSize: 15, fontWeight: FontWeight.w600),),
          ),
        ),
      ),
    );
  }
}