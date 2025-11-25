import 'package:company_task/core/errors/failure.dart';
import 'package:company_task/features/companies/domain/Entities/cities_entities.dart';
import 'package:company_task/features/companies/domain/repositories/companies_repository.dart';
import 'package:dartz/dartz.dart';

class GetCitiesUseCase {
  final CompaniesRepository repository;

  GetCitiesUseCase(this.repository);

  Future<Either<Failure, List<CityEntity>>> call() {
    return repository.getCities();
  }
}