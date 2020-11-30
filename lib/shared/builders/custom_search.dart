import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearch extends SearchDelegate {
  SearchFilterBloc searchFilterBloc;

  CustomSearch({@required this.searchFilterBloc});

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
    if (searchFilterBloc.results(query).isEmpty)
      return Center(child: Text("Result not found"));
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder(
        cubit: searchFilterBloc,
        builder: (context, state) {
          if (state is SearchFilterLoadResultsSuccessState) {
            return query.isEmpty
                ? _buildList(searchFilterBloc.suggestion, Icons.search)
                : _buildList(searchFilterBloc.results(query),
                    Icons.assistant_navigation);
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildList(List<Geolocation> elements, IconData iconData) {
    return ListView.builder(
      itemCount: elements.length,
      itemBuilder: (context, index) {
        return _buildListTile(context, elements[index], iconData: iconData);
      },
    );
  }

  Widget _buildListTile(BuildContext context, Geolocation element,
      {IconData iconData}) {
    return ListTile(
      title: Text(
        searchFilterBloc.display(element),
      ),
      leading: Icon(iconData),
      onTap: () => close(
        context,
        element,
      ),
    );
  }
}
