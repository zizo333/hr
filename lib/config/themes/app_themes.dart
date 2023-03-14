import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_constants.dart';
import '../../core/utils/app_sizes.dart';
import 'app_colors.dart';

ThemeData appThemes = ThemeData(
  fontFamily: AppConstants.fontFamily,
  primaryColor: AppColors.c01628F,
  backgroundColor: AppColors.cFFFFFF,
  canvasColor: AppColors.cFFFFFF,
  shadowColor: AppColors.cE2DFDF,
  errorColor: AppColors.cEF5350,
  selectedRowColor: AppColors.cAEB3BD,
  unselectedWidgetColor: AppColors.cAEB3BD,
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: AppColors.c01628F,
        secondary: AppColors.cE27E1C,
      ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: AppColors.cF5F7F9,
    elevation: 0,
    shadowColor: AppColors.cE2DFDF,
    toolbarHeight: 100.h,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.c01628F,
      fontFamily: AppConstants.fontFamily,
      height: 1.5,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 12.w,
      vertical: 14.h,
    ),
    hintStyle: TextStyle(
      fontSize: 14.sp,
      color: AppColors.c262626,
    ),
    labelStyle: TextStyle(
      fontSize: 14.sp,
      color: AppColors.c848484,
    ),
    floatingLabelStyle: TextStyle(
      fontSize: 14.sp,
      color: AppColors.c848484,
    ),
    enabledBorder: _textFieldBorder(AppColors.c707070),
    disabledBorder: _textFieldBorder(AppColors.c707070),
    focusedBorder: _textFieldBorder(AppColors.c01628F),
    errorBorder: _textFieldBorder(AppColors.cEF5350),
    focusedErrorBorder: _textFieldBorder(AppColors.cEF5350),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.c01628F,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.fontFamily,
        height: 1.3,
      ),
      padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 24.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius.r),
      ),
      shadowColor: AppColors.cE2DFDF,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.fontFamily,
        height: 1.3,
      ),
      padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 24.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius.r),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: TextStyle(
        color: AppColors.cE27E1C,
        fontSize: 14.sp,
        fontFamily: AppConstants.fontFamily,
      ),
      foregroundColor: AppColors.cE27E1C,
    ),
  ),
  iconTheme: IconThemeData(size: 24.w),
  listTileTheme: const ListTileThemeData(
    dense: true,
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9.r),
    ),
    shadowColor: AppColors.cE2DFDF,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    iconSize: 12.w,
  ),
  dividerTheme: DividerThemeData(
    color: AppColors.c707070.withOpacity(0.1),
    thickness: 1.h,
  ),
);

InputBorder _textFieldBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      AppSizes.radius.r,
    ),
    borderSide: BorderSide(
      color: color,
      width: AppSizes.borderWidth.w,
    ),
  );
}
