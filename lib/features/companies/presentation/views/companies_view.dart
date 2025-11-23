import 'package:flutter/material.dart';

import '../../../../core/theme/app_strings.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class CompaniesView extends StatelessWidget {
  const CompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.appbarTitle, onMenuPressed: () {}),
    );
  }
}
