// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toInt(),
      adress: json['adress'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      status: json['status'] as String,
      isClosed: json['isClosed'] as bool,
      owner: (json['owner'] as num).toInt(),
      assignedFreelancer: (json['assignedFreelancer'] as num).toInt(),
      specialty: (json['specialty'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'amount': instance.amount,
      'adress': instance.adress,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'isClosed': instance.isClosed,
      'owner': instance.owner,
      'assignedFreelancer': instance.assignedFreelancer,
      'specialty': instance.specialty,
    };
