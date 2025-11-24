import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_textstyles.dart';

class CompanyGridItem extends StatelessWidget {
  const CompanyGridItem({super.key});

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
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: '',
              height: 105.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                height: 90.h,
                width: double.infinity,
                color: AppColors.anotherGray,
              ),
              errorWidget: (_, __, ___) => Container(
                height: 90.h,
                color: Colors.grey.shade300,
                child: const Icon(Icons.error),
              ),
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Text(
                  'شركة التميز للديكور',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cairo16w500.copyWith(fontSize: 13.sp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(
                      'assets/icons/heart.svg',
                      height: 18.h,
                      width: 18.w,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),

          Text(
            'خلافاَ للإعتقاد السائد فإن لوريم إيبسوم ليس نصاَ عشوائياً، بل إن له جذور في الأدب اللاتيني',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.cairo16w400.copyWith(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
