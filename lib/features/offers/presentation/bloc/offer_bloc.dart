
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_event.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_state.dart';

import '../../domain/usecases/offer_usecase.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final GetOfferUsecase getOfferUsecase;
  final GetOfferByIdUsecase getOfferByIdUsecase;
  final CreateOfferUsecase createOfferUsecase;
  final DeleteOfferUsecase deleteOfferUsecase;

  OfferBloc({
    required this.getOfferUsecase,
    required this.getOfferByIdUsecase,
    required this.createOfferUsecase,
    required this.deleteOfferUsecase,
  }) : super(OfferInitial()) {
    on<OffersEventFetch>(_getOffers);
    on<SingleOfferEvent>(_getOfferById);
    on<OfferEventCreate>(_createOffer);
    on<OfferDeletedEvent>(_deleteOffer);
  }

  Future<void> _getOffers(OffersEventFetch event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await getOfferUsecase();
    result.fold(
      (error) => emit(OfferError(error)),
      (offers) => emit(OffersLoaded(offers: offers)),
    );
  }

  Future<void> _getOfferById(SingleOfferEvent event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await getOfferUsecase();
    result.fold(
      (error) => emit(OfferError(error)),
      (offers) => emit(OffersLoaded(offers: offers)),
    );
  }

  Future<void> _createOffer(OfferEventCreate event, Emitter<OfferState> emit) async {
    emit(OfferLoading());
    final result = await createOfferUsecase(event.offer);
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
}