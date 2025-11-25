
import 'dart:convert';

import 'package:company_task/core/api/api_consumer.dart';
import 'package:company_task/core/api/end_points.dart';
import 'package:company_task/core/errors/exceptions.dart';
import 'package:company_task/core/errors/failure.dart';
import 'package:company_task/features/companies/data/models/cities_model.dart';
import 'package:company_task/features/companies/data/models/companies_model.dart';
import 'package:company_task/features/companies/data/models/sub_categoreis.dart';
import 'package:company_task/features/companies/domain/Entities/cities_entities.dart';
import 'package:company_task/features/companies/domain/Entities/companies_entities.dart';
import 'package:company_task/features/companies/domain/repositories/companies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/Entities/sub_categoreis_entities.dart';

class CompaniesRepoImpl implements CompaniesRepository {
  final ApiConsumer apiConsumer;

  CompaniesRepoImpl({required this.apiConsumer});

  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
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
  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategories() async {
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
  Future<Either<Failure, List<CompanyEntity>>> filterCompanies({
    required List<int> subCategories,
    required int cityId,
    required String type,
    String? search,
  }) async {
    try {
      final subCategoriesList = subCategories.map((id) => {"id": id}).toList();
      final subCategoriesString = jsonEncode(subCategoriesList);

      final response = await apiConsumer.post(
        EndPoints.filterCompanies,
        isFormData: true,
        data: {
          ApiKeys.subCategories: subCategoriesString,
          ApiKeys.cityId: cityId,
          ApiKeys.type: type,
          if (search != null) ApiKeys.search: search,
        },
      );

      final List<dynamic> data = response['data'];
      final companies = data.map((e) => CompanyModel.fromJson(e)).toList();
      return Right(companies);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    }
  }
}