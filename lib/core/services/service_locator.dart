import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hr/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:hr/data/repositories/auth_repository.dart';
import 'package:hr/data/repositories/user_repository.dart';
import '../../data/data_sources/local/user_local_data_source.dart';
import '../api/api_client.dart';

final locator = GetIt.I;

class ServiceLocator {
  const ServiceLocator._();

  static init() {
    locator.allowReassignment = true;
    locator.registerLazySingleton(() => GetStorage());
    locator.registerLazySingleton(() => ApiClient());
    locator.registerLazySingleton(() => UserLocalDataSource(locator()));
    locator.registerLazySingleton(() => AuthRemoteDataSource(locator()));
    locator.registerLazySingleton(() => UserRepository(locator()));
    locator.registerLazySingleton(() => AuthRepository(locator(), locator()));
  }
}
