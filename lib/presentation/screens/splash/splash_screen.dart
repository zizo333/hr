import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr/core/utils/app_images.dart';
import '../../../../../config/routes/app_router.dart';
import '../../../cubit/splash/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, String>(
        listener: (context, route) {
          AppRouter.offNamed(context, route);
        },
        child: Center(
          child: SvgPicture.asset(
            SvgImages.logo,
            width: 130.w,
            height: 130.w,
          ),
        ),
      ),
    );
  }
}
