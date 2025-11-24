import 'package:flutter/material.dart';

import 'companies_list_item.dart';

class CompaniesListView extends StatelessWidget {
  const CompaniesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (_, index) => const CompaniesListItem(),
    );
  }
}
