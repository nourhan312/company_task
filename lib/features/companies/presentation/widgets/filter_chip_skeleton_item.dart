import 'package:company_task/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FilterChipSkeletonItem extends StatelessWidget {
  const FilterChipSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        padding: context.symmetric(horizontal: 22.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Bone.text(words: 1, fontSize: 14.sp),
      ),
    );
  }
}
