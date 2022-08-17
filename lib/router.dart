import 'package:flutter/material.dart';
import 'package:zero/Screens/Home.dart';
import 'package:zero/features/auth/screens/loginScreen.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case authScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => authScreen(),
        settings: routeSettings,
      );
    case Home.routeName:
      return MaterialPageRoute(
        builder: (_) => Home(),
        settings: routeSettings,
      );
    default:
      return MaterialPageRoute(builder: (_) => Scaffold(
        body: Column(
          children: [
            Center(
              child: Text('Page is Not Found'),
            )
          ],
        ),
      ));

  }
}
