import 'package:company_task/core/errors/failure.dart';
import 'package:company_task/features/companies/data/models/cities_model.dart';
import 'package:company_task/features/companies/data/models/companies_response_model.dart';
import 'package:company_task/features/companies/data/models/sub_categoreis.dart';
import 'package:dartz/dartz.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, List<CityModel>>> getCities();

  Future<Either<Failure, List<SubCategoryModel>>> getSubCategories();

  Future<Either<Failure, CompaniesResponseModel>> filterCompanies({
    required List<int> subCategories,
    required int cityId,
    required String type,
    String? search,
    int page = 1,
  });
}
