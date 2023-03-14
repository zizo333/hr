import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/themes/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final String? hintText;
  final String? labelText;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final bool? obscureText;
  final Widget? prefixIcon;
  final double? prefixIconPadding;
  final Widget? sufixIcon;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final int maxLines;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final int maxLength;

  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextNode,
    this.hintText,
    this.labelText,
    this.border,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.keyboardType,
    this.textInputAction,
    this.enabled,
    this.obscureText,
    this.prefixIcon,
    this.prefixIconPadding,
    this.sufixIcon,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.maxLength = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.secondary,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enabled: enabled,
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      obscuringCharacter: '✶',
      inputFormatters: [
        if (maxLength > 0) LengthLimitingTextInputFormatter(maxLength),
      ],
      style: style ??
          TextStyle(
            fontSize: 14.sp,
            color: AppColors.c2D2F3A,
            height: 2,
          ),
      textAlign: textAlign,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        alignLabelWithHint: true,
        border: border,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
        contentPadding: contentPadding,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.all(
                  prefixIconPadding?.w ??
                      (ScreenUtil().screenWidth > 700 ? 14.w : 17.w),
                ),
                child: prefixIcon,
              )
            : null,
        suffixIcon: sufixIcon,
      ),
      onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(nextNode),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
