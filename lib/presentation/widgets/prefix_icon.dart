import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrefixIcon extends StatelessWidget {
  final String icon;

  const PrefixIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: 16.w,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
