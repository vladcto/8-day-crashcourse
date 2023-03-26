import 'package:beamer/beamer.dart';
import 'package:beamer_learn/home_page.dart';
import 'package:beamer_learn/trader_preview_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final _routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        HomeLocation(),
        TraderPreviewLocation(),
      ],
    ),
  );

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
