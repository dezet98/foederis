import 'package:engineering_thesis/blocs/search_activities/search_activities_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:engineering_thesis/shared/components/fetch_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Widget> buildActivitiesList(Geolocation geoFiltr, BuildContext context) {
  return [
    Container(
        child: FetchBuilder(
      fetchingBloc: BlocProvider.of<SearchActivitiesBloc>(context),
      buildSuccess: (List<Activity> activities) {
        return _buildActivityTile(activities[0]);
      },
    ))
  ];
}

Widget _buildActivityTile(Activity activity) {
  return Card(
    child: ListTile(
      title: Text(activity.title),
      subtitle: Text(activity.categoryRef.toString()),
    ),
  );
}
