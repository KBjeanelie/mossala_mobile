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
    required String adress,
    required String startDate,
    required String endDate,
    required String status,
    required bool isClosed,
    required int owner,
    required int assignedFreelancer,
    required List<int> specialty,
  }) : super(
          id: id,
          name: name,
          description: description,
          amount: amount,
          adress: adress,
          startDate: startDate,
          endDate: endDate,
          status: status,
          isClosed: isClosed,
          owner: owner,
          assignedFreelancer: assignedFreelancer,
          specialty: specialty,
        );

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
