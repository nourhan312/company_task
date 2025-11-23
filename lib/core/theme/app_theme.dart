import 'package:company_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_textstyles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightThemeMode() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.grey,
        titleTextStyle: AppTextStyles.cairo16w400,
        toolbarTextStyle: AppTextStyles.cairo16w400,
        toolbarHeight: 60.h,
        iconTheme: IconThemeData(color: AppColors.iconColor, size: 24.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
        ),
      ),
      fontFamily: 'Cairo',
      textTheme: TextTheme(
        displayLarge: AppTextStyles.cairo24w600,
        displayMedium: AppTextStyles.cairo24w500,
        displaySmall: AppTextStyles.cairo24w400,
        headlineMedium: AppTextStyles.cairo16w600,
        titleLarge: AppTextStyles.cairo16w500,
        bodyLarge: AppTextStyles.cairo16w400,
      ),
    );
  }
}
