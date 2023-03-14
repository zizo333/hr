part of 'routes_generator_imports.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return AppPageRoute(
          builder: (context) => BlocProvider<SplashCubit>(
                create: (context) =>
                    SplashCubit(locator<UserRepository>())..goToNextRoute(),
                child: const SplashScreen(),
              ));

    default:
      return AppPageRoute(
        builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text(AppStrings.undefinedRoute),
            ),
          );
        },
      );
  }
}
