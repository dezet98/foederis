import 'package:engineering_thesis/blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/shared_preferences.dart';
import 'package:engineering_thesis/shared/components/card/custom_card.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchActivitiesView extends StatelessWidget {
  final List<Activity> activities;

  SearchActivitiesView({@required this.activities});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        if (state is SharedPreferencesLoadSuccessState) if (state
                .sharedPreferences.searchActivityView ==
            SharedPreferencesCode.list)
          return buildActivitiesList(context, activities);
        else
          return buildSearchedActivitiesMap(context, activities);
        else if (state is SharedPreferencesUpdateSuccessState) if (state
                .sharedPreferences.searchActivityView ==
            SharedPreferencesCode.list)
          return buildActivitiesList(context, activities);
        else
          return buildSearchedActivitiesMap(context, activities);

        return SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildActivitiesList(BuildContext context, List<Activity> activities) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          for (Activity activity in activities)
            buildActivityTile(context, activity)
        ],
      ),
    );
  }

  Widget buildActivityTile(BuildContext context, Activity activity) {
    return CustomCard(
      title: activity.title,
      subtitle: activity.categoryRef.toString(),
      onTap: () {
        Routing.pushNamed(context, UserRoutes.activityDetails,
            options: activity);
      },
    );
  }

  Widget buildSearchedActivitiesMap(
      BuildContext context, List<Activity> activities) {
    return SliverFillRemaining(
      child: Text('Map'),
    );
  }
}
