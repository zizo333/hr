import '../data_sources/local/user_local_data_source.dart';
import '../models/user_model.dart';

class UserRepository {
  final UserLocalDataSource _userLocalDataSource;

  UserRepository(this._userLocalDataSource);

  UserModel getUserData() {
    return _userLocalDataSource.getUserData();
  }

  String getPassword() {
    return _userLocalDataSource.getPassword();
  }

  bool isRememberMe() {
    return _userLocalDataSource.isRememberMe();
  }

  bool isUserAuthenticated() {
    return _userLocalDataSource.isUserAuthenticated();
  }
}
