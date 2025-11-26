import 'package:company_task/core/extensions/context_extensions.dart';
import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:company_task/core/theme/app_strings.dart';
import 'package:company_task/core/theme/app_textstyles.dart';
import 'package:company_task/features/companies/presentation/cubits/companies_cubit.dart';
import 'package:company_task/features/companies/presentation/widgets/custom_dropdown_menu.dart';
import 'package:company_task/features/companies/presentation/widgets/custom_elevated_button.dart';
import 'package:company_task/features/companies/presentation/widgets/custom_filter_chip.dart';
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
  String selectedServiceProvider = AppStrings.engineeringOffices;
  List<int> selectedSubCategories = [];
  int? selectedCityId;

  final List<String> serviceProviders = [
    AppStrings.engineeringOffices,
    AppStrings.individuals,
  ];

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
                onPressed: () {
                  setState(() {
                    selectedServiceProvider = "";
                    selectedSubCategories = [];
                    selectedCityId = null;
                  });
                },
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
          Text(
            AppStrings.serviceProvider,
            style: AppTextStyles.cairo16w500.copyWith(color: AppColors.black),
          ),
          16.h.boxH,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: serviceProviders.map((provider) {
              return CustomFilterChip(
                label: provider,
                selected: selectedServiceProvider == provider,
                onSelected: (selected) {
                  setState(() {
                    selectedServiceProvider = selected ? provider : "";
                  });
                },
              );
            }).toList(),
          ),
          24.h.boxH,
          Text(
            AppStrings.services,
            style: AppTextStyles.cairo16w500.copyWith(color: AppColors.black),
          ),
          16.h.boxH,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: cubit.subCategories.map((subCategory) {
              return CustomFilterChip(
                label: subCategory.name,
                selected: selectedSubCategories.contains(subCategory.id),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedSubCategories.add(subCategory.id);
                    } else {
                      selectedSubCategories.remove(subCategory.id);
                    }
                  });
                },
              );
            }).toList(),
          ),
          24.h.boxH,
          Text(
            AppStrings.city,
            style: AppTextStyles.cairo16w500.copyWith(color: AppColors.black),
          ),
          16.h.boxH,
          CustomDropdownMenu<int>(
            value: selectedCityId,
            items: cubit.cities.map((city) => city.id).toList(),
            hint: AppStrings.citySelection,
            onChanged: (newValue) {
              setState(() {
                selectedCityId = newValue;
              });
            },
            itemLabelBuilder: (cityId) {
              final city = cubit.cities.firstWhere((c) => c.id == cityId);
              return city.name;
            },
          ),
          32.h.boxH,
          Padding(
            padding: context.symmetric(horizontal: 16.w),
            child: CustomElevatedButton(
              onPressed: () {
                String type = '';
                if (selectedServiceProvider == AppStrings.engineeringOffices) {
                  type = 'office';
                } else if (selectedServiceProvider == AppStrings.individuals) {
                  type = 'person';
                }

                cubit.filterCompanies(
                  subCategories: selectedSubCategories,
                  cityId: selectedCityId ?? 0,
                  type: type,
                );

                Navigator.pop(context);
              },
              text: AppStrings.apply,
            ),
          ),
          16.h.boxH,
        ],
      ),
    );
  }
}
