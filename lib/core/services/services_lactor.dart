import 'package:company_task/core/api/api_consumer.dart';
import 'package:company_task/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


import '../../features/companies/data/repos/companies_repo_impl.dart';
import '../../features/companies/domain/repositories/companies_repository.dart';
import '../../features/companies/presentation/cubits/companies_cubit.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  // Cubits
  sl.registerFactory<CompaniesCubit>(
    () => CompaniesCubit(companiesRepository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<CompaniesRepository>(
    () => CompaniesRepoImpl(apiConsumer: sl()),
  );

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  sl.registerLazySingleton(() => Dio());
}
