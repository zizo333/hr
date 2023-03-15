import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/config/routes/app_router.dart';
import 'package:hr/config/routes/app_routes.dart';
import 'package:hr/config/themes/app_colors.dart';
import 'package:hr/core/utils/app_images.dart';
import 'package:hr/core/utils/app_sizes.dart';
import 'package:hr/core/utils/app_strings.dart';
import 'package:hr/core/utils/enums.dart';
import 'package:hr/cubit/home/home_cubit.dart';
import 'package:hr/presentation/screens/home/widgets/day_action_button.dart';
import 'package:hr/presentation/screens/home/widgets/day_timer.dart';
import 'package:hr/presentation/screens/home/widgets/slide_button.dart';
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
          onTap: () {
            AppRouter.offNamed(context, AppRoutes.login);
          },
          icon: SvgImages.logout,
        ),
        actions: [
          CustomAppBarIcon(
            onTap: () {},
            icon: SvgImages.meeting,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding.w,
          vertical: AppSizes.verticalPadding.h,
        ),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.dayAction == DayAction.off) ...[
                      DayTimer(DateTime.now()),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                    if (state.dayAction != DayAction.end)
                      DayActionButton(
                        onPressed: () {
                          context.read<HomeCubit>().showSlideButton();
                        },
                        title: state.dayAction == DayAction.on
                            ? AppStrings.dayOn
                            : AppStrings.dayOff,
                      )
                  ],
                ),
                if (state.showSlideButton)
                  SlideButton(
                    action: () {
                      if (state.dayAction == DayAction.on) {
                        context
                            .read<HomeCubit>()
                            .changeDayAction(DayAction.off);
                      } else {
                        context
                            .read<HomeCubit>()
                            .changeDayAction(DayAction.end);
                      }
                    },
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
