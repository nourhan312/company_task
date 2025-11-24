import 'package:company_task/core/extensions/context_extensions.dart';
import 'package:company_task/core/theme/app_colors.dart';
import 'package:company_task/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    super.key,
    required this.label,
    required this.onSelected,
    required this.selected,
  });

  final String label;
  final Function(bool) onSelected;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
        style: AppTextStyles.cairo16w500.copyWith(fontSize: 14.sp),
      ),
      onSelected: onSelected,
      selected: selected,
      showCheckmark: false,
      selectedColor: AppColors.primaryColor.withValues(alpha: 0.2),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: selected ? AppColors.primaryColor : AppColors.grey,
        ),
      ),
      padding: context.symmetric(horizontal: 22.w, vertical: 8.h),
    );
  }
}
