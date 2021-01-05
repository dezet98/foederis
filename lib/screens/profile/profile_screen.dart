import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/common/user_fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/profile/profile_screen_top_nav_bar_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/settings/update_user_data_form_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/settings/update_user_data_send_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/repositories/remote_storage_service.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:engineering_thesis/shared/routing/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final DocumentReference userRef;
  final bool withContactInfo;

  ProfileScreen({@required this.userRef, this.withContactInfo = false});

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
        navBarBloc: ProfileScreenTopNavbarBloc(
            appUser: appUser, withContactInfo: withContactInfo),
        appBarTitle: '${appUser.email}',
        trailingActions: [
          if (userRef.id == BlocProvider.of<UserDataBloc>(context).user.ref.id)
            editProfile(context)
        ]);
  }

  Widget editProfile(context) {
    return CustomButton.iconButton(
        customIcon: CustomIcon.edit,
        onPressed: () {
          Routing.pop(context);
          Routing.pushNamed(context, UserRoutes.form, options: {
            RoutingOption.formDataBloc: UpdateUserDataFormBloc(
              appUser: BlocProvider.of<UserDataBloc>(context).user,
            ),
            RoutingOption.formAppBarTitle:
                S.of(context).update_user_form_nav_bar_title,
            RoutingOption.formNextButtonText:
                S.of(context).update_user_form_apply_button,
            RoutingOption.sendBloc: UpdateUserDataSendBloc(
              RepositoryProvider.of<UserRepository>(context),
              BlocProvider.of<UserDataBloc>(context),
              RepositoryProvider.of<RemoteStorageService>(context),
            ),
            RoutingOption.afterSuccess: () {
              Navigator.pop(context);

              BlocProvider.of<UserDataBloc>(context)
                  .add(UserDataRefreshEvent());
            }
          });
        });
  }
}
