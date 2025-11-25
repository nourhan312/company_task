import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/companies_repository.dart';
import '../models/cities_model.dart';
import '../models/companies_model.dart';
import '../models/sub_categoreis.dart';

class CompaniesRepoImpl implements CompaniesRepository {
  final ApiConsumer apiConsumer;

  CompaniesRepoImpl({required this.apiConsumer});

  @override
  Future<Either<Failure, List<CityModel>>> getCities() async {
    try {
      final response = await apiConsumer.get(EndPoints.cities);
      final List<dynamic> data = response;
      final cities = data.map((e) => CityModel.fromJson(e)).toList();
      return Right(cities);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<SubCategoreisModel>>> getSubCategories() async {
    try {
      final response = await apiConsumer.get(EndPoints.subCategories);
      final List<dynamic> data = response;
      final subCategories = data
          .map((e) => SubCategoreisModel.fromJson(e))
          .toList();
      return Right(subCategories);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<CompaniesModel>>> filterCompanies({
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

      final List<dynamic> data = response;
      final companies = data.map((e) => CompaniesModel.fromJson(e)).toList();
      return Right(companies);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.errorMessage));
    }
  }
}
