import 'package:engineering_thesis/blocs/specific_blocs/create_activity/create_activity_send_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../blocs/specific_blocs/create_activity/create_activity_form_data.dart';
import '../../../../generated/l10n.dart';
import '../../../../shared/routing.dart';
import '../../../../shared/theme.dart';

class MyActivitiesTab extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: _buildFloatingButton(context),
        right: Dimensions.gutterMedium,
        bottom: Dimensions.gutterMedium,
      ),
      Padding(
        padding: const EdgeInsets.all(54.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('My activities screen'),
          ],
        ),
      ),
    ]);
  }

  Widget _buildFloatingButton(BuildContext context) {
    return CustomButton.floatingButton(
      materialIconData: Icons.add,
      cupertinoIconData: CupertinoIcons.add,
      onPressed: () {
        Routing.pushNamed(
          context,
          UserRoutes.form,
          options: {
            RoutingOption.formDataBloc:
                BlocProvider.of<CreateActvityFormDataBloc>(context),
            RoutingOption.formAppBarTitle:
                S.of(context).create_activity_screen_nav_title,
            RoutingOption.formNextButtonText: 'fsd',
            RoutingOption.sendBloc:
                BlocProvider.of<CreateActivitySendBloc>(context),
          },
        );
      },
    );
  }

  @override
  Icon getIcon(BuildContext context) => Icon(PlatformIcons(context).book);

  @override
  String getLabel(context) => S.of(context).home_screen_my_activity_tab_name;
}
