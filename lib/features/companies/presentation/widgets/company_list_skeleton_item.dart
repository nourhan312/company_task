import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/extensions/context_extensions.dart';

class CompanyListSkeletonItem extends StatelessWidget {
  const CompanyListSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Bone.square(size: 90.w, borderRadius: BorderRadius.circular(12.r)),
          10.w.boxW,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Bone.text(words: 2, fontSize: 15.sp),
                4.h.boxH,
                Bone.multiText(lines: 2, fontSize: 12.sp),
                6.h.boxH,
                Row(
                  children: [
                    Bone.icon(size: 20.sp),
                    4.w.boxW,
                    Bone.icon(size: 20.sp),
                    4.w.boxW,
                    Bone.icon(size: 20.sp),
                    4.w.boxW,
                    Bone.icon(size: 20.sp),
                    4.w.boxW,
                    Bone.icon(size: 20.sp),
                    8.w.boxW,
                    Bone.icon(size: 18.sp),
                    4.w.boxW,
                    Bone.text(words: 1, fontSize: 12.sp),
                  ],
                ),
              ],
            ),
          ),
          10.w.boxW,
          Bone.circle(size: 36.w),
        ],
      ),
    );
  }
}
