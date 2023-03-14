import 'package:dartz/dartz.dart';
import '../../../../core/failures/api_exception.dart';
import '../../../../core/failures/app_failure.dart';
import '../../core/api/api_response.dart';
import '../data_sources/local/user_local_data_source.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
import '../models/user_model.dart';
import '../params/login_params.dart';

class AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  AuthRepository(
    this._authRemoteDataSource,
    this._userLocalDataSource,
  );

  Future<Either<AppFailure, ApiResponse<UserModel>>> login(
    LoginParams params,
  ) async {
    try {
      final response = await _authRemoteDataSource.login(params);
      authenticateUser(
        response.data,
        params.rememberMe,
        params.password,
      );
      return Right(response);
    } on ApiException catch (error) {
      return Left(AppFailure(error.message, error.statusCode));
    }
  }

  authenticateUser(
    UserModel userModel,
    bool rememberMe,
    String password,
  ) {
    _userLocalDataSource.saveUserData(userModel);
    _userLocalDataSource.saveUserAuthenticatedStatus(true);
    _userLocalDataSource.saveRememberMeStatus(rememberMe);
    if (rememberMe) {
      _userLocalDataSource.savePassword(password);
    }
  }
}
