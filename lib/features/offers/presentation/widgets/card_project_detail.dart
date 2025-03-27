// ignore_for_file: use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_bloc.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_event.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_state.dart';
import 'package:mossala_mobile/widgets/cards.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class CardProjectDetail extends StatefulWidget {
  final int currentUserId;
  final int projectId;
  const CardProjectDetail({super.key, required this.currentUserId, required this.projectId});

  @override
  State<CardProjectDetail> createState() => _CardProjectDetailState();
}

class _CardProjectDetailState extends State<CardProjectDetail> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<OfferBloc>().add(SingleOfferEvent(widget.projectId.toString()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferBloc, OfferState>(
      listener: (context, state) {
        if (state is CreatedApplyOffer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: normalTextApp("Dévis envoyé !", context), backgroundColor: AppColors.open),
          );
        }else if (state is OfferError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: normalTextApp(state.message, context),backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        if (state is OfferLoading) Center(child: CircularProgressIndicator());
        if (state is OfferSelected) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            elevation: 2,
            child: Container(
              padding:EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mediumTextApp(state.offer.name, context),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Icon(EvaIcons.creditCard,color: AppColors.secondary,
                            ),
                            Expanded(child: normalTextApp("${state.offer.amount}F CFA",context))
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Icon(EvaIcons.pin,color: AppColors.secondary,
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
                  normalTextApp(state.offer.description.length > 150
                    ? "${state.offer.description.substring(0, 150)}..."
                    : state.offer.description,context),
                  SizedBox(height: 30),
                  Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        child: Icon(EvaIcons.calendar,color: AppColors.secondary,
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
                          child: Icon(EvaIcons.people,color: AppColors.secondary,
                      )),
                      normalTextApp("Profil : ", context),
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      if(state.offer.isClosed)...[
                        Expanded(child: mainOutlinedButtonApp(context, () {
                          context.push("/project/${state.offer.id}/mores");
                        }, "Voir plus", size: 0.3))
                      ] else ... [
                        if (state.offer.owner !=  widget.currentUserId)
                          Expanded(child: mainButtonApp(context, () {
                            _showCustomModal(context, amountController, durationController, descriptionController, widget.currentUserId, state.offer.id);
                          }, "Faire une offre", size: 0.5)),
                        Expanded(child: mainOutlinedButtonApp(context, () {
                          context.push("/project/${state.offer.id}/mores");
                        }, "Voir plus", size: 0.3))
                      ]
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }

  void _showCustomModal(BuildContext context,
    TextEditingController amountController,
    TextEditingController durationController,
    TextEditingController descriptionController,
    int userId,
    int projectId,
  ) {
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
              inputForm("", amountController, Validators.validateInput,type: TextInputType.number),
              SizedBox(height: 10),
              normalTextApp("Durée de travail", context),
              inputForm("", durationController, Validators.validateInput,type: TextInputType.number),
              SizedBox(height: 10),
              normalTextApp("Laisser un petit commentaire", context),
              inputForm("", descriptionController, Validators.validateInput,lines: 5, length: 700),
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
                      final offerBloc = BlocProvider.of<OfferBloc>(context);
                      offerBloc.add(ApplyOfferEvent(
                        double.parse(amountController.text),
                        durationController.text,
                        descriptionController.text,
                        userId,
                        projectId,
                      ));
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
}