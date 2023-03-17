import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/core/utils/app_sizes.dart';
import 'package:hr/core/utils/app_strings.dart';
import 'package:hr/presentation/screens/attendance_table/widgets/attendance_item.dart';
import 'package:hr/presentation/widgets/custom_back_button.dart';
import 'package:hr/presentation/widgets/custom_shadow_container.dart';

class AttendanceTableScreen extends StatelessWidget {
  const AttendanceTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.attendanceTable,
        ),
        leading: const CustomBackButton(),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding.w,
          vertical: AppSizes.verticalPadding.h,
        ),
        itemBuilder: (context, index) {
          return const AttendanceItem();
        },
        separatorBuilder: (_, __) {
          return SizedBox(
            height: 12.h,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
