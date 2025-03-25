import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/project.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required int id,
    required String name,
    required String description,
    required int amount,
    required String address,
    required bool isClosed,
    required String createdAt,
    required int owner,
    required int assignedFreelancer,
    required List<int> specialty,
    required List<dynamic> images,
    required List<dynamic> uploadedImages,
  }) : super(
    id: id,
    name: name,
    description: description,
    amount: amount,
    address: address,
    isClosed: isClosed,
    createdAt: createdAt,
    owner: owner,
    assignedFreelancer: assignedFreelancer,
    specialty: specialty,
    images: images,
    uploadedImages: uploadedImages,
  );

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);

}
