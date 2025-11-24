import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'company_grid_item.dart';

class CompaniesGridView extends StatelessWidget {
  const CompaniesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // shrinkWrap: true,
      //  physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (_, index) => const CompanyGridItem(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 16.h,

        childAspectRatio: 0.8,
      ),
    );
  }
}
