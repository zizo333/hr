import 'package:get_storage/get_storage.dart';
import '../../../core/utils/app_constants.dart';
import '../../models/user_model.dart';

class UserLocalDataSource {
  final GetStorage _storage;

  UserLocalDataSource(this._storage);

  saveUserData(UserModel userModel) {
    _storage.write(AppConstants.user, userModel.toJson());
  }

  UserModel getUserData() {
    return UserModel.fromJson(_storage.read(AppConstants.user));
  }

  clearUserData() {
    return _storage.remove(AppConstants.user);
  }

  saveUserAuthenticatedStatus(bool status) {
    _storage.write(AppConstants.isAuthenticated, status);
  }

  bool isUserAuthenticated() {
    return _storage.read(AppConstants.isAuthenticated) ?? false;
  }
}
