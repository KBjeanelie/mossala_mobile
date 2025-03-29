// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_bloc.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_state.dart';
import '../../core/theme/app_colors.dart';
import '../../features/offers/presentation/bloc/offer_event.dart';
import '../../features/profil/presentation/bloc/profil_bloc.dart';
import '../../features/profil/presentation/bloc/profil_event.dart';
import '../../features/profil/presentation/bloc/profil_state.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/cards.dart';
import '../../widgets/widgets.dart';

class UserProjetScreen extends StatefulWidget {
  const UserProjetScreen({super.key});

  @override
  State<UserProjetScreen> createState() => _UserProjetScreenState();
}

class _UserProjetScreenState extends State<UserProjetScreen> {

  @override
  void initState() {
    super.initState();
    // Déclencher le chargement des réalisations
    Future.microtask(() {
      context.read<ProfilBloc>().add(ProfilEventCreatedProject());
      context.read<OfferBloc>().add(OpenOffersEventFetch());
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: headingTextApp("Mes Projets",context),
          actions: customeAction(context),
          bottom: TabBar(
            dividerHeight: 0.0,
            indicatorColor: AppColors.secondary,
            labelStyle: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.secondary,
              fontWeight: FontWeight.w600
            ),
            tabs: [
              Tab(text: "Projets en cours",),
              Tab(text: "Projets créés",)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabViewOne(),
            TabViewTwo()
          ],
        ),
      ),
    );
  }
}


class TabViewOne extends StatelessWidget {
  const TabViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferBloc, OfferState>(
      listener: (context, state) {
        if (state is OfferLoading) {
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

        if (state is OfferError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is OfferLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is OpenOffersLoaded) {
          // Afficher les réalisations récupérées
          return ListView(
            children: [
              // Vérifier si la liste est vide
              if (state.offers.isEmpty) 
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: normalTextApp("Aucun projet en cours trouvée", context),
                  ),
                )
              else 
                ...state.offers.map((offer) => CardOfferView(offer: offer,)),

              SizedBox(height: 15),
            ],
          );

        }

        return Center(child: normalTextApp("Aucun projet en cours trouvée", context));
      },
    );
  }
}

class TabViewTwo extends StatelessWidget {
  const TabViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilBloc, ProfilState>(
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: normalTextApp("Aucun projet créé trouvé", context),
                  ),
                )
              else 
                ...state.createdProjects.map((offer) => CardOfferView(offer: offer,)),

              SizedBox(height: 15),
            ],
          );

        }

        return Center(child: Text("Aucun projet créé trouvée"));
      },
    );
  }
}