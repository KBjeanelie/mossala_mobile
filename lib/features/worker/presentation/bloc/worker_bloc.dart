
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/features/worker/domain/usecases/worker_usecase.dart';
import 'package:mossala_mobile/features/worker/presentation/bloc/worker_event.dart';
import 'package:mossala_mobile/features/worker/presentation/bloc/worker_state.dart';

class WorkerBloc extends Bloc<WorkerEvent, WorkerState> {
  final GetWorkersUsecase getWorkersUsecase;
  final GetSingleWorkerUsecase getSingleWorkerUsecase;
  final ExperienceOfWorkerUsecase experienceOfWorkerUsecase;
  final ProjectAssignedToWorkerUsecase updateWorkerUsecase;
  final ProjectCreatedByWorkerUsecase deleteWorkerUsecase;

  WorkerBloc({
    required this.getWorkersUsecase,
    required this.getSingleWorkerUsecase,
    required this.experienceOfWorkerUsecase,
    required this.updateWorkerUsecase,
    required this.deleteWorkerUsecase,
  }) : super(WorkerInitial()) {
    on<FetchWorkersEvent>(_fetchWorkers);
    on<FetchSingleWorkerEvent>(_fetchSingleWorker);
    on<WorkerEventExperience>(_fetchExperience);
    on<WorkerEventAssignedProject>(_fetchAssignedProject);
    on<WorkerEventCreatedProject>(_fetchCreatedProject);
  }

  Future<void> _fetchWorkers(FetchWorkersEvent event, Emitter<WorkerState> emit) async {
    emit(WorkerLoading());

    final result = await getWorkersUsecase();
    result.fold(
      (error) => emit(WorkerError(error)),
      (workers) => emit(FetchWorkersLoaded(workers)),
    );
  }

  Future<void> _fetchSingleWorker(FetchSingleWorkerEvent event, Emitter<WorkerState> emit) async {
    emit(WorkerLoading());

    final result = await getSingleWorkerUsecase(event.userId);
    result.fold(
      (error) => emit(WorkerError(error)),
      (worker) => emit(WorkerLoaded(worker)),
    );
  }

  Future<void> _fetchExperience(WorkerEventExperience event, Emitter<WorkerState> emit) async {
    emit(WorkerLoading());

    final result = await experienceOfWorkerUsecase(event.userId);
    result.fold(
      (error) => emit(WorkerError(error)),
      (experience) => emit(WorkerExperienceLoaded(experience)),
    );
  }

  Future<void> _fetchAssignedProject(WorkerEventAssignedProject event, Emitter<WorkerState> emit) async {
    emit(WorkerLoading());

    final result = await updateWorkerUsecase(event.userId);
    result.fold(
      (error) => emit(WorkerError(error)),
      (assignedProjects) => emit(WorkerAssignedProjectLoaded(assignedProjects)),
    );
  }

  Future<void> _fetchCreatedProject(WorkerEventCreatedProject event, Emitter<WorkerState> emit) async {
    emit(WorkerLoading());
    final result = await deleteWorkerUsecase(event.userId);
    result.fold(
      (error) => emit(WorkerError(error)),
      (createdProjects) => emit(WorkerCreatedProjectLoaded(createdProjects)),
    );
  }

}