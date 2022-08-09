import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ke_nav_test/navigator_1/bloc/test_bloc.dart';
import 'package:ke_nav_test/navigator_1/main_routes.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Start Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              child: const Text("Go to Feature Screen"),
              onPressed: ()=>Navigator.pushNamed(context, MainRoutes.feature),
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
