import 'package:engineering_thesis/blocs/geolocation_filter/geolocation_filter_bloc.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearch<T> extends SearchDelegate {
  GeolocationFilterBloc bloc;
  dynamic Function(Geolocation) getCompare;

  CustomSearch({
    @required this.getCompare,
    @required this.bloc,
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
    if (bloc.results(query).isEmpty)
      return Center(child: Text("Result not found"));
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<GeolocationFilterBloc, GeolocationFilterState>(
        builder: (context, state) {
      if (state is GeolocationFilterLoadResultsSuccessState) {
        return query.isEmpty
            ? _buildList(bloc.suggestion, Icons.search)
            : _buildList(bloc.results(query), Icons.assistant_navigation);
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
        getCompare(element),
      ),
      leading: Icon(iconData),
      onTap: () => close(
        context,
        element,
      ),
    );
  }
}
