import 'package:company_task/core/errors/failure.dart';
import 'package:company_task/features/companies/domain/Entities/sub_categoreis_entities.dart';
import 'package:company_task/features/companies/domain/repositories/companies_repository.dart';
import 'package:dartz/dartz.dart';

class GetSubCategoriesUseCase {
  final CompaniesRepository repository;

  GetSubCategoriesUseCase(this.repository);

  Future<Either<Failure, List<SubCategoryEntity>>> call() {
    return repository.getSubCategories();
  }
}