import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:flutter/widgets.dart';

class SearchActivitiesScreen extends StatefulWidget {
  @override
  _SearchActivitiesScreenState createState() => _SearchActivitiesScreenState();
}

class _SearchActivitiesScreenState extends State<SearchActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(54.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Search activity screen'),
          FutureBuilder(
            future: ActivityRepository().getAllActivities(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              }
              return Text('3 option');
            },
          )
        ],
      ),
    );
  }
}
