import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/core/utils/app_strings.dart';
import 'package:hr/presentation/widgets/custom_shadow_container.dart';
import 'package:hr/presentation/widgets/row_item.dart';

class AttendanceItem extends StatelessWidget {
  const AttendanceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      child: Column(
        children: [
          const RowItem(
            title: AppStrings.todaysDate,
            content: '17/03/2023',
            titleHeight: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          const RowItem(
            title: AppStrings.dayOn,
            content: '09:00:00',
            titleHeight: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          const RowItem(
            title: AppStrings.dayOff,
            content: '17:30:10',
            titleHeight: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          const RowItem(
            title: AppStrings.workingTime,
            content: '08:30:10',
            titleHeight: 1,
          ),
        ],
      ),
    );
  }
}
