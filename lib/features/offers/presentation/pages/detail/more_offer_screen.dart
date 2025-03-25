import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_bloc.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_event.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_state.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../../../widgets/cards.dart';

class MoreOfferScreen extends StatefulWidget {
  final int projectId;
  const MoreOfferScreen({super.key, required this.projectId});

  @override
  State<MoreOfferScreen> createState() => _MoreOfferScreenState();
}

class _MoreOfferScreenState extends State<MoreOfferScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<OfferBloc>()
          .add(SingleOfferEvent(widget.projectId.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<OfferBloc, OfferState>(
        listener: (context, state) {
          if (state is OfferLoading) {
            CircularProgressIndicator();
          }
          if (state is OfferError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: normalTextApp(state.message, context)),
            );
          }
        },
        builder: (context, state) {
          if (state is OfferLoading) return Center(child: CircularProgressIndicator());
          return ListView(
            children: [
              if(state is OfferSelected)
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mediumTextApp(state.offer.name,context),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Icon(
                                    EvaIcons.creditCard,
                                    color: AppColors.secondary,
                                  ),
                                  Expanded(child:normalTextApp("${state.offer.amount}F CFA", context))
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                children: [
                                  Icon(
                                    EvaIcons.pin,
                                    color: AppColors.secondary,
                                  ),
                                  Expanded(child: normalTextApp(state.offer.address, context))
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.circle, size: 15, color: state.offer.isClosed ? AppColors.closed : AppColors.open,),
                                normalTextApp(state.offer.isClosed ? "Fermé" : "Ouvert", context)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        normalTextApp("6 dévis envoyés", context),
                        SizedBox(height: 20),
                        normalTextApp(state.offer.description, context),
                        SizedBox(height: 30),
                        Row(
                          spacing: 10,
                          children: [
                            CircleAvatar(
                                child: Icon(
                              EvaIcons.calendar,
                              color: AppColors.secondary,
                            )),
                            normalTextApp("Publié le : ", context),
                            Expanded(
                                child: Text(state.offer.createdAt,
                                    style: GoogleFonts.poppins(
                                        color: AppColors.darkTextDisabled,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15))),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            CircleAvatar(
                                child: Icon(
                              EvaIcons.people,
                              color: AppColors.secondary,
                            )),
                            normalTextApp("Profil : ", context),
                            Expanded(
                              child: Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  for (int i = 0; i < 2; i++) BadgeApp(i: i),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        for(int i = 0; i < state.offer.images.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Image.network(
                              state.offer.images[i]['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
