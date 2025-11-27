import 'package:cached_network_image/cached_network_image.dart';
import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:company_task/features/companies/data/models/companies_model.dart';
import 'package:company_task/features/companies/presentation/cubits/companies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_textstyles.dart';

class CompaniesListItem extends StatelessWidget {
  final CompanyModel company;

  const CompaniesListItem({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.all(12.w),
      margin: EdgeInsets.only(bottom: 16.h),
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
              imageUrl: company.image,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.cairo16w600.copyWith(fontSize: 15.sp),
                ),
                4.h.boxH,

                Text(
                  company.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.cairo16w400.copyWith(fontSize: 12.sp),
                ),

                6.h.boxH,

                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 20.sp,
                          color: index < company.rating
                              ? Colors.amber
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                    4.w.boxW,
                    Icon(Icons.location_on, color: Colors.grey, size: 18.sp),
                    8.w.boxW,

                    Expanded(
                      child: Text(
                        company.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cairo16w400.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
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
              icon: company.isFavourite
                  ? SvgPicture.asset(
                      AppAssets.heartIcon,
                      height: 20.h,
                      width: 20.w,
                      color: Colors.red,
                    )
                  : SvgPicture.asset(
                      AppAssets.heartIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
              onPressed: () {
                context.read<CompaniesCubit>().toggleFavourite(company.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
