import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/widgets/cards.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../bloc/profil_bloc.dart';
import '../bloc/profil_event.dart';
import '../bloc/profil_state.dart';

class ProjetCreerScreen extends StatefulWidget {
  const ProjetCreerScreen({super.key});

  @override
  _ProjetCreerScreenState createState() => _ProjetCreerScreenState();
}

class _ProjetCreerScreenState extends State<ProjetCreerScreen> {

  @override
  void initState() {
    super.initState();
    // Déclencher le chargement des réalisations
    Future.microtask(() {
      context.read<ProfilBloc>().add(ProfilEventCreatedProject());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Mes projets créés", context),
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

          if (state is ProfilCreatedProjectLoaded) {
            // Afficher les réalisations récupérées
            return ListView(
              children: [
                // Vérifier si la liste est vide
                if (state.createdProjects.isEmpty) 
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: normalTextApp("Aucun projet créé trouvé", context),
                      ),
                    ),
                  )
                else 
                  ...state.createdProjects.map((realisation) => CardOfferView()).toList(),

                SizedBox(height: 15),
              ],
            );

          }

          return Center(child: Text("Aucun projet créé trouvée"));
        },
      ),
    );
  }
}