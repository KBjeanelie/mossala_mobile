
import 'package:json_annotation/json_annotation.dart';
import 'package:mossala_mobile/features/offers/domain/entities/offer.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel extends OfferEntity {
  const OfferModel({
    required super.id, 
    required super.amount, 
    required super.duration, 
    required super.description, 
    required super.applicationDate, 
    required super.user, 
    required super.project
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
  
}