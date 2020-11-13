import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/screens/home/home_screen.dart';
import 'package:engineering_thesis/screens/login/login_screen.dart';
import 'package:engineering_thesis/screens/register/register_screen.dart';
import 'package:engineering_thesis/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CommonRoutes {
  static const String splash = "/splash";
}

class GuestRoutes {
  static const String login = "/login";
  static const String register = "/register";

  static List<String> get props => [login, register];
}

class UserRoutes {
  static const String home = "/";

  static List<String> get props => [home];
}

class Routing {
  static onGenerate(String routeName) {
    switch (routeName) {
      case UserRoutes.home:
        return HomeScreen();
      case GuestRoutes.login:
        return LoginScreen();
      case GuestRoutes.register:
        return RegisterScreen();
      case CommonRoutes.splash:
        return SplashScreen();
      default:
        assert(false, '$routeName is not define as a routeName');
        return PlatformScaffold(
          body: Center(
            child: Text('$routeName is not define as a routeName'),
          ),
        );
    }
  }

  static void pushNamed(context, String routeName) {
    if (_isEligible(context, routeName)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => onGenerate(routeName)));
    }
  }

  static void pushReplacement(context, String routeName) {
    if (_isEligible(context, routeName)) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => onGenerate(routeName)));
    }
  }

  static void pushNamedAndRemoveUntil(
      context, String pushName, String untilName) {
    if (_isEligible(context, pushName)) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => onGenerate(pushName)),
          ModalRoute.withName(untilName));
    }
  }
}

bool _isEligible(BuildContext context, String routeName) {
  bool authenticated =
      BlocProvider.of<AuthBloc>(context).state is AuthUserAuthenticatedState;

  if (UserRoutes.props.contains(routeName)) {
    if (authenticated) return true;
    Routing.pushNamedAndRemoveUntil(
        context, GuestRoutes.login, GuestRoutes.login);
    // TODO, maybe message that you have to log in again in login attributes
  } else if (GuestRoutes.props.contains(routeName)) {
    if (!authenticated) return true;
    showPlatformModalSheet(
        context: context, builder: (_) => Text('You are logged in'));
  } else {
    assert(false, '$routeName is not define as a routeName');
  }

  return false;
}
