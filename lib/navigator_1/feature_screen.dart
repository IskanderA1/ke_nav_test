import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ke_nav_test/navigator_1/bloc/test_bloc.dart';
import 'package:ke_nav_test/navigator_1/feature_routes.dart';

class FeatureScreen extends StatelessWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feature Screen"),
      ),
      body: BlocProvider<TestBloc>(
        create: (context) => TestBloc(),
        child: Navigator(
          key: FeatureRoutes.key,
          initialRoute: FeatureRoutes.first,
          onGenerateRoute: FeatureRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
