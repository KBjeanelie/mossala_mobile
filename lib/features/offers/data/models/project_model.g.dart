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
      address: json['address'] as String,
      isClosed: json['isClosed'] as bool,
      createdAt: json['createdAt'] as String,
      owner: (json['owner'] as num).toInt(),
      assignedFreelancer: (json['assignedFreelancer'] as num).toInt(),
      specialty: (json['specialty'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      images: json['images'] as List<dynamic>,
      uploadedImages: json['uploadedImages'] as List<dynamic>,
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'amount': instance.amount,
      'address': instance.address,
      'isClosed': instance.isClosed,
      'createdAt': instance.createdAt,
      'owner': instance.owner,
      'assignedFreelancer': instance.assignedFreelancer,
      'specialty': instance.specialty,
      'images': instance.images,
      'uploadedImages': instance.uploadedImages,
    };
