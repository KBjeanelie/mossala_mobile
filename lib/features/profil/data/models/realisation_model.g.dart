// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealisationModel _$RealisationModelFromJson(Map<String, dynamic> json) =>
    RealisationModel(
      id: (json['id'] as num).toInt(),
      realisationName: json['realisationName'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      image: json['image'] as String,
      user: (json['user'] as num).toInt(),
    );

Map<String, dynamic> _$RealisationModelToJson(RealisationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'realisationName': instance.realisationName,
      'description': instance.description,
      'date': instance.date,
      'image': instance.image,
      'user': instance.user,
    };
