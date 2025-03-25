import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';

abstract class OfferEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OffersEventFetch extends OfferEvent {
  final List<ProjectEntity> offers = [];

  OffersEventFetch();

  @override
  List<Object?> get props => [offers];
}

class OpenOffersEventFetch extends OfferEvent {
  final List<ProjectEntity> offers = [];

  OpenOffersEventFetch();

  @override
  List<Object?> get props => [offers];
}

class SingleOfferEvent extends OfferEvent {
  final ProjectEntity offer;

  SingleOfferEvent(this.offer);
  @override
  List<Object?> get props => [offer];
}

class OfferDeletedEvent extends OfferEvent {}

class AssignedOfferToWorkerEvent extends OfferEvent {
  final String projectId;
  final String workerId;
  AssignedOfferToWorkerEvent(this.projectId, this.workerId);
  @override
  List<Object?> get props => [projectId, workerId];
}

class OfferEventCreate extends OfferEvent {
  final ProjectEntity offer;

  OfferEventCreate(this.offer);
  @override
  List<Object?> get props => [offer];
}

