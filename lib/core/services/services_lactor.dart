import 'package:company_task/core/api/api_consumer.dart';
import 'package:company_task/core/api/dio_consumer.dart';
import 'package:company_task/features/companies/data/repos/companies_repo_impl.dart';
import 'package:company_task/features/companies/domain/repositories/companies_repository.dart';
import 'package:company_task/features/companies/domain/usecases/cities_usecases%20.dart';
import 'package:company_task/features/companies/domain/usecases/companies_usecases.dart';
import 'package:company_task/features/companies/domain/usecases/sub_categories_usecases.dart';
import 'package:company_task/features/companies/presentation/cubits/companies_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() async {
  // External
  sl.registerLazySingleton(() => Dio());

  // Data sources
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  // Repositories
  sl.registerLazySingleton<CompaniesRepository>(
    () => CompaniesRepoImpl(apiConsumer: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCitiesUseCase(sl()));
  sl.registerLazySingleton(() => GetSubCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => FilterCompaniesUseCase(sl()));

  // Cubit
  sl.registerFactory(
    () => CompaniesCubit(
      getCitiesUseCase: sl(),
      getSubCategoriesUseCase: sl(),
      filterCompaniesUseCase: sl(),
    ),
  );
}
