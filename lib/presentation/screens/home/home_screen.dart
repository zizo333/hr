import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/core/utils/app_images.dart';
import 'package:hr/core/utils/app_strings.dart';
import 'package:hr/presentation/widgets/custom_app_bar_icon.dart';
import 'package:slider_button/slider_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.home.toUpperCase(),
        ),
        leading: CustomAppBarIcon(
          onTap: () {},
          icon: SvgImages.logout,
        ),
        actions: [
          CustomAppBarIcon(
            onTap: () {},
            icon: SvgImages.meeting,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: SliderButton(
                action: () {
                  print('...');
                },
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
          )
        ],
      ),
    );
  }
}
