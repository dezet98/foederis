import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/specific_blocs/common/user_fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/profile/profile_screen_top_nav_bar_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final DocumentReference userRef;

  ProfileScreen({@required this.userRef});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserFetchBloc(
          RepositoryProvider.of<UserRepository>(context),
          userRef: userRef),
      child: Builder(
        builder: (context) {
          return FetchingBlocBuilder(
            fetchingCubit: BlocProvider.of<UserFetchBloc>(context),
            buildSuccess: (appUser) {
              return _buildTabs(context, appUser as AppUser);
            },
          );
        },
      ),
    );
  }

  Widget _buildTabs(context, AppUser appUser) {
    return TemplateScreen.topNavbar(
      context: context,
      navBarBloc: ProfileScreenTopNavbarBloc(appUser: appUser),
      appBarTitle: '${appUser.email}',
    );
  }
}
