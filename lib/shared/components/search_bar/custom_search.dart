import 'package:flutter/material.dart';

class CustomSearch<T> extends SearchDelegate {
  List<T> solutions;
  List<T> suggestions;
  List<T> recentSearches; // TODO implement recentSearch
  dynamic Function(T) getCompare;

  CustomSearch({
    @required this.solutions,
    @required this.getCompare,
    @required this.suggestions,
    @required this.recentSearches,
  });

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
    if (results.isEmpty) return Center(child: Text("Result not found"));
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? _buildList(suggestions, Icons.search)
        : _buildList(results, Icons.assistant_navigation);
  }

  Widget _buildList(List<T> elements, IconData iconData) {
    return ListView.builder(
      itemCount: elements.length,
      itemBuilder: (context, index) {
        return _buildListTile(context, elements[index], iconData: iconData);
      },
    );
  }

  Widget _buildListTile(BuildContext context, T element, {IconData iconData}) {
    return ListTile(
      title: Text(
        getCompare(element),
      ),
      leading: Icon(iconData),
      onTap: () => close(
        context,
        element,
      ),
    );
  }

  List<T> get results => solutions
      .where((T element) =>
          getCompare(element).toUpperCase().startsWith(query.toUpperCase()))
      .toList();
}
