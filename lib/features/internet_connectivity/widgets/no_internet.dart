import 'package:company_task/core/extensions/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/app_textstyles.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/no_internet.jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        50.h.boxH,
        Text(
          "Please check your internet settings\nand try again.",
          style: AppTextStyles.cairo16w600,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
