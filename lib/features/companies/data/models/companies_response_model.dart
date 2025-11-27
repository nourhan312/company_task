import 'package:company_task/features/companies/data/models/companies_model.dart';
import 'package:company_task/features/companies/data/models/pagination_model.dart';

class CompaniesResponseModel {
  final List<CompanyModel> companies;
  final PaginationModel pagination;

  CompaniesResponseModel({required this.companies, required this.pagination});

  factory CompaniesResponseModel.fromJson(Map<String, dynamic> json) {
    return CompaniesResponseModel(
      companies:
          (json['data'] as List<dynamic>?)
              ?.map((e) => CompanyModel.fromJson(e))
              .toList() ??
          [],
      pagination: PaginationModel.fromJson(json['pagination']),
    );
  }
}
