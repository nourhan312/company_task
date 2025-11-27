import 'package:company_task/core/api/api_consumer.dart';
import 'package:company_task/core/api/dio_consumer.dart';
import 'package:company_task/features/companies/data/repos/companies_repository.dart';
import 'package:company_task/features/companies/data/repos/companies_repository_impl.dart';
import 'package:company_task/features/companies/presentation/cubits/companies_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() async {
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  // Repositories
  sl.registerLazySingleton<CompaniesRepository>(
    () => CompaniesRepositoryImpl(apiConsumer: sl()),
  );

  // Cubit
  sl.registerFactory(() => CompaniesCubit(companiesRepository: sl()));
}
