import 'package:get_it/get_it.dart';

import '../../features/companies/presentation/cubits/companies_cubit.dart';

final sl = GetIt.instance;
Future<void> setup() async {
  //cubits
  sl.registerFactory<CompaniesCubit>(() => CompaniesCubit());
}
