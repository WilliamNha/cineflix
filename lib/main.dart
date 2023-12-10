import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'config/router/routes.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Cineflix",
      routerConfig: AppRouter.router,
      // routeInformationProvider: AppRouter.router.routeInformationProvider,
      // routeInformationParser: AppRouter.router.routeInformationParser,
      // routerDelegate: AppRouter.router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
