class RealisationEntity {
  final int id;
  final String realisationName;
  final String description;
  final String date;
  final String image;
  final int user;

  const RealisationEntity({
    required this.id,
    required this.realisationName,
    required this.description,
    required this.date,
    required this.image,
    required this.user,
  });
}
