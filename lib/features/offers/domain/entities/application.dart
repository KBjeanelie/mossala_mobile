import 'package:equatable/equatable.dart';
import 'package:mossala_mobile/features/offers/data/models/offer_model.dart';
import 'package:mossala_mobile/features/offers/data/models/project_model.dart';
import 'package:mossala_mobile/features/offers/domain/entities/offer.dart';
import 'package:mossala_mobile/features/offers/domain/entities/project.dart';

class ProjectWithApplicationsEntity extends Equatable {
  final ProjectEntity project;
  final List<OfferEntity> applications;

  const ProjectWithApplicationsEntity({
    required this.project,
    required this.applications,
  });

  factory ProjectWithApplicationsEntity.fromJson(Map<String, dynamic> json) {
    return ProjectWithApplicationsEntity(
      project: ProjectModel.fromJson(json['project']),
      applications: (json['applications'] as List)
          .map((app) => OfferModel.fromJson(app))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [project, applications];
}