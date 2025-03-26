import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/realisation.dart';

part 'realisation_model.g.dart';

@JsonSerializable()
class RealisationModel extends RealisationEntity {
  const RealisationModel({
    required super.id,
    required super.realisationName,
    required super.description,
    required super.date,
    required super.image,
    required super.user,
  });

  factory RealisationModel.fromJson(Map<String, dynamic> json) => _$RealisationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RealisationModelToJson(this);
}
