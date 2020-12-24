import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import '../custom_widgets/future_builder/custom_future_builder.dart';

class CustomSearch<SearchDataType> extends SearchDelegate {
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
    return CustomFutureBuilder<List<dynamic>>(
      future: searchFilterBloc.results(query),
      buildSuccess: (List<dynamic> data) {
        if (data.isEmpty) return Center(child: Text("Result not found"));
        return buildSuggestions(context);
      },
      buildInProgress: CircularProgressIndicator(),
      buildError: Text('Error'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder(
        cubit: searchFilterBloc,
        builder: (context, state) {
          if (state is SearchFilterLoadDataInProgressState)
            return Center(child: CircularProgressIndicator());

          return query.isEmpty
              ? _buildList(searchFilterBloc.suggestion, Icons.search)
              : _buildFutureList(
                  searchFilterBloc.results(query), Icons.assistant_navigation);
        });
  }

  Widget _buildFutureList(
      Future<List<SearchDataType>> elements, IconData iconData) {
    return CustomFutureBuilder<List<SearchDataType>>(
      future: searchFilterBloc.results(query),
      buildSuccess: (List<SearchDataType> data) {
        return _buildList(data, iconData);
      },
      buildInProgress: CircularProgressIndicator(),
      buildError: Text('Error'),
    );
  }

  Widget _buildList(List<SearchDataType> elements, IconData iconData) {
    return ListView.builder(
      itemCount: elements.length,
      itemBuilder: (context, index) {
        return _buildListTile(context, elements[index], iconData: iconData);
      },
    );
  }

  Widget _buildListTile(BuildContext context, dynamic element,
      {IconData iconData}) {
    return ListTile(
        title: Text(
          searchFilterBloc.display(element),
        ),
        leading: Icon(iconData),
        onTap: () {
          searchFilterBloc.add(
            SearchFilterSelectOptionEvent<SearchDataType>(
              selectedElement: element,
            ),
          );
          close(
            context,
            element,
          );
        });
  }
}
