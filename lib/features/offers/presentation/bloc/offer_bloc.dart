
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_event.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_state.dart';

import '../../domain/usecases/offer_usecase.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final GetOfferUsecase getOfferUsecase;
  final GetOfferByIdUsecase getOfferByIdUsecase;
  final CreateOfferUsecase createOfferUsecase;
  final DeleteOfferUsecase deleteOfferUsecase;
  final AssignedOfferToWorker assignedOfferToWorker;
  final GetOpenOffer getOpenOffer;
  final ClosedOfferUsecase closedOfferUsecase;
  final GetAppliesOffersUsecase getAppliesOffersUsecase;
  final GetApplyOfferByIdUsercase getApplyOfferByIdUsercase;
  final ApplyOfferUsecase applyOfferUsecase;
  final CancelApplyOfferUsecase cancelApplyOfferUsecase;
  final GetProjectWithApplicationUsecase getProjectWithApplicationUsecase;
  
  OfferBloc({
    required this.assignedOfferToWorker,
    required this.getOpenOffer,
    required this.getOfferUsecase,
    required this.getOfferByIdUsecase,
    required this.createOfferUsecase,
    required this.deleteOfferUsecase,
    required this.closedOfferUsecase,
    required this.getAppliesOffersUsecase,
    required this.getApplyOfferByIdUsercase,
    required this.applyOfferUsecase,
    required this.cancelApplyOfferUsecase,
    required this.getProjectWithApplicationUsecase,
  }) : super(OfferInitial()) {
    on<OffersEventFetch>(_getOffers);
    on<SingleOfferEvent>(_getOfferById);
    on<SingleOfferWithApplicationEvent>(_getOfferWithApplication);
    on<OfferEventCreate>(_createOffer);
    on<OfferDeletedEvent>(_deleteOffer);
    on<AssignedOfferToWorkerEvent>(_assignedOfferToWorker);
    on<OpenOffersEventFetch>(_openOffers);
    on<OfferClosedEvent>(_closedOffer);
    on<GetAppliesOffersEvent>(_appliesOffer);
    on<GetSingleApplyOfferEvent>(_singleApplyOffer);
    on<ApplyOfferEvent>(_applyOffer);
    on<DeleteApplyOfferEvent>(_deleteApplyOffer);
  }

  Future<void> _appliesOffer(GetAppliesOffersEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await getAppliesOffersUsecase(event.projectId);
    result.fold(
      (error) => emit(OfferError(error)),
      (appliesOffers) => emit(GetAppliedOffers(appliesOffers)),
    );
  }

  Future<void> _singleApplyOffer(GetSingleApplyOfferEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await getApplyOfferByIdUsercase(event.applyOfferId);
    result.fold(
      (error) => emit(OfferError(error)),
      (applyOffer) => emit(GetApplyOffer(applyOffer: applyOffer)),
    );
  }

  Future<void> _applyOffer(ApplyOfferEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await applyOfferUsecase(
      event.amount,
      event.duration,
      event.description,
      event.userId,
      event.projectId
    );
    result.fold(
      (error) => emit(OfferError(error)),
      (_) => emit(CreatedApplyOffer(created: true)),
    );
  }

  Future<void> _deleteApplyOffer(DeleteApplyOfferEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await cancelApplyOfferUsecase(event.applyOfferId);
    result.fold(
      (error) => emit(OfferError(error)),
      (_) => emit(DeletedApplyOffer(deleted: true)),
    );
  }

  Future<void> _getOffers(OffersEventFetch event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await getOfferUsecase();
    result.fold(
      (error) => emit(OfferError(error)),
      (offers) => emit(OffersLoaded(offers: offers)),
    );
  }

  Future<void> _openOffers(OpenOffersEventFetch event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await getOpenOffer();
    result.fold(
      (error) => emit(OfferError(error)),
      (offers) => emit(OpenOffersLoaded(offers: offers)),
    );
  }

  Future<void> _getOfferById(SingleOfferEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await getOfferByIdUsecase(event.projectId);
    result.fold(
      (error) => emit(OfferError(error)),
      (offer) => emit(OfferSelected(offer: offer)),
    );
  }

  Future<void> _getOfferWithApplication(SingleOfferWithApplicationEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await getProjectWithApplicationUsecase(event.projectId);
    result.fold(
      (error) => emit(OfferError(error)),
      (project) => emit(GetOfferWithApplicationSuccess(singleProject: project)),
    );
  }

  Future<void> _createOffer(OfferEventCreate event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await createOfferUsecase(
      event.name, event.description, event.address, event.amount, event.uploadedImages
    );
    result.fold(
      (error) => emit(OfferError(error)),
      (offer) => emit(OfferCreated(offer: offer)),
    );
  }

  Future<void> _deleteOffer(OfferDeletedEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await deleteOfferUsecase(event.projectId);
    result.fold(
      (error) => emit(OfferError(error)),
      (deleted) => emit(OfferDeleted(deleted: deleted)),
    );
  }

  Future<void> _closedOffer(OfferClosedEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await closedOfferUsecase(event.projectId);
    result.fold(
      (error) => emit(OfferError(error)),
      (closed) => emit(OfferClosed(closed: closed)),
    );
  }

  Future<void> _assignedOfferToWorker(AssignedOfferToWorkerEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await assignedOfferToWorker(event.projectId, event.workerId);
    result.fold(
      (error) => emit(OfferError(error)),
      (offer) => emit(OfferAssignedToWorker(offer: offer)),
    );
  }
}