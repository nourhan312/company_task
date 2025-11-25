import 'package:company_task/features/companies/domain/Entities/sub_categoreis_entities.dart';

class SubCategoryModel extends SubCategoryEntity {
  SubCategoryModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      image: json['img'] ?? "",
    );
  }
}