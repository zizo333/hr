import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/params/login_params.dart';
import '../../core/utils/enums.dart';
import '../../data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.init());

  phoneChanged(String phone) {
    emit(state.copyWith(
      phone: phone,
      requestState: RequestState.none,
    ));
  }

  passwordChanged(String password) {
    emit(state.copyWith(
      password: password,
      requestState: RequestState.none,
    ));
  }

  togglePasswordStatus() {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
        requestState: RequestState.none,
      ),
    );
  }

  login(GlobalKey<FormState> formState) async {
    if (formState.currentState!.validate()) {
      emit(state.copyWith(
        requestState: RequestState.loading,
        refreshState: !state.refreshState,
      ));
      final responseEither = await _authRepository.login(
        LoginParams(
          phone: state.phone,
          password: state.password,
        ),
      );
      responseEither.fold(
        (failure) {
          emit(state.copyWith(
            requestState: RequestState.error,
            message: failure.message,
          ));
        },
        (_) {
          emit(state.copyWith(requestState: RequestState.loaded));
        },
      );
    } else {
      emit(state.copyWith(showError: true));
    }
  }
}
