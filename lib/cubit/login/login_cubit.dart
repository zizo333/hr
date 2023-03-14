import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/data/repositories/user_repository.dart';

import '../../../data/params/login_params.dart';
import '../../core/utils/enums.dart';
import '../../data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  LoginCubit(
    this._authRepository,
    this._userRepository,
  ) : super(LoginState.init());

  checkRememberMe() {
    if (_userRepository.isRememberMe()) {
      Future.delayed(Duration.zero, () {
        emit(
          state.copyWith(
            rememberMe: true,
            companyId: '7899n',
            phone: _userRepository.getUserData().phone,
            password: _userRepository.getPassword(),
          ),
        );
      });
    }
  }

  phoneChanged(String phone) {
    emit(state.copyWith(
      phone: phone,
      requestState: RequestState.none,
    ));
  }

  companyIdChanged(String companyId) {
    emit(state.copyWith(
      companyId: companyId,
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

  toggleRememberMeStatus() {
    emit(
      state.copyWith(
        rememberMe: !state.rememberMe,
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
          companyId: state.companyId,
          phone: state.phone,
          password: state.password,
          rememberMe: state.rememberMe,
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
