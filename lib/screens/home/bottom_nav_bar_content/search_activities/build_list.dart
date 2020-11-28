import 'package:engineering_thesis/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Widget> buildActivitiesList(
    List<Activity> activities, BuildContext context) {
  return [for (Activity activity in activities) _buildActivityTile(activity)];
}

Widget _buildActivityTile(Activity activity) {
  return Card(
    child: ListTile(
      title: Text(activity.title),
      subtitle: Text(activity.categoryRef.toString()),
    ),
  );
}
