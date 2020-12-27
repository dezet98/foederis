import 'package:engineering_thesis/blocs/specific_blocs/activity_details/activity_details_top_navbar_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:engineering_thesis/shared/providers.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/activity.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final Activity activity;

  ActivityDetailsScreen({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getActivityDetailsScreenBlocProviders(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUserUnauthenticatedState) {
            Routing.pushNamedAndRemoveUntil(context, CommonRoutes.splash,
                CommonRoutes.splash); // TODO change security maybe
          }
        },
        child: Builder(
          builder: (context) => _buildNavBarScreen(context),
        ),
      ),
    );
  }

  Widget _buildNavBarScreen(BuildContext context) {
    return BlocProvider<ActivityDetailsTopNavbarBloc>(
      create: (context) => ActivityDetailsTopNavbarBloc(
        activity: activity,
      ),
      child: Builder(
        builder: (context) {
          return TemplateScreen.topNavbar(
              context: context,
              appBarTitle: activity.title,
              navBarBloc:
                  BlocProvider.of<ActivityDetailsTopNavbarBloc>(context));
        },
      ),
    );
  }
}
