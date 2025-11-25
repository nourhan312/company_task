import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/cities_model.dart';
import '../../data/models/companies_model.dart';
import '../../data/models/sub_categoreis.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, List<CityModel>>> getCities();
  Future<Either<Failure, List<SubCategoreisModel>>> getSubCategories();
  Future<Either<Failure, List<CompaniesModel>>> filterCompanies({
    required List<int> subCategories,
    required int cityId,
    required String type,
    String? search,
  });
}
