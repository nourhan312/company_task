import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:company_task/core/theme/app_colors.dart';
import 'package:company_task/core/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_textstyles.dart';

class NoSearchBody extends StatelessWidget {
  const NoSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        //crossAxisAlignment: .center,
        spacing: 6.h,
        children: [
          SvgPicture.asset(fit: BoxFit.cover, 'assets/images/no_search.svg'),
          Text(AppStrings.noResult, style: AppTextStyles.cairo16w500),
          Text(
            AppStrings.tryAgain,
            style: AppTextStyles.cairo16w400.copyWith(
              color: AppColors.anotherGray,
              fontSize: 14.sp,
            ),
          ),
          8.h.boxH,
          Container(
            width: 150.w,
            height: 45.w,

            decoration: BoxDecoration(
              color: AppColors.primaryColor,

              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: Text(
                AppStrings.searchAgain,
                style: AppTextStyles.cairo16w400.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
