part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String phone;
  final String companyId;
  final String password;
  final String message;
  final RequestState requestState;
  final bool showPassword;
  final bool showError;
  final bool refreshState;
  final bool rememberMe;

  const LoginState({
    required this.phone,
    required this.companyId,
    required this.password,
    required this.message,
    required this.requestState,
    required this.showPassword,
    required this.showError,
    required this.refreshState,
    required this.rememberMe,
  });

  factory LoginState.init() {
    return const LoginState(
      phone: '',
      companyId: '',
      password: '',
      message: '',
      requestState: RequestState.none,
      showPassword: false,
      showError: false,
      refreshState: false,
      rememberMe: false,
    );
  }

  LoginState copyWith({
    String? phone,
    String? companyId,
    String? password,
    String? message,
    RequestState? requestState,
    bool? showPassword,
    bool? showError,
    bool? refreshState,
    bool? rememberMe,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      companyId: companyId ?? this.companyId,
      password: password ?? this.password,
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      showPassword: showPassword ?? this.showPassword,
      showError: showError ?? this.showError,
      refreshState: refreshState ?? this.refreshState,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object> get props {
    return [
      phone,
      companyId,
      password,
      message,
      requestState,
      showPassword,
      showError,
      refreshState,
      rememberMe
    ];
  }
}
