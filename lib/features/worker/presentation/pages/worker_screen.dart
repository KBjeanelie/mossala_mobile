// ignore_for_file: use_build_context_synchronously, avoid_print

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
    // Déclencher le chargement des prestataires
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
          debugPrint("Current WorkerBloc state: $state");
          if (state is WorkerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: normalTextApp(state.message, context)),
            );
          }
        },
        builder: (context, state) {
          print("Current state: $state"); // Debugging
          if (state is WorkerInitial) {
            // Si l'état est initial, relancer le fetch
            context.read<WorkerBloc>().add(FetchWorkersEvent());
            return Center(child: CircularProgressIndicator());
          }

          if (state is WorkerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FetchWorkersLoaded) {
            if (state.workers.isEmpty) {
              return Center(
                child: normalTextApp("Aucun prestataire trouvé", context),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                itemCount: state.workers.length,
                itemBuilder: (context, index) {
                  return WorkerCardView(user: state.workers[index]);
                },
              );
            }
          }
          debugPrint("Current WorkerBloc state: $state");

          return Center(child: normalTextApp("Une erreur est survenue", context));
        },
      ),
    );
  }
}
