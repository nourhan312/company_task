
import 'package:company_task/core/errors/failure.dart';
import 'package:company_task/features/companies/domain/Entities/cities_entities.dart';
import 'package:company_task/features/companies/domain/Entities/companies_entities.dart';
import 'package:company_task/features/companies/domain/Entities/sub_categoreis_entities.dart';
import 'package:dartz/dartz.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, List<CityEntity>>> getCities();
  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategories();
  Future<Either<Failure, List<CompanyEntity>>> filterCompanies({
    required List<int> subCategories,
    required int cityId,
    required String type,
    String? search,
  });
}