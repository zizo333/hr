import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr/core/utils/app_images.dart';
import 'package:hr/core/utils/app_sizes.dart';
import 'package:hr/presentation/widgets/custom_check_box.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../config/routes/app_router.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/helpers/helper_functions.dart';
import '../../../cubit/login/login_cubit.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _companyIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNode = FocusNode();
  final _companyIdNode = FocusNode();
  final _passwordNode = FocusNode();
  final _formState = GlobalKey<FormState>();
  bool _isInit = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _companyIdController.dispose();
    _passwordController.dispose();
    _phoneNode.dispose();
    _companyIdNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        _handleListener(state);
      },
      child: GestureDetector(
        onTap: () => HelperFunctions.unFocusKeyboard(context),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.login.toUpperCase(),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalPadding.w,
                vertical: AppSizes.verticalPadding.h,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    SvgPicture.asset(
                      SvgImages.logo,
                      width: 100.w,
                      height: 100.w,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      AppStrings.welcome.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    LoginForm(
                      phoneController: _phoneController,
                      companyIdController: _companyIdController,
                      passwordController: _passwordController,
                      phoneNode: _phoneNode,
                      companyIdNode: _companyIdNode,
                      passwordNode: _passwordNode,
                      formState: _formState,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) =>
                              previous.rememberMe != current.rememberMe,
                          builder: (context, state) {
                            return CustomCheckBox(
                              onChanged: (_) {
                                context
                                    .read<LoginCubit>()
                                    .toggleRememberMeStatus();
                              },
                              isChecked: state.rememberMe,
                              title: AppStrings.rememberMe,
                              radius: 20,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      width: double.infinity,
                      child: ElevatedButton(
                        // onPressed: () =>
                        //     context.read<LoginCubit>().login(_formState),
                        onPressed: () =>
                            AppRouter.offNamed(context, AppRoutes.home),
                        child: Text(
                          AppStrings.login.toUpperCase(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _handleListener(LoginState state) {
    if (state.rememberMe && _isInit) {
      _companyIdController.text = state.companyId;
      _phoneController.text = state.phone;
      _passwordController.text = state.password;
    }
    _isInit = false;
    HelperFunctions.submitActions(
      context,
      requestState: state.requestState,
      onLoaded: () {
        AppRouter.back(context);
        AppRouter.offNamed(context, AppRoutes.home);
      },
      onError: () {
        AppRouter.back(context);
        HelperFunctions.showToastMessage(context, state.message);
      },
    );
  }
}
