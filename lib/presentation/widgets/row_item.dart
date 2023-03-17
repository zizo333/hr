import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/themes/app_colors.dart';

class RowItem extends StatelessWidget {
  final String title;
  final String content;
  final double fontSize;
  final double? titleHeight;
  final double? contentHeight;

  const RowItem({
    super.key,
    required this.title,
    required this.content,
    this.fontSize = 15,
    this.titleHeight,
    this.contentHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title : ',
          style: TextStyle(
            fontSize: fontSize.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.c989898,
            height: titleHeight,
          ),
        ),
        Text(
          content,
          style: TextStyle(
            fontSize: (fontSize - 1).sp,
            color: AppColors.c2D2F3A,
            height: contentHeight,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
