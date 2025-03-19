import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final int amount;
  final String adress;
  final String startDate;
  final String endDate;
  final String status;
  final bool isClosed;
  final int owner;
  final int assignedFreelancer;
  final List<int> specialty;

  const ProjectEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.adress,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.isClosed,
    required this.owner,
    required this.assignedFreelancer,
    required this.specialty,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        amount,
        adress,
        startDate,
        endDate,
        status,
        isClosed,
        owner,
        assignedFreelancer,
        specialty,
      ];
}
