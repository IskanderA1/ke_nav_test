import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ke_nav_test/navigator_1/feature_screen.dart';
import 'package:ke_nav_test/navigator_1/start_screen.dart';


class MainRoutes {
  static final key = GlobalKey<NavigatorState>();

  static const start = 'start';
  static const feature = 'feature';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final route = settings.name ?? '';
    final data = settings.arguments != null ? settings.arguments as Map<String, dynamic> : {};
    switch (route) {
      case MainRoutes.start:
        return MaterialPageRoute(
          builder: (context) {
            return const StartScreen();
          },
          settings: settings,
        );
      case MainRoutes.feature:
        return MaterialPageRoute(
          builder: (context) {
            return const FeatureScreen();
          },
          settings: settings,
        );
    }
    return null;
  }
}

