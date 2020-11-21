import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../shared/components/search_bar/custom_search.dart';

class SearchActivitiesScreen extends StatefulWidget {
  @override
  _SearchActivitiesScreenState createState() => _SearchActivitiesScreenState();
}

class _SearchActivitiesScreenState extends State<SearchActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Choose city'),
          elevation: 4,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(
                context: context,
                delegate: CustomSearch(
                  getCompare: (element) => element.city,
                  solutions: [
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
                  ],
                  suggestions: [
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
                  ],
                  recentSearches: [
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
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {},
            ),
          ],
        ),
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
