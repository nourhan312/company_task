import 'package:company_task/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CompanyGridSkeletonItem extends StatelessWidget {
  const CompanyGridSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      borderOnForeground: false,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Bone.square(size: 105.h, borderRadius: BorderRadius.circular(12.r)),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: context.all(8.w),
                  child: Bone.text(words: 2, fontSize: 13.sp),
                ),
              ),
              Padding(
                padding:  context.all(6.0),
                child: Bone.circle(size: 32.w),
              ),
            ],
          ),
          Padding(
            padding: context.symmetric(horizontal: 8.w),
            child: Bone.multiText(lines: 2, fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
