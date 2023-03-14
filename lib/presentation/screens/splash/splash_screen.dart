import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/routes/app_router.dart';
import '../../../cubit/splash/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, String>(
        listener: (context, route) {
          AppRouter.offNamed(context, route);
        },
        builder: (context, state) {
          return Icon(
            Icons.person,
            size: 100.w,
          );
        },
      ),
    );
  }
}
