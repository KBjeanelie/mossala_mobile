import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/widgets/cards.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../bloc/profil_bloc.dart';
import '../bloc/profil_event.dart';
import '../bloc/profil_state.dart';

class ProjetRemporteScreen extends StatefulWidget {
  const ProjetRemporteScreen({super.key});

  @override
  State<ProjetRemporteScreen> createState() => _ProjetRemporteScreenState();
}

class _ProjetRemporteScreenState extends State<ProjetRemporteScreen> {

  @override
  void initState() {
    super.initState();
    // Déclencher le chargement des réalisations
    Future.microtask(() {
      context.read<ProfilBloc>().add(ProfilEventAssignedProject());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Mes projets remporté", context),
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
              SnackBar(content: normalTextApp(state.message, context)),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfilLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is ProfilAssignedProjectLoaded) {
            // Afficher les réalisations récupérées
            return ListView(
              children: [
                // Vérifier si la liste est vide
                if (state.assignedProjects.isEmpty) 
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: normalTextApp("Aucun projet remporté trouvé", context),
                    ),
                  )
                else 
                  ...state.assignedProjects.map((realisation) => CardOfferView()),

                SizedBox(height: 15),
              ],
            );

          }

          return Center(child: normalTextApp("Aucun projet remporté trouvée", context));
        },
      ),
    );
  }
}