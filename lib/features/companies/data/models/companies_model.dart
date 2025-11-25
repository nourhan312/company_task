import 'package:company_task/features/companies/domain/Entities/companies_entities.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    required super.id,
    required super.name,
    required super.image,
    required super.type,
    required super.description,
    required super.isFavourite,
    required super.rating,
    required super.location,
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