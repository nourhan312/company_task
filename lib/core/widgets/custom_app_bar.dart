import 'package:company_task/core/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuPressed;

  const CustomAppBar({super.key, required this.title, this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title),
      actions: [
        IconButton(
          onPressed: onMenuPressed ?? () {},
          icon: SvgPicture.asset(AppAssets.menuGridIcon),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
