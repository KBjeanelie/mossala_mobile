// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      duration: json['duration'] as String? ?? "",
      description: json['description'] as String? ?? "",
      applicationDate: DateTime.parse(json['application_date'] as String),
      user: (json['user'] as num).toInt(),
      project: (json['project'] as num).toInt(),
    );

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'duration': instance.duration,
      'description': instance.description,
      'applicationDate': instance.applicationDate.toIso8601String(),
      'user': instance.user,
      'project': instance.project,
    };
