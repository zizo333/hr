import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/presentation/widgets/prefix_icon.dart';

import '../../../../core/helpers/validator_helper.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../cubit/login/login_cubit.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/password_state_icon.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController companyIdController;
  final TextEditingController passwordController;
  final FocusNode phoneNode;
  final FocusNode companyIdNode;
  final FocusNode passwordNode;
  final GlobalKey<FormState> formState;

  const LoginForm({
    super.key,
    required this.phoneController,
    required this.companyIdController,
    required this.passwordController,
    required this.phoneNode,
    required this.companyIdNode,
    required this.passwordNode,
    required this.formState,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Form(
          key: formState,
          autovalidateMode: state.showError
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              CustomTextField(
                controller: companyIdController,
                focusNode: companyIdNode,
                nextNode: phoneNode,
                textInputAction: TextInputAction.next,
                labelText: AppStrings.companyId,
                prefixIcon: const PrefixIcon(icon: SvgImages.id),
                onChanged: context.read<LoginCubit>().companyIdChanged,
                validator: (companyId) => ValidatorHelper.validateText(
                    companyId, AppStrings.companyIdIsRequired),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: phoneController,
                focusNode: phoneNode,
                nextNode: passwordNode,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                labelText: AppStrings.phoneNumber,
                maxLength: 10,
                prefixIcon: const PrefixIcon(icon: SvgImages.phone),
                onChanged: context.read<LoginCubit>().phoneChanged,
                validator: ValidatorHelper.validatePhone,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: passwordController,
                focusNode: passwordNode,
                labelText: AppStrings.password,
                obscureText: !state.showPassword,
                prefixIcon: const PrefixIcon(icon: SvgImages.lock),
                sufixIcon: PasswordStateIcon(
                  onPressed: () {
                    context.read<LoginCubit>().togglePasswordStatus();
                  },
                  showPassword: state.showPassword,
                ),
                onChanged: context.read<LoginCubit>().passwordChanged,
                validator: ValidatorHelper.validatePassword,
              ),
            ],
          ),
        );
      },
    );
  }
}
