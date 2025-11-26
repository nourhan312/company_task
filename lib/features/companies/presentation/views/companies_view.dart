import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_lactor.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../cubits/companies_cubit.dart';
import '../widgets/companies_body.dart';

class CompaniesView extends StatelessWidget {
  const CompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CompaniesCubit>(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<CompaniesCubit>();
          cubit.filterCompanies(
            subCategories: [1, 2, 3],
            cityId: 2,
            type: 'person',
          );
          return Scaffold(
            appBar: CustomAppBar(
              title: AppStrings.appbarTitle,
              onMenuPressed: () {
                context.read<CompaniesCubit>().switchToGrid();
              },
            ),
            body: CompaniesBody(),
          );
        },
      ),
    );
  }
}
