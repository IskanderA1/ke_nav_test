import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ke_nav_test/navigator_1/feature_screen.dart';
import 'package:ke_nav_test/navigator_1/first_sub_screen.dart';
import 'package:ke_nav_test/navigator_1/second_sub_screen.dart';
import 'package:ke_nav_test/navigator_1/start_screen.dart';


class FeatureRoutes {
  static final key = GlobalKey<NavigatorState>();

  static const first = 'first';
  static const second = 'second';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final route = settings.name ?? '';
    final data = settings.arguments != null ? settings.arguments as Map<String, dynamic> : {};
    switch (route) {
      case FeatureRoutes.first:
        return MaterialPageRoute(
          builder: (context) {
            return const FirstSubScreen();
          },
          settings: settings,
        );
      case FeatureRoutes.second:
        return MaterialPageRoute(
          builder: (context) {
            return const SecondSubScreen();
          },
          settings: settings,
        );
    }
    return null;
  }
}

