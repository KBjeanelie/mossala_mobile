import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final int amount;
  final String address;
  final bool isClosed;
  final String createdAt;
  final int owner;
  final int assignedFreelancer;
  final List<dynamic> specialty;
  final List<dynamic> images;
  final List<dynamic> uploadedImages;

  const ProjectEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.address,
    required this.isClosed,
    required this.createdAt,
    required this.owner,
    required this.assignedFreelancer,
    required this.specialty,
    required this.images,
    required this.uploadedImages,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    amount,
    address,
    isClosed,
    createdAt,
    owner,
    assignedFreelancer,
    specialty,
    images,
    uploadedImages,
  ];
}