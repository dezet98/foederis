import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        children: [
          Center(
            child: Text("Search term must be longer than two letter"),
          )
        ],
      );
    }
    return StreamBuilder(
      stream: ActivityRepository().getAllActivitiesStream(),
      builder: (context, AsyncSnapshot<List<Activity>> snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: [
              Center(
                child: Text('Error when search'),
              ),
            ],
          );
        } else if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No results found'),
              ],
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data[index].title),
              );
            },
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [Text('First suggestion')],
    );
  }
}
