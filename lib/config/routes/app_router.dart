import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static back<T extends Object?>(BuildContext context, [T? result]) =>
      Navigator.pop(context, result);

  static offNamed(BuildContext context, String routeName,
          {Object? arguments}) =>
      Navigator.pushReplacementNamed(context, routeName, arguments: arguments);

  static Future<T?> to<T extends Object?>(
          BuildContext context, String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed(context, routeName, arguments: arguments);

  static bool canPop(BuildContext context) => Navigator.canPop(context);

  static backToFirstScreen(BuildContext context) {
    bool enablePop = true;
    while (enablePop) {
      if (canPop(context)) {
        back(context);
      } else {
        enablePop = false;
      }
    }
  }
}
