import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/project.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.id,
    required super.name,
    required super.description,
    required super.amount,
    required super.address,
    required super.isClosed,
    required super.createdAt,
    required super.owner,
    required super.assignedFreelancer,
    required List<int> super.specialty,
    required super.images,
    required super.uploadedImages,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);

}
