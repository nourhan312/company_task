import 'dart:async';

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
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final cubit = context.read<CompaniesCubit>();
      cubit.searchCompanies(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: AppStrings.searchTitle,
        prefixIcon: Icon(CupertinoIcons.search),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  final cubit = context.read<CompaniesCubit>();
                  cubit.searchCompanies('');
                  FocusScope.of(context).unfocus();
                },
              )
            : null,
      ),
      onChanged: (value) {
        setState(() {}); 
        _onSearchChanged(value);
      },
      onSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
