import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/shared/components/center_screen.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
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
      return CenterScreen(
          content: Text("Search term must be longer than two letter"));
    }
    return StreamBuilder(
      stream: ActivityRepository().getAllActivitiesStream(),
      builder: (context, AsyncSnapshot<List<Activity>> snapshot) {
        if (snapshot.hasError) {
          return CenterScreen(content: Text('No results found'));
        } else if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return CenterScreen(content: Text('No results found'));
          }

          return _buildResultsList(snapshot.data);
        }

        return CenterScreen(content: CircularProgressIndicator());
      },
    );
  }

  Widget _buildResultsList(List<Activity> activities) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            activities[index].title,
          ),
          onTap: () => close(
            context,
            activities[index],
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSuggestionsList([Activity(title: 'asdasd', ref: null)]);
  }

  Widget _buildSuggestionsList(List<Activity> activities) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            activities[index].title,
          ),
          leading: Icon(Icons.assistant_navigation),
          onTap: () => close(
            context,
            activities[index],
          ),
        );
      },
    );
  }
}
