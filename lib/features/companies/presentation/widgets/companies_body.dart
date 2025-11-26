import 'package:company_task/core/extensions/context_extensions.dart';
import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:company_task/features/companies/presentation/widgets/companies_list_view.dart';
import 'package:company_task/features/companies/presentation/widgets/search_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/companies_cubit.dart';
import '../cubits/companies_state.dart';
import 'companies_grid_view.dart';

class CompaniesBody extends StatelessWidget {
  const CompaniesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        children: [
          SearchPart(),
          24.h.boxH,

          BlocBuilder<CompaniesCubit, CompaniesState>(
            builder: (context, state) {
              if (state is FilterCompaniesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FilterCompaniesError) {
                return Center(child: Text(state.message));
              }

              final cubit = context.read<CompaniesCubit>();

              final isListView = state is SwitchViewState
                  ? state.isList
                  : cubit.isListView;

              return Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(scale: animation, child: child),
                    );
                  },
                  child: isListView
                      ? CompaniesListView(
                          key: const ValueKey('list'),
                          companies: cubit.companies,
                        )
                      : CompaniesGridView(
                          key: const ValueKey('grid'),
                          companies: cubit.companies,
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
