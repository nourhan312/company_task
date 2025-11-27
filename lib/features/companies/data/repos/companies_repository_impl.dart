import 'dart:convert';

import 'package:company_task/core/api/api_consumer.dart';
import 'package:company_task/core/api/end_points.dart';
import 'package:company_task/core/errors/exceptions.dart';
import 'package:company_task/core/errors/failure.dart';
import 'package:company_task/features/companies/data/models/cities_model.dart';
import 'package:company_task/features/companies/data/models/companies_response_model.dart';
import 'package:company_task/features/companies/data/models/sub_categoreis.dart';
import 'package:company_task/features/companies/data/repos/companies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  final ApiConsumer apiConsumer;

  CompaniesRepositoryImpl({required this.apiConsumer});

  @override
  Future<Either<Failure, List<CityModel>>> getCities() async {
    try {
      final response = await apiConsumer.get(EndPoints.cities);
      final List<dynamic> data = response['data'];
      final cities = data.map((e) => CityModel.fromJson(e)).toList();
      debugPrint(cities.toString());
      return Right(cities);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<SubCategoryModel>>> getSubCategories() async {
    try {
      final response = await apiConsumer.get(EndPoints.subCategories);
      final List<dynamic> data = response['data'];
      final subCategories = data
          .map((e) => SubCategoryModel.fromJson(e))
          .toList();
      return Right(subCategories);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, CompaniesResponseModel>> filterCompanies({
    required List<int> subCategories,
    required int cityId,
    required String type,
    String? search,
    int page = 1,
  }) async {
    try {
      final subCategoriesList = subCategories.map((id) => {"id": id}).toList();
      final subCategoriesString = jsonEncode(subCategoriesList);

      final response = await apiConsumer.post(
        "${EndPoints.filterCompanies}?page=$page",
        isFormData: true,
        data: {
          ApiKeys.subCategories: subCategoriesString,
          ApiKeys.cityId: cityId,
          ApiKeys.type: type,
          if (search != null) ApiKeys.search: search,
        },
      );

      final data = response['data'];
      final companiesResponse = CompaniesResponseModel.fromJson(data);

      debugPrint(
        'Pagination - Current Page: ${companiesResponse.pagination.currentPage}',
      );
      debugPrint(
        'Pagination - Last Page: ${companiesResponse.pagination.lastPage}',
      );
      debugPrint('Pagination - Total: ${companiesResponse.pagination.total}');
      debugPrint('Companies Count: ${companiesResponse.companies.length}');

      return Right(companiesResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    }
  }
}
