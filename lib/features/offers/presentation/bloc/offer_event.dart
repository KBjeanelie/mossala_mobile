import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/offers/domain/entities/offer.dart';
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
  final String projectId;
  SingleOfferEvent(this.projectId);
  @override
  List<Object?> get props => [projectId];
}

class SingleOfferWithApplicationEvent extends OfferEvent {
  final String projectId;
  SingleOfferWithApplicationEvent(this.projectId);
  @override
  List<Object?> get props => [projectId];
}

class OfferDeletedEvent extends OfferEvent {
  final String projectId;
  OfferDeletedEvent(this.projectId);
  @override
  List<Object?> get props => [projectId];
}

class OfferClosedEvent extends OfferEvent {
  final String projectId;
  OfferClosedEvent(this.projectId);
  @override
  List<Object?> get props => [projectId];
}

class AssignedOfferToWorkerEvent extends OfferEvent {
  final String projectId;
  final String workerId;
  AssignedOfferToWorkerEvent(this.projectId, this.workerId);
  @override
  List<Object?> get props => [projectId, workerId];
}

class OfferEventCreate extends OfferEvent {
  final String name;
  final String description;
  final String address;
  final double amount;
  final List<File> uploadedImages;

  OfferEventCreate(this.name, this.description, this.address, this.amount, this.uploadedImages);
  @override
  List<Object?> get props => [
    name,
    description,
    address,
    amount,
    uploadedImages,
  ];
}


class GetAppliesOffersEvent extends OfferEvent {
  final String projectId;
  
  final List<OfferEntity> appliesOffers = [];

  GetAppliesOffersEvent(this.projectId);
  
  @override
  List<Object?> get props => [projectId, appliesOffers];
}

class GetSingleApplyOfferEvent extends OfferEvent {
  final String applyOfferId;
  GetSingleApplyOfferEvent(this.applyOfferId);
  @override
  List<Object?> get props => [applyOfferId];
}

class DeleteApplyOfferEvent extends OfferEvent {
  final String applyOfferId;
  DeleteApplyOfferEvent(this.applyOfferId);
  @override
  List<Object?> get props => [applyOfferId];
}

class ApplyOfferEvent extends OfferEvent {
  final double amount;
  final String duration;
  final String description;
  final int userId;
  final int projectId;

  ApplyOfferEvent(this.amount, this.duration, this.description, this.userId, this.projectId);
  @override
  List<Object?> get props => [amount, duration, description, userId, projectId];
}