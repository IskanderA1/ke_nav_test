import 'package:flutter/material.dart';
import 'package:ke_nav_test/navigator_1/main_routes.dart';

class NavigatorApp extends StatelessWidget {
  const NavigatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: MainRoutes.start,
      onGenerateRoute: MainRoutes.onGenerateRoute,
    );
  }
}
