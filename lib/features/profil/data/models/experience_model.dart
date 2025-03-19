import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/experience.dart';

part 'experience_model.g.dart';

@JsonSerializable()
class ExperienceModel extends ExperienceEntity {
  const ExperienceModel({
    required super.id,
    required super.title,
    required super.company,
    required super.startDate,
    required super.endDate,
    required super.description,
    required super.user,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => _$ExperienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceModelToJson(this);
}
