import 'package:engineering_thesis/blocs/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/search_screen.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchActivitiesAppBar {
  static SliverAppBar getSliverAppBar(BuildContext context) => SliverAppBar(
        title: _buildTitle(context),
        elevation: 4,
        actions: _buildAction(context),
      );

  static AppBar getAppBar(BuildContext context) => AppBar(
        title: _buildTitle(context),
        elevation: 4,
        actions: _buildAction(context),
      );

  static Widget _buildTitle(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SearchActivitiesSearchFilterBloc>(context),
      builder: (context, state) {
        return Text(
          BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)
                      .selectedOption !=
                  null
              ? BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)
                  .display(
                      BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)
                          .selectedOption)
              : 'Choose City',
        );
      },
    );
  }

  static List<Widget> _buildAction(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () async {
            await SearchScreen.show(context,
                BlocProvider.of<SearchActivitiesSearchFilterBloc>(context));
          }),
      _buildChangingViewButton(context),
      CustomButton(
        buttonType: ButtonType.icon_button,
        cupertinoIconData: CupertinoIcons.color_filter,
        materialIconData: Icons.filter_list,
        onPressed: () {
          Routing.pushNamed(
            context,
            CommonRoutes.filter,
            options: BlocProvider.of<SearchActivitiesFiltersBloc>(context),
          );
        },
      )
    ];
  }

  static Widget _buildChangingViewButton(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        return CustomButton(
          buttonType: ButtonType.icon_button,
          materialIconData: SharedPreferences().searchActivityView ==
                  SharedPreferencesCode.list
              ? Icons.map
              : Icons.list,
          onPressed: () => {
            if (SharedPreferences().searchActivityView ==
                SharedPreferencesCode.list)
              BlocProvider.of<SharedPreferencesBloc>(context).add(
                SharedPreferencesUpdateEvent(
                  SharedPreferencesName.searchActivityName,
                  SharedPreferencesCode.map,
                ),
              )
            else if (SharedPreferences().searchActivityView ==
                SharedPreferencesCode.map)
              BlocProvider.of<SharedPreferencesBloc>(context).add(
                SharedPreferencesUpdateEvent(
                  SharedPreferencesName.searchActivityName,
                  SharedPreferencesCode.list,
                ),
              )
          },
        );
      },
    );
  }
}
