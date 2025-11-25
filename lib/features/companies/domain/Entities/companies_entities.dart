class CompanyEntity {
  final int id;
  final String name;
  final String image;
  final String type;
  final String description;
  final bool isFavourite;
  final double rating;
  final String location;

  CompanyEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.description,
    required this.isFavourite,
    required this.rating,
    required this.location,
  });
}