class ExperienceEntity {
  final int id;
  final String title;
  final String company;
  final String startDate;
  final String endDate;
  final String description;
  final int user;

  const ExperienceEntity({
    required this.id,
    required this.title,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.user,
  });
}
