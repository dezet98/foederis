import 'package:engineering_thesis/components/bloc_builders/search_screen.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/specific_blocs/search_activities/search_activities_distance_choice_bloc.dart';
import '../../../../blocs/specific_blocs/search_activities/search_activities_filters_bloc.dart';
import '../../../../blocs/specific_blocs/search_activities/search_activities_search_filter_bloc.dart';
import '../../../../blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import '../../../../shared/routing.dart';
import '../../../../shared/shared_preferences.dart';

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
                Routing.pushNamed(
                  context,
                  UserRoutes.form,
                  options: {
                    'formDataBloc':
                        BlocProvider.of<SearchActivityDistanceChoiceBloc>(
                            context),
                    'formAppBarTitle': 'dsa',
                    'formNextButtonText': 'fsd'
                  },
                );
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
          options: {
            'filtersBloc': BlocProvider.of<SearchActivitiesFiltersBloc>(context)
          },
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
