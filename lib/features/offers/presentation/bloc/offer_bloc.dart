
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
  
  OfferBloc({
    required this.assignedOfferToWorker,
    required this.getOpenOffer,
    required this.getOfferUsecase,
    required this.getOfferByIdUsecase,
    required this.createOfferUsecase,
    required this.deleteOfferUsecase,
  }) : super(OfferInitial()) {
    on<OffersEventFetch>(_getOffers);
    on<SingleOfferEvent>(_getOfferById);
    on<OfferEventCreate>(_createOffer);
    on<OfferDeletedEvent>(_deleteOffer);
    on<AssignedOfferToWorkerEvent>(_assignedOfferToWorker);
    on<OpenOffersEventFetch>(_openOffers);
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
    final result = await getOfferUsecase();
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
    final result = await getOfferUsecase();
    result.fold(
      (error) => emit(OfferError(error)),
      (offers) => emit(OffersLoaded(offers: offers)),
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