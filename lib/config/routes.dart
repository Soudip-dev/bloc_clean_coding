import 'package:bloc_clean_coding/config/routes_name.dart';
import "../views/view.dart";
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splshScreen:
        return MaterialPageRoute(builder: (_) =>  SplshScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }

}