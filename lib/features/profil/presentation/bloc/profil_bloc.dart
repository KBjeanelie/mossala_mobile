
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_event.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_state.dart';

import '../../domain/usecases/profil_usecase.dart';

class ProfilBloc extends Bloc<ProfilEvent, ProfilState> {
  final RealisationUsecase realisationUsecase;
  final ProjetAssignedUsecase projetAssignedUsecase;
  final ProjetCreatedUsecase projetCreatedUsecase;

  ProfilBloc({required this.realisationUsecase, required this.projetAssignedUsecase, required this.projetCreatedUsecase}) : super(ProfilInitial()) {
    on<ProfilEventRealisation>(_profilRealisation);
    on<ProfilEventAssignedProject>(_profilProjectAssigned);
    on<ProfilEventCreatedProject>(_profilProjectCreated);
  }

  Future<void> _profilRealisation(
      ProfilEventRealisation event, Emitter<ProfilState> emit) async {
      emit(ProfilLoading()); 

    final result = await realisationUsecase();
    result.fold(
      (error) => emit(ProfilError(error)),
      (realisations) => emit(ProfilRealisationLoaded(realisations)),
    );
  }

  Future<void> _profilProjectAssigned(
      ProfilEventAssignedProject event, Emitter<ProfilState> emit) async {
      emit(ProfilLoading()); 

    final result = await projetAssignedUsecase();
    result.fold(
      (error) => emit(ProfilError(error)),
      (assignedProjects) => emit(ProfilAssignedProjectLoaded(assignedProjects)),
    );
  }

  Future<void> _profilProjectCreated(
      ProfilEventCreatedProject event, Emitter<ProfilState> emit) async {
      emit(ProfilLoading()); 

    final result = await projetCreatedUsecase();
    result.fold(
      (error) => emit(ProfilError(error)),
      (createdProjects) => emit(ProfilCreatedProjectLoaded(createdProjects)),
    );
  }


}
