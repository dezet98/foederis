import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/screens/home_screen.dart';
import 'package:engineering_thesis/screens/login_screen.dart';
import 'package:engineering_thesis/screens/register_screen.dart';
import 'package:engineering_thesis/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String home = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String settings = "/settings";
}

class Router {
  static Widget canActivate(
      BuildContext context, Widget destination, Widget redirection) {
    if (BlocProvider.of<AuthBloc>(context).state
        is AuthUserAuthenticatedState) {
      return destination;
    }
    return redirection;
  }

  static Widget canActivate2(
      BuildContext context, Widget destination, Widget redirection) {
    if (BlocProvider.of<AuthBloc>(context).state
        is AuthUserUnauthenticatedState) {
      return destination;
    }
    return redirection;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => canActivate(
            context,
            HomeScreen(),
            LoginScreen(),
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => canActivate2(
            context,
            LoginScreen(),
            HomeScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => canActivate2(
            context,
            RegisterScreen(),
            HomeScreen(),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (context) => canActivate(
            context,
            SettingsScreen(),
            LoginScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => InformationScreen());
    }
  }
}

class InformationScreen extends StatelessWidget {
  final Widget content;
  InformationScreen({this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: content ?? Text("No routes"),
      ),
    );
  }
}
