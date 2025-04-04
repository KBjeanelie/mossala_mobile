// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] is String ? json['name'] as String : "",
      description: json['description'] is String ? json['description'] as String : "",
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      address: json['adress'] is String ? json['adress'] as String : "",
      isClosed: json['is_closed'] as bool? ?? false,
      createdAt: json['create_at'] is String ? json['created_at'] as String : "",
      owner: (json['owner'] as num?)?.toInt() ?? 0,
      assignedFreelancer: (json['assigned_freelancer'] as num?)?.toInt() ?? 0,
      specialty: (json['specialty'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt() ?? 0)
          .toList() ?? [],
      images: json['images'] as List<dynamic>? ?? [],
      uploadedImages: json['uploaded_images'] as List<dynamic>? ?? [],

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
