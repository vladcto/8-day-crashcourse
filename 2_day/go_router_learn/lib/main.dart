import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/home_page.dart';
import 'package:go_router_learn/trader_info.dart';
import 'package:go_router_learn/trader_preview_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        path: "/home",
        builder: (context, state) {
          bool display = state.queryParams["detailed"] == "true";
          return HomePage(
            displayDetailed: display,
          );
        },
        routes: [
          GoRoute(
            path: "preview",
            builder: ((context, state) {
              return TraderPreviewPage(traderInfo: state.extra as TraderInfo);
            }),
          )
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
