import 'package:flutter/material.dart';

class AppPageRoute<T> extends MaterialPageRoute<T> {
  AppPageRoute({
    required Widget Function(BuildContext context) builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
