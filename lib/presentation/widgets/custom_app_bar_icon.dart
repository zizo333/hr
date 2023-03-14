import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarIcon extends StatelessWidget {
  final Function() onTap;
  final String icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? size;
  final double? bottomPadding;

  const CustomAppBarIcon({
    super.key,
    required this.onTap,
    required this.icon,
    this.bgColor,
    this.iconColor,
    this.size,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding?.h ?? 4.h),
      child: IconButton(
        onPressed: onTap,
        iconSize: 40.w,
        icon: Center(
          child: SvgPicture.asset(
            icon,
            height: size?.w ?? 24.w,
            width: size?.w ?? 24.w,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
