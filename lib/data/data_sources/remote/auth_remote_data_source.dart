import '../../../core/api/api_client.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/api/api_response.dart';
import '../../../core/failures/api_exception.dart';
import '../../models/user_model.dart';
import '../../params/login_params.dart';

class AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSource(this._apiClient);

  Future<ApiResponse<UserModel>> login(LoginParams params) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.login,
        body: params.toMap(),
      );

      return ApiResponse.fromMap(response, builder: (data) {
        return UserModel.fromMap(data, response['api_token']);
      });
    } on ApiException catch (_) {
      rethrow;
    }
  }
}
