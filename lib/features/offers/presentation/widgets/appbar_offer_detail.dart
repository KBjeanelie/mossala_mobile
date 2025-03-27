// ignore_for_file: use_build_context_synchronously

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:mossala_mobile/features/auth/data/models/user_model.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_bloc.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_event.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_state.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class AppBarOfferDetail extends StatelessWidget implements PreferredSizeWidget {
  final String projectId;
  final int curentUserId;

  const AppBarOfferDetail({
    Key? key,
    required this.projectId,
    required this.curentUserId,
  }) : super(key: key);

  void _deleteOffer(BuildContext context, String id) {
    final offerBloc = BlocProvider.of<OfferBloc>(context);
    offerBloc.add(OfferDeletedEvent(id));
    Future.delayed(const Duration(milliseconds: 500), () {
      context.go('/');
    });
  }

  void _closedOffer(BuildContext context, String id) {
    final offerBloc = BlocProvider.of<OfferBloc>(context);
    offerBloc.add(OfferClosedEvent(id));
    Future.delayed(const Duration(milliseconds: 500), () {
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
        if (state is OfferError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: normalTextApp(state.message, context),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is OfferDeleted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: normalTextApp("Votre projet a été supprimé !", context),
              backgroundColor: AppColors.closed,
            ),
          );
        } else if (state is OfferClosed) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: normalTextApp("Votre projet a été fermé !", context),
              backgroundColor: AppColors.secondary,
            ),
          );
        }
      },
      builder: (context, state) {
        return AppBar(
          actions: [
            if (state is OfferSelected && state.offer.owner == curentUserId) ...[
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == "closed") {
                    _showConfirmationDialog(
                      context,
                      title: "Fermer le projet",
                      content: "Êtes-vous sûr de vouloir fermer ce projet ?",
                      onConfirm: () => _closedOffer(context, projectId),
                    );
                  } else if (value == "delete") {
                    _showConfirmationDialog(
                      context,
                      title: "Supprimer le projet",
                      content:
                          "Êtes-vous sûr de vouloir supprimer ce projet ? Cette action est irréversible.",
                      onConfirm: () => _deleteOffer(context, projectId),
                    );
                  }
                },
                itemBuilder: (BuildContext context) => [
                  if (!state.offer.isClosed)
                    PopupMenuItem(
                      value: "closed",
                      child: ListTile(
                        leading: Icon(EvaIcons.lock, color: AppColors.secondary),
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
                icon: const Icon(EvaIcons.settings2Outline),
              )
            ]
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
