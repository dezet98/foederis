import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Widget> buildActivitiesList(Geolocation geoFiltr) {
  return [
    Container(
      child: FutureBuilder(
        future: ActivityRepository().getAllActivities(geoFiltr),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              for (Activity activity in snapshot.data)
                _buildActivityTile(activity)
            ]);
          } else if (snapshot.hasError) {
            return Text('Error occurs');
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    )
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
