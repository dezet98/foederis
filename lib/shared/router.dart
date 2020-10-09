import 'package:engineering_thesis/screens/home_screen.dart';
import 'package:engineering_thesis/screens/login_screen.dart';
import 'package:engineering_thesis/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = "/";
  static const String login = "/login";
  static const String register = "/register";
}

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
      return MaterialPageRoute(builder: (_) => InformationScreen());
    }
  }
}

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("No routes"),
      ),
    );
  }
}
