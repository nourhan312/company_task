import 'package:cached_network_image/cached_network_image.dart';
import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_textstyles.dart';

class CompaniesListItem extends StatelessWidget {
  const CompaniesListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: '',
              height: 90.h,
              width: 90.w,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                height: 90.h,
                width: 90.w,
                color: AppColors.anotherGray,
              ),
              errorWidget: (_, __, ___) => Container(
                height: 90.h,
                width: 90.w,
                color: Colors.grey.shade300,
                child: const Icon(Icons.error),
              ),
            ),
          ),

          10.w.boxW,
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'مهندسة غادة محمد',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.cairo16w600.copyWith(fontSize: 15.sp),
                ),
                4.h.boxH,

                Text(
                  'خلافاً للإعتقاد السائد فإن لوريم إيبسوم ليس نصاً عشوائياً، بل إن له جذور في الأدب اللاتيني',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.cairo16w400.copyWith(fontSize: 12.sp),
                ),

                6.h.boxH,

                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) =>
                            Icon(Icons.star, size: 20.sp, color: Colors.amber),
                      ),
                    ),
                    8.w.boxW,
                    Text(
                      'الرياض',
                      style: AppTextStyles.cairo16w400.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    4.w.boxW,
                    Icon(Icons.location_on, color: Colors.grey, size: 18.sp),
                  ],
                ),
              ],
            ),
          ),

          10.w.boxW,
          Container(
            height: 36.h,
            width: 36.w,
            decoration: BoxDecoration(
              color: AppColors.grey,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                'assets/icons/heart.svg',
                height: 20.h,
                width: 20.w,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
