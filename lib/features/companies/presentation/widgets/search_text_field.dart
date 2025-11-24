import 'package:company_task/core/theme/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: AppStrings.searchTitle,
        prefixIcon: Icon(CupertinoIcons.search),
      ),
    );
  }
}
