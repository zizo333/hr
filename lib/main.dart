import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'core/services/service_locator.dart';
import 'presentation/my_app.dart';

void main() async {
  await _initConfig();

  runApp(const MyApp());
}

Future _initConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.init();
  await GetStorage.init();
}
