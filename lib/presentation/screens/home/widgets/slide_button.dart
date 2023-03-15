import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slider_button/slider_button.dart';

import '../../../../core/utils/app_strings.dart';

class SlideButton extends StatelessWidget {
  final Function() action;

  const SlideButton({
    super.key,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: SliderButton(
          action: action,
          height: 60,
          label: Text(
            AppStrings.slideToConfirm,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17.sp,
            ),
          ),
          baseColor: Theme.of(context).primaryColor,
          buttonColor: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.check,
            color: Colors.white,
            size: 26.w,
          ),
        ),
      ),
    );
  }
}
