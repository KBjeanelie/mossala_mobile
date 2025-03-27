
import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final int id;
  final double amount;
  final String duration;
  final String description;
  final DateTime applicationDate;
  final int user;
  final int project;

  const OfferEntity({
    required this.id,
    required this.amount,
    required this.duration,
    required this.description,
    required this.applicationDate,
    required this.user,
    required this.project,
  });
  
  @override
  List<Object?> get props => [
    id,
    amount,
    duration,
    description,
    applicationDate,
    user,
    project,
  ];
}