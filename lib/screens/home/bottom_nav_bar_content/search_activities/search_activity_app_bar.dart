import 'package:engineering_thesis/blocs/search_activities/search_activities_distance_choice_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/components/gesture_detector.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/search_screen.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchActivitiesAppBar {
  static SliverAppBar getSliverAppBar(BuildContext context) => SliverAppBar(
        title: _buildAddressField(context),
        elevation: 4,
        actions: _buildAction(context),
      );

  static AppBar getAppBar(BuildContext context) => AppBar(
        title: _buildAddressField(context),
        elevation: 4,
        actions: _buildAction(context),
      );

  static Widget _buildAddressField(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        return CustomGestureDetector(
          onTap: () async {
            await SearchScreen.show(context,
                BlocProvider.of<SearchActivitiesSearchFilterBloc>(context));
          },
          child: Text(
            SharedPreferences().address ?? 'Choose City',
          ),
        );
      },
    );
  }

  static List<Widget> _buildAction(BuildContext context) {
    return [
      _buildDistanceButton(context),
      _buildChangingViewButton(context),
      _buildFilterButton(context),
    ];
  }

  static Widget _buildDistanceButton(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        return BlocBuilder(
          cubit: BlocProvider.of<SearchActivitiesSearchFilterBloc>(context),
          builder: (context, state) {
            return CustomButton.iconWithTextButton(
              text: "${SharedPreferences().distanceKm}km",
              materialIconData: Icons.circle,
              onPressed: () {
                Routing.pushNamed(context, UserRoutes.form,
                    options: BlocProvider.of<SearchActivityDistanceChoiceBloc>(
                        context));
              },
            );
          },
        );
      },
    );
  }

  static Widget _buildFilterButton(BuildContext context) {
    return CustomButton.iconButton(
      cupertinoIconData: CupertinoIcons.color_filter,
      materialIconData: Icons.filter_list,
      onPressed: () {
        Routing.pushNamed(
          context,
          CommonRoutes.filter,
          options: BlocProvider.of<SearchActivitiesFiltersBloc>(context),
        );
      },
    );
  }

  static Widget _buildChangingViewButton(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        return CustomButton.iconButton(
          materialIconData: SharedPreferences().searchActivityView ==
                  SharedPreferencesSearchActivityCode.list
              ? Icons.list
              : Icons.map,
          onPressed: () => {
            if (SharedPreferences().searchActivityView ==
                SharedPreferencesSearchActivityCode.list)
              BlocProvider.of<SharedPreferencesBloc>(context).add(
                SharedPreferencesUpdateEvent(
                  SharedPreferencesName.searchActivityName,
                  SharedPreferencesSearchActivityCode.map,
                ),
              )
            else if (SharedPreferences().searchActivityView ==
                SharedPreferencesSearchActivityCode.map)
              BlocProvider.of<SharedPreferencesBloc>(context).add(
                SharedPreferencesUpdateEvent(
                  SharedPreferencesName.searchActivityName,
                  SharedPreferencesSearchActivityCode.list,
                ),
              )
          },
        );
      },
    );
  }
}
