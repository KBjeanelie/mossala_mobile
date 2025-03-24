import 'package:equatable/equatable.dart';

class QuarterEntity extends Equatable{
  final int id;
  final String name;

  const QuarterEntity({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}