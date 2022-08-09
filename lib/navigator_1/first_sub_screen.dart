import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ke_nav_test/navigator_1/bloc/test_bloc.dart';
import 'package:ke_nav_test/navigator_1/feature_routes.dart';

class FirstSubScreen extends StatefulWidget {
  const FirstSubScreen({Key? key}) : super(key: key);

  @override
  State<FirstSubScreen> createState() => _FirstSubScreenState();
}

class _FirstSubScreenState extends State<FirstSubScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Sub Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              child: const Text("Go to Second Sub Screen"),
              onPressed: () => Navigator.pushNamed(context, FeatureRoutes.second),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              child: const Text("CheckBloc"),
              onPressed: () {
                final TestBloc? bloc;
                try {
                  bloc = BlocProvider.of<TestBloc>(context);
                  setState(() {
                    result = '${bloc.runtimeType.toString()} ${bloc.runtimeType.hashCode}';
                  });
                } catch (_) {
                  setState(() {
                    result = 'error';
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            Text('result: $result'),
          ],
        ),
      ),
    );
  }
}
