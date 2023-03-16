import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/core/utils/app_sizes.dart';
import 'package:hr/core/utils/app_strings.dart';

class EndWidget extends StatelessWidget {
  const EndWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(child: _Item(title: AppStrings.dayOn, content: '09:00:00')),
          SizedBox(
            height: AppSizes.verticalPadding.h,
          ),
          Expanded(
              child: const _Item(
                  title: AppStrings.workingTime, content: '08:30:10')),
          SizedBox(
            height: AppSizes.verticalPadding.h,
          ),
          Expanded(child: _Item(title: AppStrings.dayOff, content: '17:30:10')),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     SizedBox(
          //       width: 30.w,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String content;

  const _Item({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 20.sp,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
