import 'package:company_task/core/extensions/context_extensions.dart';
import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:company_task/core/theme/app_strings.dart';
import 'package:company_task/core/theme/app_textstyles.dart';
import 'package:company_task/features/companies/presentation/cubits/companies_cubit.dart';
import 'package:company_task/features/companies/presentation/widgets/custom_dropdown_menu.dart';
import 'package:company_task/features/companies/presentation/widgets/custom_elevated_button.dart';
import 'package:company_task/features/companies/presentation/widgets/custom_filter_chip.dart';
import 'package:company_task/features/companies/presentation/widgets/filter_chip_skeleton_item.dart';
import 'package:flutter/material.dart';
import 'package:company_task/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterMenu extends StatefulWidget {
  const FilterMenu({super.key});

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  String selectedServiceProvider = '';
  List<int> selectedSubCategories = [];
  int? selectedCityId;

  final List<String> serviceProviders = [
    AppStrings.engineeringOffices,
    AppStrings.individuals,
  ];

  void _resetFilters() {
    setState(() {
      selectedServiceProvider = '';
      selectedSubCategories.clear();
      selectedCityId = null;
    });

    final cubit = context.read<CompaniesCubit>();
    cubit.filterCompanies();
    Navigator.pop(context);
  }

  void _onServiceProviderSelected(String provider, bool isSelected) {
    setState(() {
      selectedServiceProvider = isSelected ? provider : '';
    });
  }

  void _onSubCategorySelected(int id, bool isSelected) {
    setState(() {
      isSelected
          ? selectedSubCategories.add(id)
          : selectedSubCategories.remove(id);
    });
  }

  void _applyFilters(CompaniesCubit cubit) {
    final hasSubCategories = selectedSubCategories.isEmpty
        ? null
        : selectedSubCategories;
    final selectedCity = selectedCityId;
    final type = switch (selectedServiceProvider) {
      AppStrings.engineeringOffices => 'office',
      AppStrings.individuals => 'person',
      _ => '',
    };

    cubit.filterCompanies(
      subCategories: hasSubCategories,
      cityId: selectedCity,
      type: type.isEmpty ? null : type,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompaniesCubit>();

    return Container(
      padding: context.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.symmetric(horizontal: BorderSide(color: AppColors.grey)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 6.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: AppColors.anotherGray,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          18.h.boxH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.classificationTitle,
                style: AppTextStyles.cairo16w600.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: _resetFilters,
                child: Text(
                  AppStrings.clearAll,
                  style: AppTextStyles.cairo16w500.copyWith(
                    color: AppColors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          24.h.boxH,
          _sectionTitle(AppStrings.serviceProvider),
          16.h.boxH,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: serviceProviders.map((provider) {
              return CustomFilterChip(
                label: provider,
                selected: selectedServiceProvider == provider,
                onSelected: (selected) =>
                    _onServiceProviderSelected(provider, selected),
              );
            }).toList(),
          ),
          24.h.boxH,
          _sectionTitle(AppStrings.services),
          16.h.boxH,
          cubit.subCategories.isEmpty
              ? Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: List.generate(
                    6,
                    (_) => const FilterChipSkeletonItem(),
                  ),
                )
              : Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: cubit.subCategories.map((subCategory) {
                    return CustomFilterChip(
                      label: subCategory.name,
                      selected: selectedSubCategories.contains(subCategory.id),
                      onSelected: (selected) =>
                          _onSubCategorySelected(subCategory.id, selected),
                    );
                  }).toList(),
                ),
          24.h.boxH,
          _sectionTitle(AppStrings.city),
          16.h.boxH,
          cubit.cities.isEmpty
              ? Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                )
              : CustomDropdownMenu<int>(
                  value: selectedCityId,
                  items: cubit.cities.map((city) => city.id).toList(),
                  hint: AppStrings.citySelection,
                  onChanged: (newValue) =>
                      setState(() => selectedCityId = newValue),
                  itemLabelBuilder: (cityId) =>
                      cubit.cities.firstWhere((c) => c.id == cityId).name,
                ),
          32.h.boxH,
          Padding(
            padding: context.symmetric(horizontal: 16.w),
            child: CustomElevatedButton(
              onPressed: () => _applyFilters(cubit),
              text: AppStrings.apply,
            ),
          ),
          16.h.boxH,
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Text(
    title,
    style: AppTextStyles.cairo16w500.copyWith(color: AppColors.black),
  );
}
