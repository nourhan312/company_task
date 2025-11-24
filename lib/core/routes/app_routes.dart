import 'package:company_task/core/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../features/companies/presentation/views/companies_view.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.companies:
        return MaterialPageRoute(builder: (context) => const CompaniesView());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Something went wrong'))),
        );
    }
  }
}
