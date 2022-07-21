import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ke_nav_test/beamer_app/beamer_app.dart';

final routerDelegate = BeamerDelegate(
  initialPath: '/',
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      AppLocation(),
    ],
  ),
);

class AppLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: AppScreen(),
        ),
      ];
}
