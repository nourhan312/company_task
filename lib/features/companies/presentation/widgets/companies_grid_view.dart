import 'package:company_task/features/companies/data/models/companies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'company_grid_item.dart';

class CompaniesGridView extends StatelessWidget {
  final List<CompanyModel> companies;
  final bool isLoadingMore;

  const CompaniesGridView({
    super.key,
    required this.companies,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // shrinkWrap: true,
      //  physics: const NeverScrollableScrollPhysics(),
      itemCount: companies.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (_, index) {
        if (index == companies.length) {
          return const Center(child: CircularProgressIndicator());
        }
        return CompanyGridItem(company: companies[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 16.h,

        childAspectRatio: 0.8,
      ),
    );
  }
}
