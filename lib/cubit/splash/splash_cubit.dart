import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/config/routes/app_routes.dart';

import '../../data/repositories/user_repository.dart';

class SplashCubit extends Cubit<String> {
  final UserRepository _userRepository;

  SplashCubit(
    this._userRepository,
  ) : super(AppRoutes.login);

  goToNextRoute() async {
    Future.delayed(const Duration(seconds: 3), () {
      if (_userRepository.isUserAuthenticated()) {
        emit(AppRoutes.main);
      } else {
        emit(AppRoutes.login);
      }
    });
  }
}
