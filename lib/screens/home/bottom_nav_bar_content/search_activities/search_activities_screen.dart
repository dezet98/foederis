import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../shared/components/search_bar/custom_search.dart';
import 'build_list.dart';

class SearchActivitiesScreen extends StatefulWidget {
  @override
  _SearchActivitiesScreenState createState() => _SearchActivitiesScreenState();
}

class _SearchActivitiesScreenState extends State<SearchActivitiesScreen> {
  Geolocation geoFiltr;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(geoFiltr == null ? 'Choose city' : geoFiltr.city),
          elevation: 4,
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  var newGeoFiltr = await showSearch<dynamic>(
                    context: context,
                    delegate: CustomSearch<Geolocation>(
                      getCompare: (element) => element.city,
                      solutions: solutions,
                      suggestions: suggestions,
                      recentSearches: recentSearches,
                    ),
                  );
                  if (newGeoFiltr != null)
                    setState(() {
                      geoFiltr = newGeoFiltr;
                    });
                }),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {},
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(buildActivitiesList(geoFiltr)),
        )
      ],
    );
  }

  Widget _buildActivityCard(Activity activity) {
    return Card(
      child: ListTile(
        title: Text(activity.title),
        subtitle: Text(activity.categoryRef.toString()),
      ),
    );
  }

  get solutions => [
        Geolocation(
          ref: null,
          city: "Kraków",
          latitude: 3,
          longitude: 23,
        ),
        Geolocation(
          ref: null,
          city: "Krynica",
          latitude: 3,
          longitude: 23,
        ),
        Geolocation(
          ref: null,
          city: "Kobierzów",
          latitude: 3,
          longitude: 23,
        ),
        Geolocation(
          ref: null,
          city: "Krzyszkowcie",
          latitude: 3,
          longitude: 23,
        ),
      ];

  get suggestions => [
        Geolocation(
          ref: null,
          city: "Kraków",
          latitude: 3,
          longitude: 23,
        ),
        Geolocation(
          ref: null,
          city: "Krzyszkowcie",
          latitude: 3,
          longitude: 23,
        ),
      ];
  get recentSearches => [
        Geolocation(
          ref: null,
          city: "Kraków",
          latitude: 3,
          longitude: 23,
        ),
        Geolocation(
          ref: null,
          city: "Krzyszkowcie",
          latitude: 3,
          longitude: 23,
        ),
      ];
}

class CustomWidget extends StatelessWidget {
  CustomWidget(this._index) {
    debugPrint('initialize: $_index');
  }

  final int _index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: (_index % 2 != 0) ? Colors.white : Colors.grey,
      child:
          Center(child: Text('index: $_index', style: TextStyle(fontSize: 40))),
    );
  }
}
//  Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Text('Search activity screen'),
//         FutureBuilder(
//           future: ActivityRepository().getAllActivities(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               print(snapshot.error.toString());
//               return Text(snapshot.error.toString());
//             } else if (snapshot.hasData) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     for (Activity i in snapshot.data) _buildActivityCard(i)
//                   ],
//                 ),
//               );
//             }
//             return Text('3 option');
//           },
//         )
//       ],
//     );
