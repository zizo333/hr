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
      padding: EdgeInsets.only(bottom: bottomPadding?.h ?? 10.h),
      child: IconButton(
        onPressed: onTap,
        iconSize: 40.w,
        icon: Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor ??
                Theme.of(context).colorScheme.secondary.withOpacity(0.0824),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              height: size?.w ?? 20.w,
              width: size?.w ?? 20.w,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
