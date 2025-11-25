
import 'package:company_task/core/errors/failure.dart';
import 'package:company_task/features/companies/domain/Entities/companies_entities.dart';
import 'package:company_task/features/companies/domain/repositories/companies_repository.dart';
import 'package:dartz/dartz.dart';

class FilterCompaniesUseCase {
  final CompaniesRepository repository;

  FilterCompaniesUseCase(this.repository);

  Future<Either<Failure, List<CompanyEntity>>> call({
    required List<int> subCategories,
    required int cityId,
    required String type,
    String? search,
  }) {
    return repository.filterCompanies(
      subCategories: subCategories,
      cityId: cityId,
      type: type,
      search: search,
    );
  }
}