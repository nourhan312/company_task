import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:company_task/core/theme/app_colors.dart';
import 'package:company_task/core/theme/app_textstyles.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String hint;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemLabelBuilder;

  const CustomDropdownMenu({
    super.key,
    required this.value,
    required this.items,
    required this.hint,
    required this.onChanged,
    required this.itemLabelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          hint: Text(
            hint,
            style: AppTextStyles.cairo16w500.copyWith(
              color: AppColors.anotherGray,
              fontSize: 14.sp,
            ),
          ),
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.anotherGray),
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(itemLabelBuilder(item)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
