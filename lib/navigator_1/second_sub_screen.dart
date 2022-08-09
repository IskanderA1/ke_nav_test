import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ke_nav_test/navigator_1/bloc/test_bloc.dart';

class SecondSubScreen extends StatefulWidget {
  const SecondSubScreen({Key? key}) : super(key: key);

  @override
  State<SecondSubScreen> createState() => _SecondSubScreenState();
}

class _SecondSubScreenState extends State<SecondSubScreen> {

  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Sub Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              child: const Text("Go Start"),
              onPressed: ()=>Navigator.of(context,rootNavigator: true).popUntil((route) => route.isFirst),
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