
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_event.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_state.dart';

import '../../domain/usecases/experience_usecase.dart';

class ProfilBloc extends Bloc<ProfilEvent, ProfilState> {
  final ExperienceUsecase experienceUsecase;

  ProfilBloc({required this.experienceUsecase}) : super(ProfilInitial()) {
    on<ProfilEventExperience>(_profilExperience);
  }

  Future<void> _profilExperience(
      ProfilEventExperience event, Emitter<ProfilState> emit) async {
      emit(ProfilLoading()); 

    final result = await experienceUsecase();
    result.fold(
      (error) => emit(ProfilError(error)),
      (experiences) => emit(ProfilExperienceLoaded(experiences)),
    );
  }
}
