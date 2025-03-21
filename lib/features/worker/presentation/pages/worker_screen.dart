import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/features/worker/presentation/bloc/worker_bloc.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';
import 'package:mossala_mobile/widgets/cards.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../bloc/worker_event.dart';
import '../bloc/worker_state.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({super.key});

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  @override
  void initState() {
    super.initState();
    // Déclencher le chargement des réalisations
    Future.microtask(() {
      context.read<WorkerBloc>().add(FetchWorkersEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Prestataire", context),
      body: BlocConsumer<WorkerBloc, WorkerState>(
        listener: (context, state) {
          if (state is WorkerLoading) {
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

          if (state is WorkerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: normalTextApp(state.message, context)),
            );
          }
        },
        builder: (context, state) {

          if (state is WorkerLoading) return Center(child: CircularProgressIndicator());

          if (state is FetchWorkersLoaded){

            if (state.workers.isEmpty) {
              return Center(
                child: normalTextApp("Aucun prestataire trouvé", context),
              );
            } else {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: List.generate(
                    state.workers.length,
                    (index) => WorkerCardView(user: state.workers[index]),
                  ),
                ),
              );
            }
          }
          return Center(child: normalTextApp("Aucun prestataire trouvé", context));
        },
      ),
    );
  }
}
