import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/create_relisation_screen.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../bloc/profil_bloc.dart';
import '../bloc/profil_event.dart';
import '../bloc/profil_state.dart';
class RealisationScreen extends StatefulWidget {
  const RealisationScreen({super.key});

  @override
  _RealisationScreenState createState() => _RealisationScreenState();
}

class _RealisationScreenState extends State<RealisationScreen> {

  @override
  void initState() {
    super.initState();
    // Déclencher le chargement des réalisations
    Future.microtask(() {
      context.read<ProfilBloc>().add(ProfilEventExperience());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Mes Réalisations", context),
      ),
      body: BlocConsumer<ProfilBloc, ProfilState>(
        listener: (context, state) {
          if (state is ProfilLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            // Fermer le dialogue quand le chargement est terminé
            Navigator.of(context, rootNavigator: true).pop();
          }

          if (state is ProfilError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfilLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is ProfilExperienceLoaded) {
            // Afficher les réalisations récupérées
            return ListView(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: mainButtonApp(context, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateRelisationScreen()),
                        );
                      }, "Ajouter", size: 0.1),
                    )
                  ],
                ),

                // Vérifier si la liste est vide
                if (state.experiences.isEmpty) 
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: normalTextApp("Aucune réalisation trouvée", context),
                    ),
                  )
                else 
                  ...state.experiences.map((realisation) => CardRealisation()).toList(),

                SizedBox(height: 15),
              ],
            );

          }

          return Center(child: Text("Aucune réalisation trouvée"));
        },
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
                Icon(
                  EvaIcons.checkmarkCircle,
                  size: 20,
                  color: AppColors.secondary,
                ),
                smallTextApp('Juin 2024', context)
              ],
            ),
            normalTextApp(
                "Site professionnel pour courtier assurances dans la région de Brive, avec automate pour calcul devis en ligne assurance dommage ouvrage, site évolutif construit sur mesure en fonction du concept du client et son ciblage géographique sur Brive, site livré référencé SEO avec 70 mots clés. \nlien vers le site : https://solutions-courtage-assurance-brive.fr/",
                context),
            SizedBox(
              height: 15,
            ),
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
