import '../data_sources/local/user_local_data_source.dart';
import '../models/user_model.dart';

class UserRepository {
  final UserLocalDataSource _userLocalDataSource;

  UserRepository(this._userLocalDataSource);

  saveUserData(UserModel userModel) {
    _userLocalDataSource.saveUserData(userModel);
  }

  UserModel getUserData() {
    return _userLocalDataSource.getUserData();
  }

  clearUserData() {
    _userLocalDataSource.clearUserData();
  }

  saveUserAuthenticatedStatus(bool status) {
    _userLocalDataSource.saveUserAuthenticatedStatus(status);
  }

  bool isUserAuthenticated() {
    return _userLocalDataSource.isUserAuthenticated();
  }
}
