import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final _passwordController = TextEditingController();
  final _phoneNode = FocusNode();
  final _passwordNode = FocusNode();
  final _formState = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _phoneNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        _handleListener(state);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginForm(
            phoneController: _phoneController,
            passwordController: _passwordController,
            phoneNode: _phoneNode,
            passwordNode: _passwordNode,
            formState: _formState,
          ),
          SizedBox(
            height: 32.h,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.read<LoginCubit>().login(_formState),
              child: Text(
                AppStrings.login.toUpperCase(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _handleListener(LoginState state) {
    HelperFunctions.submitActions(
      context,
      requestState: state.requestState,
      onLoaded: () {
        AppRouter.back(context);
        AppRouter.offNamed(context, AppRoutes.main);
      },
      onError: () {
        AppRouter.back(context);
        HelperFunctions.showToastMessage(context, state.message);
      },
    );
  }
}
