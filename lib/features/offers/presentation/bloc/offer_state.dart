import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/offers/domain/entities/offer.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';

abstract class OfferState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OfferInitial extends OfferState {}

class OfferLoading extends OfferState {}

class OfferError extends OfferState {
  final String message;

  OfferError(this.message);

  @override
  List<Object?> get props => [message];
}

class OffersLoaded extends OfferState {
  final List<ProjectEntity> offers;

  OffersLoaded({required this.offers});

  @override
  List<Object?> get props => [offers];
}

class OpenOffersLoaded extends OfferState {
  final List<ProjectEntity> offers;

  OpenOffersLoaded({required this.offers});

  @override
  List<Object?> get props => [offers];
}


class OfferSelected extends OfferState {
  final ProjectEntity offer;

  OfferSelected({required this.offer});

  @override
  List<Object?> get props => [offer];
}

class OfferCreated extends OfferState {
  final ProjectEntity offer;

  OfferCreated({required this.offer});

  @override
  List<Object?> get props => [offer];
}

class OfferDeleted extends OfferState {
  final bool deleted;

  OfferDeleted({required this.deleted});

  @override
  List<Object?> get props => [deleted];
}

class OfferClosed extends OfferState {
  final bool closed;

  OfferClosed({required this.closed});

  @override
  List<Object?> get props => [closed];
}

class OfferAssignedToWorker extends OfferState {
  final ProjectEntity offer;

  OfferAssignedToWorker({required this.offer});

  @override
  List<Object?> get props => [offer];
}

class GetAppliedOffers extends OfferState {
  final List<OfferEntity> appliesOffers;

  GetAppliedOffers(this.appliesOffers);
  @override
  List<Object?> get props => [appliesOffers];
}

class GetApplyOffer extends OfferState {
  final OfferEntity applyOffer;

  GetApplyOffer({required this.applyOffer});
  @override
  List<Object?> get props => [applyOffer];
}

class CreatedApplyOffer extends OfferState {
  final bool created;
  CreatedApplyOffer({required this.created});
  @override
  List<Object?> get props => [created];
}

class DeletedApplyOffer extends OfferState {
  final bool deleted;
  DeletedApplyOffer({required this.deleted});
  @override
  List<Object?> get props => [deleted];
}