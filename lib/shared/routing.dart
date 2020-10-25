import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/screens/home_screen.dart';
import 'package:engineering_thesis/screens/login_screen.dart';
import 'package:engineering_thesis/screens/register/register_screen.dart';
import 'package:engineering_thesis/screens/register/splash_screen.dart';
import 'package:engineering_thesis/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class GuestRoutes {
  static const String login = "/login";
  static const String register = "/register";

  static List<String> get props => [login, register];
}

class UserRoutes {
  static const String home = "/";
  static const String settings = "/settings";

  static List<String> get props => [home, settings];
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
      case UserRoutes.settings:
        return SettingsScreen();
      default:
        assert(false, '$routeName is not define as a routeName');
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }

  static void pushNamed(context, String routeName) {
    if (_isEligible(context, routeName)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => onGenerate(routeName)));
    }
  }

  static void popAndPushNamed(context, String routeName) {
    if (_isEligible(context, routeName)) {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => onGenerate(routeName)));
    }
  }

  static Widget get buildFirstScreen {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthUserAuthenticatedState) {
          return HomeScreen();
        } else if (state is AuthUserUnauthenticatedState) {
          return LoginScreen();
        } else if (state is AuthInitialState) {
          return SplashScreen(
            content: Text('AuthInitialState'),
          );
        }
        return SplashScreen(
          // TODO never listen !
          content: Text('AuthVerificationState'),
        );
      },
    );
  }
}

bool _isEligible(BuildContext context, String routeName) {
  bool authenticated =
      BlocProvider.of<AuthBloc>(context).state is AuthUserAuthenticatedState;

  if (UserRoutes.props.contains(routeName)) {
    if (authenticated) return true;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => Routing.onGenerate(GuestRoutes.login)),
      ModalRoute.withName(GuestRoutes.login),
    );
    // todo, maybe message that you have to log in again in login attributes
  } else if (GuestRoutes.props.contains(routeName)) {
    if (!authenticated) return true;
    showPlatformModalSheet(
        context: context, builder: (_) => Text('You are logged in'));
  } else {
    assert(false, '$routeName is not define as a routeName');
  }

  return false;
}
