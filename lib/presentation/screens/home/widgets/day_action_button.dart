import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayActionButton extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const DayActionButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        side: BorderSide(
          color: Colors.white,
          width: 3.w,
        ),
        padding: EdgeInsets.all(40.w),
      ),
      child: Text(
        title.toUpperCase(),
      ),
    );
  }
}
