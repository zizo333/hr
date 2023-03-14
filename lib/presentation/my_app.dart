import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/routes/routes_generator_imports.dart';
import '../config/themes/app_themes.dart';
import '../core/utils/app_strings.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => MaterialApp(
        navigatorKey: navigatorKey,
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: appThemes,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
