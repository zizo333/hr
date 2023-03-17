import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShadowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;

  const CustomShadowContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ??
          EdgeInsets.only(
            left: 14.w,
            right: 14.w,
            bottom: 10.h,
            top: 14.h,
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius?.r ?? 9.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.r,
            color: Theme.of(context).shadowColor,
          )
        ],
      ),
      child: child,
    );
  }
}
