import 'package:engineering_thesis/blocs/create_activity/create_activity_form_data.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyActivitiesScreen extends NavBarTab {
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
            RaisedButton(onPressed: () async {}, child: Text('dfs'))
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
          options: BlocProvider.of<CreateActvityFormDataBloc>(context),
        );
      },
    );
  }

  @override
  Icon getIcon(BuildContext context) => Icon(PlatformIcons(context).book);

  @override
  String getLabel(context) => S.of(context).home_screen_my_activity_tab_name;
}
