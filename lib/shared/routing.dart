import 'package:engineering_thesis/screens/guest/guest_home_screen.dart';
import 'package:engineering_thesis/screens/guest/guest_prohibited_dialog.dart';
import 'package:engineering_thesis/screens/profile/profile_screen.dart';
import 'package:engineering_thesis/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../components/bloc_builders/filters/filters_screen.dart';
import '../components/bloc_builders/forms/form_data_screen.dart';
import '../screens/activity_details/activity_details_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/register/register_screen.dart';

class CommonRoutes {
  static const String splash = "/splash";
  static const String filter = "/filter";

  static List<String> get props => [splash, filter];
}

class GuestRoutes {
  static const String login = "/login";
  static const String register = "/register";
  static const String guestHome = "/guestHome";

  static List<String> get props => [login, register, guestHome];
}

class UserRoutes {
  static const String home = "/";
  static const String activityDetails = '/activityDetails';
  static const String form = "/form";
  static const String profile = "/profile";
  static List<String> get props => [home, activityDetails, form, profile];
}

enum RoutingOption {
  formDataBloc,
  sendBloc,
  formNextButtonText,
  formAppBarTitle,
  activity,
  filtersBloc,
  userRef,
}

class Routing {
  static onGenerate(String routeName, {Map<RoutingOption, dynamic> options}) {
    switch (routeName) {
      case UserRoutes.home:
        return HomeScreen();
      case GuestRoutes.login:
        return LoginScreen();
      case GuestRoutes.register:
        return RegisterScreen();
      case GuestRoutes.register:
        return RegisterScreen();
      case GuestRoutes.guestHome:
        return HomeGuestScreen();
      case CommonRoutes.splash:
        return SplashScreen();
      case CommonRoutes.filter:
        return FiltersScreen(filtersBloc: options[RoutingOption.filtersBloc]);
      case UserRoutes.activityDetails:
        return ActivityDetailsScreen(activity: options[RoutingOption.activity]);
      case UserRoutes.profile:
        return ProfileScreen(userRef: options[RoutingOption.userRef]);
      case UserRoutes.form:
        return FormDataScreen(
          formDataBloc: options[RoutingOption.formDataBloc],
          formAppBarTitle: options[RoutingOption.formAppBarTitle],
          formNextButtonText: options[RoutingOption.formNextButtonText],
          sendBloc: options[RoutingOption.sendBloc],
        );
      default:
        assert(false, '{ error: $routeName is not define as a routeName }');
        return PlatformScaffold(
          body: Center(
            child: Text('{ error: $routeName is not define as a routeName }'),
          ),
        );
    }
  }

  static void pushNamed(context, String routeName,
      {Map<RoutingOption, dynamic> options}) {
    if (_routeGuard(context, routeName)) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => onGenerate(routeName, options: options)));
    }
  }

  static void pushReplacement(context, String routeName,
      {Map<RoutingOption, dynamic> options}) {
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
    GuestProhibitedDialog.showDialog(context);
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
