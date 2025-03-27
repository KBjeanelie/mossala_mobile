// ignore_for_file: use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/offers/domain/entities/offer.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_bloc.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_event.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_state.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class CardAppyOffer extends StatefulWidget {
  final String projectId;
  const CardAppyOffer({super.key, required this.projectId});

  @override
  State<CardAppyOffer> createState() => _CardAppyOfferState();
}

class _CardAppyOfferState extends State<CardAppyOffer> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<OfferBloc>().add(GetAppliesOffersEvent(widget.projectId.toString()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferBloc, OfferState>(
      listener: (context, state) {
        if (state is OfferError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: normalTextApp(state.message, context),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is OfferLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OfferError) {
          return Center(child: normalTextApp("Une erreur est survenue.", context));
        }

        if (state is GetAppliedOffers) {
          return Padding(
            padding: AppSizes.spaceHV,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                headingTextApp("Offres pour ce projet :", context),
                if (state.appliesOffers.isEmpty)
                  normalTextApp("Soyez le premier à envoyer un devis", context)
                else
                  Column(
                    children: state.appliesOffers
                        .map((apply) => CardWorkerOffer(appyOffer: apply,)) 
                        .toList(),
                  ),
              ],
            ),
          );
        }

        return const SizedBox(); // Évite un retour null
      },
    );
  }
}



class CardWorkerOffer extends StatelessWidget {
  final OfferEntity appyOffer;
  const CardWorkerOffer({
    super.key, required this.appyOffer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 5, right: 5, top: 3),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 2),
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/user.jpg"),
          ),
          title: mediumTextApp("${appyOffer.user}", context),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                EvaIcons.clock,
                size: 15,
              ),
              SizedBox(
                width: 4,
              ),
              smallTextApp(appyOffer.duration, context),
              SizedBox(
                width: 4,
              ),
              smallTextApp("${appyOffer.amount}F CFA", context)
            ],
          ),
          trailing: CircleAvatar(
            backgroundColor: AppColors.working,
            radius: 15,
            child: Text(
              "1",
              style: GoogleFonts.poppins(
                  color: AppColors.darkText,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
