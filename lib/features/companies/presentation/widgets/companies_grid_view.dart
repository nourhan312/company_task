import 'package:company_task/features/companies/domain/Entities/companies_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'company_grid_item.dart';

class CompaniesGridView extends StatelessWidget {
  final List<CompanyEntity> companies;

  const CompaniesGridView({super.key, required this.companies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // shrinkWrap: true,
      //  physics: const NeverScrollableScrollPhysics(),
      itemCount: companies.length,
      itemBuilder: (_, index) => CompanyGridItem(company: companies[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 16.h,

        childAspectRatio: 0.8,
      ),
    );
  }
}
