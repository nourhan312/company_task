import 'package:company_task/core/theme/app_colors.dart';
import 'package:company_task/features/companies/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'filter_menu.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.r,
      children: [
        Expanded(child: SearchTextField()),
        Container(
          decoration: BoxDecoration(
            color: AppColors.darkGray,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: IconButton(
            icon: SvgPicture.asset('assets/icons/filter.svg'),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: const FilterMenu(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
