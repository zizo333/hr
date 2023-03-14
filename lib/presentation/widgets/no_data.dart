import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/themes/app_colors.dart';
import '../../core/utils/app_images.dart';

class NoData extends StatelessWidget {
  final String title;
  final String? image;
  final Color? color;
  final double size;

  const NoData({
    Key? key,
    required this.title,
    this.image,
    this.color,
    this.size = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image ?? SvgImages.noData,
          width: size.w,
          height: size.w,
          color: color ?? AppColors.c707070,
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.c2D2F3A,
          ),
        )
      ],
    );
  }
}
