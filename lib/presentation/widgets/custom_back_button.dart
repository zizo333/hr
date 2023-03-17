import 'package:flutter/material.dart';
import 'package:hr/core/utils/app_images.dart';

import '../../config/routes/app_router.dart';
import 'custom_app_bar_icon.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onTap;
  final Color? bgColor;
  final Color? iconColor;
  final double size;

  const CustomBackButton({
    super.key,
    this.onTap,
    this.bgColor,
    this.iconColor,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBarIcon(
      onTap: onTap == null ? () => AppRouter.back(context) : onTap!,
      icon: SvgImages.back,
      size: size,
      bgColor: bgColor,
      iconColor: iconColor,
    );
  }
}
