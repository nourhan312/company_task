import 'package:company_task/core/extensions/context_extensions.dart';
import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:company_task/features/companies/presentation/widgets/companies_list_view.dart';
import 'package:company_task/features/companies/presentation/widgets/company_grid_skeleton_item.dart';
import 'package:company_task/features/companies/presentation/widgets/company_list_skeleton_item.dart';
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
              final cubit = context.read<CompaniesCubit>();
              final isListView = state is SwitchViewState
                  ? state.isList
                  : cubit.isListView;

              if (state is FilterCompaniesLoading) {
                return Expanded(
                  child: isListView
                      ? ListView.builder(
                          itemCount: 6,
                          itemBuilder: (_, index) =>
                              const CompanyListSkeletonItem(),
                        )
                      : GridView.builder(
                          itemCount: 6,
                          itemBuilder: (_, index) =>
                              const CompanyGridSkeletonItem(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 16.h,

                                childAspectRatio: 0.8,
                              ),
                        ),
                );
              } else if (state is FilterCompaniesError) {
                return Center(child: Text(state.message));
              }

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
