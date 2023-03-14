import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/app_images.dart';

class PasswordStateIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final bool showPassword;

  const PasswordStateIcon({
    Key? key,
    required this.onPressed,
    required this.showPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        showPassword ? SvgImages.showPassword : SvgImages.hidePassword,
        width: 22.w,
      ),
    );
  }
}
