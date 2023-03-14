part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String phone;
  final String password;
  final String message;
  final RequestState requestState;
  final bool showPassword;
  final bool showError;
  final bool refreshState;

  const LoginState({
    required this.phone,
    required this.password,
    required this.message,
    required this.requestState,
    required this.showPassword,
    required this.showError,
    required this.refreshState,
  });

  factory LoginState.init() {
    return const LoginState(
      phone: '',
      password: '',
      message: '',
      requestState: RequestState.none,
      showPassword: false,
      showError: false,
      refreshState: false,
    );
  }

  LoginState copyWith({
    String? phone,
    String? password,
    String? message,
    RequestState? requestState,
    bool? showPassword,
    bool? showError,
    bool? rememberMe,
    bool? refreshState,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      showPassword: showPassword ?? this.showPassword,
      showError: showError ?? this.showError,
      refreshState: refreshState ?? this.refreshState,
    );
  }

  @override
  List<Object> get props {
    return [
      phone,
      password,
      message,
      requestState,
      showPassword,
      showError,
      refreshState
    ];
  }
}
