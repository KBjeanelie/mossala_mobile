// ignore_for_file: use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/widgets/cards.dart';
import 'package:mossala_mobile/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../bloc/worker_bloc.dart';
import '../bloc/worker_event.dart';
import '../bloc/worker_state.dart';

class ProfilWorkerScreen extends StatefulWidget {
  final int workerId;
  const ProfilWorkerScreen({super.key, required this.workerId});

  @override
  State<ProfilWorkerScreen> createState() => _ProfilWorkerScreenState();
}

class _ProfilWorkerScreenState extends State<ProfilWorkerScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool isLoadingDialogOpen = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    Future.microtask(() {
      final workerBloc = context.read<WorkerBloc>();
      workerBloc.add(WorkerEventCreatedProject(widget.workerId));
      workerBloc.add(WorkerEventAssignedProject(widget.workerId));
      workerBloc.add(WorkerEventExperience(widget.workerId));
      workerBloc.add(FetchSingleWorkerEvent(widget.workerId));
    });
  }

  // Future<void> _makePhoneCall(String number) async {
  //   final Uri launchUri = Uri(scheme: 'tel', path: number);
  //   if (await canLaunchUrl(launchUri)) {
  //     await launchUrl(launchUri);
  //   } else {
  //     throw 'Impossible de passer l\'appel à $number';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<WorkerBloc, WorkerState>(
          listener: (context, state) {
            if (state is WorkerLoading) {
              CircularProgressIndicator();
            }

            if (state is WorkerError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: normalTextApp(state.message, context)),
              );
            }
          },
          builder: (context, state) {
            if (state is WorkerLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WorkerLoaded) {
              return mediumTextApp("${state.worker.lastname} ${state.worker.firstname}", context);
            }
            return tinyTextApp('', context);
          },
        ),
      ),
      body: Column(
        children: [
          _buildProfileCard(context),
          Card(
            margin: EdgeInsets.only(top: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: TabBar(
              controller: _tabController,
              dividerHeight: 0.0,
              indicatorColor: AppColors.secondary,
              labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: "À propos"),
                Tab(text: "Projets remportés"),
                Tab(text: "Projets créés"),
                //Tab(text: "Réalisations"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAboutCard(context),
                _buildProjectsDoneTab(context),
                _buildProjectsCreateTab(context),
                //_buildRealisationTab(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //_makePhoneCall("064838870")
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: AppColors.lightBorder,
        mini: true,
        child: Icon(EvaIcons.phone, color: AppColors.secondary),
      ),
    );
  }

  Widget _buildAboutCard(BuildContext context) {
    return BlocConsumer<WorkerBloc, WorkerState>(
      listener: (context, state) {
        if (state is WorkerLoading) {
          CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        if (state is WorkerLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is WorkerLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: AppSizes.spaceHV,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        mediumTextApp("${state.worker.lastname} ${state.worker.firstname}", context),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.at, color: AppColors.secondary),
                            if(state.worker.username == null || state.worker.username == "")...[
                              normalTextApp("Nom utilisateur non renseignée", context)
                            ]else...[
                              normalTextApp(state.worker.username ?? "", context)
                            ]
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.globe, color: AppColors.secondary),
                            if(state.worker.nickname == null || state.worker.nickname == "")...[
                              normalTextApp("Surnon non renseignée", context)
                            ]else...[
                              normalTextApp(state.worker.nickname ?? "", context)
                            ]
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.personAdd, color: AppColors.secondary),
                            if(state.worker.gender == null || state.worker.gender == "")...[
                              normalTextApp("Genre non renseignée", context)
                            ]else...[
                              normalTextApp(state.worker.gender ?? "", context)
                            ]
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.pin, color: AppColors.secondary),
                            if(state.worker.address == null || state.worker.address == "")...[
                              normalTextApp("Adresse non renseignée", context)
                            ]else...[
                              normalTextApp(state.worker.address ?? "", context)
                            ]
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.email, color: AppColors.secondary),
                            if(state.worker.email == null || state.worker.email == "")...[
                              normalTextApp("Email non renseignée", context)
                            ]else...[
                              normalTextApp(state.worker.email ?? "", context)
                            ]
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.phone, color: AppColors.secondary),
                            normalTextApp(state.worker.tel, context)
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.calendar, color: AppColors.secondary),
                            if(state.worker.dateOfBirth == null || state.worker.dateOfBirth == "")...[
                              normalTextApp("Date de naissance non renseignée", context)
                            ]else...[
                              normalTextApp(state.worker.dateOfBirth ?? "", context)
                            ]
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.facebook, color: AppColors.secondary),
                            if(state.worker.facebook == null || state.worker.facebook == "")...[
                              normalTextApp("Compte facebook non renseignée", context)
                            ]else...[
                              normalTextApp(state.worker.facebook ?? "", context)
                            ]
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.alertCircle, color: AppColors.secondary),
                            if(state.worker.nationality == null || state.worker.nationality == "")...[
                              normalTextApp("Nationnalité non renseignée", context)
                            ]else...[
                              normalTextApp(state.worker.nationality ?? "", context)
                            ]
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(EvaIcons.briefcase, color: AppColors.secondary),
                            if(state.worker.nationality == null || state.worker.nationality == "")...[
                              normalTextApp("Metier non renseignée", context)
                            ]else...[
                              normalTextApp(state.worker.nationality ?? "", context)
                            ]
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          children: [
                            mediumTextApp("Compétence : ", context),
                            BadgeApp(i: 1), BadgeApp(i: 1), BadgeApp(i: 1), BadgeApp(i: 1), BadgeApp(i: 1)
                          ],
                        ),
                        SizedBox(height: 10,),
                        mediumTextApp("Bio: ", context),
                        if(state.worker.nationality == null || state.worker.nationality == "")...[
                          normalTextApp("Salut, je suis un prestataire sur Mosala et je suis disponible à l'instant si tu as besoin de mes services. \nMerci!", context),
                        ]else...[
                          normalTextApp(state.worker.nationality ?? "", context)
                        ]
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return Center(
          child: normalTextApp("Impossible de chargé les données", context),
        );
      },
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: AppSizes.spaceHV,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/user.jpg"),
              radius: 40,
            ),
            SizedBox(height: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mediumTextApp("10", context),
                normalTextApp("Projets réalisés", context),
              ],
            ),
            Column(
              children: [
                mediumTextApp("5", context),
                normalTextApp("Projets créés", context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsDoneTab(BuildContext context) {
    return BlocConsumer<WorkerBloc, WorkerState>(
      listener: (context, state) {
        if (state is WorkerLoading) {
          CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        if (state is WorkerLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is WorkerAssignedProjectLoaded) {
          if (state.assignedProjects.isEmpty) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: normalTextApp("Aucun projet remporté trouvé", context),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.assignedProjects.length,
              itemBuilder: (context, index) => CardOfferView(offer: state.assignedProjects[index],),
            );
          }
        }

        return Center(
            child: normalTextApp("Aucun projet remporté trouvé", context));
      },
    );
  }

  Widget _buildProjectsCreateTab(BuildContext context) {
    return BlocConsumer<WorkerBloc, WorkerState>(
      listener: (context, state) {
        if (state is WorkerLoading) {
          CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        if (state is WorkerLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is WorkerCreatedProjectLoaded) {
          if (state.createdProjects.isEmpty) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: normalTextApp("Aucun projet créé trouvé", context),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.createdProjects.length,
              itemBuilder: (context, index) => CardOfferView(offer: state.createdProjects[index],),
            );
          }
        }
        return Center(
            child: normalTextApp("Aucun projet créé trouvé", context));
      },
    );
  }

  // Widget _buildRealisationTab(BuildContext context) {
  //   return BlocConsumer<WorkerBloc, WorkerState>(
  //     listener: (context, state) {
  //       if (state is WorkerLoading) {
  //         CircularProgressIndicator();
  //       }
  //     },
  //     builder: (context, state) {
  //       if (state is WorkerLoading) {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //       if (state is WorkerExperienceLoaded) {
  //         if (state.experiences.isEmpty) {
  //           return Padding(
  //             padding: EdgeInsets.all(16.0),
  //             child: Center(
  //               child: normalTextApp("Aucune réalisation trouvé", context),
  //             ),
  //           );
  //         } else {
  //           // return ListView.builder(
  //           //   itemCount: state.experiences.length,
  //           //   itemBuilder: (context, index) => CardOfferView(offer: state.experiences[index],),
  //           // );
  //         }
  //       }
  //       return Center(
  //           child: normalTextApp("Aucune réalisation trouvé", context));
  //     },
  //   );
  // }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
