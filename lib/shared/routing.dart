import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/screens/activity_details/activity_details_screen.dart';
import 'package:engineering_thesis/screens/home/home_screen.dart';
import 'package:engineering_thesis/screens/login/login_screen.dart';
import 'package:engineering_thesis/screens/register/register_screen.dart';
import 'package:engineering_thesis/screens/splash_screen.dart';
import 'package:engineering_thesis/shared/builders/fill_form_screen.dart';
import 'package:engineering_thesis/shared/builders/filters_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CommonRoutes {
  static const String splash = "/splash";
  static const String filter = "/filter";

  static List<String> get props => [splash, filter];
}

class GuestRoutes {
  static const String login = "/login";
  static const String register = "/register";

  static List<String> get props => [login, register];
}

class UserRoutes {
  static const String home = "/";
  static const String activityDetails = '/activityDetails';
  static const String addActivity = "/addActivity";

  static List<String> get props => [home, activityDetails, addActivity];
}

class Routing {
  static onGenerate(String routeName, {dynamic options}) {
    switch (routeName) {
      case UserRoutes.home:
        return HomeScreen();
      case GuestRoutes.login:
        return LoginScreen();
      case GuestRoutes.register:
        return RegisterScreen();
      case CommonRoutes.splash:
        return SplashScreen();
      case CommonRoutes.filter:
        return FiltersScreen(filtersBloc: options);
      case UserRoutes.activityDetails:
        return ActivityDetailsScreen(activity: options);
      case UserRoutes.addActivity:
        return FillFormScreen(formDataBloc: options);
      default:
        assert(false, '$routeName is not define as a routeName');
        return PlatformScaffold(
          body: Center(
            child: Text('$routeName is not define as a routeName'),
          ),
        );
    }
  }

  static void pushNamed(context, String routeName, {dynamic options}) {
    if (_routeGuard(context, routeName)) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => onGenerate(routeName, options: options)));
    }
  }

  static void pushReplacement(context, String routeName, {dynamic options}) {
    if (_routeGuard(context, routeName)) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => onGenerate(routeName, options: options)));
    }
  }

  static void pushNamedAndRemoveUntil(
      context, String pushName, String untilName,
      {dynamic options}) {
    if (_routeGuard(context, pushName)) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => onGenerate(pushName, options: options)),
          ModalRoute.withName(untilName));
    }
  }

  static void pop(context) {
    Navigator.pop(context);
  }
}

bool _routeGuard(BuildContext context, String routeName) {
  bool authenticated =
      BlocProvider.of<AuthBloc>(context).state is AuthUserAuthenticatedState;

  if (UserRoutes.props.contains(routeName)) {
    if (authenticated) return true;
    Routing.pushNamedAndRemoveUntil(
        context, GuestRoutes.login, GuestRoutes.login);
  } else if (GuestRoutes.props.contains(routeName)) {
    if (!authenticated) return true;
    showPlatformModalSheet(
        context: context, builder: (_) => Text('You are logged in'));
  } else if (CommonRoutes.props.contains(routeName)) {
    return true;
  } else {
    assert(false, '$routeName is not define as a routeName');
  }

  return false;
}
