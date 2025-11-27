import 'package:company_task/core/theme/app_strings.dart';
import 'package:company_task/features/companies/presentation/cubits/companies_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: AppStrings.searchTitle,
        prefixIcon: Icon(CupertinoIcons.search),
      ),
      onChanged: (value) {
        final cubit = context.read<CompaniesCubit>();
        cubit.searchCompanies(value);
      },
    );
  }
}