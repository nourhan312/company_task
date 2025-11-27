import 'package:company_task/features/companies/data/models/companies_model.dart';
import 'package:flutter/material.dart';

import 'companies_list_item.dart';

class CompaniesListView extends StatelessWidget {
  final List<CompanyModel> companies;
  final bool isLoadingMore;

  const CompaniesListView({
    super.key,
    required this.companies,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companies.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (_, index) {
        if (index == companies.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return CompaniesListItem(company: companies[index]);
      },
    );
  }
}
