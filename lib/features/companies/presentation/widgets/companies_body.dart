import 'package:company_task/core/extensions/context_extensions.dart';
import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:company_task/features/companies/presentation/widgets/company_grid_item.dart';
import 'package:company_task/features/companies/presentation/widgets/no_search_body.dart';
import 'package:company_task/features/companies/presentation/widgets/search_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

          Expanded(child: CompaniesGridView()),
        ],
      ),
    );
  }
}
