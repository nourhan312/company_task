import 'package:company_task/features/companies/domain/Entities/companies_entities.dart';
import 'package:flutter/material.dart';

import 'companies_list_item.dart';

class CompaniesListView extends StatelessWidget {
  final List<CompanyEntity> companies;

  const CompaniesListView({super.key, required this.companies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companies.length,
      itemBuilder: (_, index) => CompaniesListItem(company: companies[index]),
    );
  }
}
