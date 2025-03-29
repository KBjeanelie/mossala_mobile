// ignore_for_file: use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
import 'package:mossala_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:mossala_mobile/features/auth/data/models/user_model.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/offers/domain/entities/offer.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_state.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/cards.dart';
import '../bloc/offer_bloc.dart';
import '../bloc/offer_event.dart';

class SingleOfferScreen extends StatefulWidget {
  final int projectId;
  const SingleOfferScreen({super.key, required this.projectId});

  @override
  State<SingleOfferScreen> createState() => _SingleOfferScreenState();
}

class _SingleOfferScreenState extends State<SingleOfferScreen> {
  final AuthLocalDataSource authLocalDataSource = AuthLocalDataSource(secureStorage: FlutterSecureStorage());
  User? currentUser;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      //context.read<OfferBloc>().add(GetAppliesOffersEvent(widget.projectId.toString()));
      _loadUser();
      context.read<OfferBloc>().add(SingleOfferWithApplicationEvent(widget.projectId.toString()));
    });
  }

  Future<void> _loadUser() async {
    try {
      final user = await authLocalDataSource.getUser();
      setState(() {
        currentUser = UserModel.fromJson(user!);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: normalTextApp("Erreur lors du chargement des informations.", context), backgroundColor: AppColors.closed,),
      );
    }
  }

  

  void _deleteOffer(String id) {
    final offerBloc = BlocProvider.of<OfferBloc>(context);
    offerBloc.add(OfferDeletedEvent(id));
    Future.delayed(Duration(milliseconds: 500), () {
      if (!mounted) return;
      context.go('/');
    });
  }

  void _closedOffer(String id) {
    final offerBloc = BlocProvider.of<OfferBloc>(context);
    offerBloc.add(OfferClosedEvent(id));
    Future.delayed(Duration(milliseconds: 500), () {
      if (!mounted) return;
      context.go('/');
    });
  }

  void _showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: mediumTextApp(title, context),
          content: normalTextApp(content, context),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le modal
              },
              child: normalTextApp("Annuler", context),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
              child: normalTextApp("OK", context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferBloc, OfferState>(
      listener: (context, state) {
        if (state is OfferLoading) {
          CircularProgressIndicator();
        } else if (state is OfferDeleted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: normalTextApp("Votre projet à été supprimé !", context), backgroundColor: AppColors.closed),
          );
        } else if (state is OfferClosed) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: normalTextApp("Votre projet à été fermé !", context), backgroundColor: AppColors.secondary),
          );
        } else if (state is CreatedApplyOffer) {
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
        return Scaffold(
          appBar: AppBar(
            actions: [
              if (state is GetOfferWithApplicationSuccess)...[
                if(state.singleProject.project.owner == currentUser?.id)...[
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == "closed") {
                      _showConfirmationDialog(
                        context,
                        title: "Fermer le projet",
                        content: "Êtes-vous sûr de vouloir fermer ce projet ?",
                        onConfirm: () => _closedOffer(widget.projectId.toString()),
                      );
                    } else if (value == "delete") {
                      _showConfirmationDialog(
                        context,
                        title: "Supprimer le projet",
                        content:"Êtes-vous sûr de vouloir supprimer ce projet ? Cette action est irréversible.",
                        onConfirm: () =>_deleteOffer(widget.projectId.toString()),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    if(!state.singleProject.project.isClosed)
                      PopupMenuItem(
                        value: "closed",
                        child: ListTile(
                          leading:
                              Icon(EvaIcons.lock, color: AppColors.secondary),
                          title: normalTextApp("Fermer le projet", context),
                        ),
                      ),
                    PopupMenuItem(
                      value: "delete",
                      child: ListTile(
                        leading: Icon(EvaIcons.trash2, color: Colors.red),
                        title: normalTextApp("Supprimer le projet", context),
                      ),
                    ),
                  ],
                  icon: Icon(EvaIcons.settings2Outline),
                )]
              ]
            ],
          ),
          body:ListView(
            children: [
              if (state is OfferLoading) Center(child: CircularProgressIndicator()),
              if (state is GetOfferWithApplicationSuccess)...[
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  elevation: 2,
                  child: Container(
                    padding:EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mediumTextApp(state.singleProject.project.name, context),
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
                                  Expanded(child: normalTextApp("${state.singleProject.project.amount}F CFA",context))
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
                                  Expanded(child: normalTextApp(state.singleProject.project.address, context))
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.circle, size: 15, color: state.singleProject.project.isClosed ? AppColors.closed : AppColors.open,),
                                normalTextApp(state.singleProject.project.isClosed ? "Fermé" : "Ouvert", context)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        normalTextApp("6 dévis envoyés", context),
                        SizedBox(height: 20),
                        normalTextApp(state.singleProject.project.description.length > 150
                          ? "${state.singleProject.project.description.substring(0, 150)}..."
                          : state.singleProject.project.description,context),
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
                                child: Text(state.singleProject.project.createdAt,
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
                            if(state.singleProject.project.isClosed)...[
                              Expanded(child: mainOutlinedButtonApp(context, () {
                                context.push("/project/${state.singleProject.project.id}/mores");
                              }, "Voir plus", size: 0.3))
                            ] else ... [
                              if (state.singleProject.project.owner != currentUser?.id)
                                Expanded(child: mainButtonApp(context, () {
                                  _showCustomModal(context, amountController, durationController, descriptionController, currentUser!.id, state.singleProject.project.id);
                                }, "Faire une offre", size: 0.5)),
                              Expanded(child: mainOutlinedButtonApp(context, () {
                                context.push("/project/${state.singleProject.project.id}/mores");
                              }, "Voir plus", size: 0.3))
                            ]
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
                    child:headingTextApp("(${state.singleProject.applications.length}) Dévis envoyé :", context),
                  ) 
                ),
                if (state.singleProject.applications.isEmpty)...[
                  Center(child: normalTextApp("Aucun dévis n'a été envoyé pour ce projet.", context),)
                ]else...[
                  ...state.singleProject.applications.map((apply) =>CardWorkerOffer(offer: apply))
                  
                ]
              ],
              SizedBox(height: 10)
            ],
          ),
        );
      },
    );
  }
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

class CardWorkerOffer extends StatelessWidget {
  final OfferEntity offer;
  const CardWorkerOffer({
    super.key, required this.offer,
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
          title: mediumTextApp("${offer.user['lastname']} ${offer.user['firstname']}", context),
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
              smallTextApp("2 Jours", context),
              SizedBox(
                width: 4,
              ),
              smallTextApp("10 000F CFA", context)
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
