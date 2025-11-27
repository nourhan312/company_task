class CompanyModel {
  final int id;
  final String name;
  final String image;
  final String type;
  final String description;
  final bool isFavourite;
  final double rating;
  final String location;

  CompanyModel({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.description,
    required this.isFavourite,
    required this.rating,
    required this.location,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      image: json['img'] ?? "",
      type: json['type'] ?? "",
      description: json['desc'] ?? "",
      isFavourite: json['fav'] ?? false,
      rating: double.tryParse(json['avg_rates']?.toString() ?? "0") ?? 0.0,
      location: json['location'] ?? "",
    );
  }
}
