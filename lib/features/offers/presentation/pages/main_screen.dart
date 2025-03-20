import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../../widgets/cards.dart';
import '../bloc/offer_bloc.dart';
import '../bloc/offer_event.dart';
import '../bloc/offer_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // Déclencher le chargement des offres
    context.read<OfferBloc>().add(OffersEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage('assets/logo.png'),
          width: 90,
        ),
        actions: customeAction(context),
      ),
      body: BlocConsumer<OfferBloc, OfferState>(
        listener: (context, state) {
          if (state is OfferError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: normalTextApp(state.message, context),
              ),
            );
          }

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
        },
        builder: (context, state) {
          if (state is OfferLoading) {
            return  Center(child: CircularProgressIndicator());
          }
          if(state is OffersLoaded){
            if (state.offers.isEmpty) {
              return Center(child: normalTextApp("Pas des offres disponible", context));
            } else {
              return SingleChildScrollView(
                child: Column(
                    children: List.generate(
                  50,
                  (index) => CardOfferView(),
                )),
              );
            }
          }
          return Center(child: normalTextApp("Pas des offres disponible", context));
        },
      ),
    );
  }
}
