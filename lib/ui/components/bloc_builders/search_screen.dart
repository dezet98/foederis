import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/future_builder/custom_future_builder.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/icon/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen {
  static show(BuildContext context, SearchFilterBloc searchFilterBloc) async {
    await showSearch<dynamic>(
      context: context,
      delegate: CustomSearch(searchFilterBloc: searchFilterBloc),
    );
  }
}

class CustomSearch<SearchDataType> extends SearchDelegate {
  SearchFilterBloc searchFilterBloc;

  CustomSearch({@required this.searchFilterBloc});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      CustomButton.iconButton(
        customIcon: CustomIcon.clear,
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return CustomButton.iconButton(
      customIcon: CustomIcon.closeScreen,
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
        return _buildListTile(context, elements[index]);
      },
    );
  }

  Widget _buildListTile(
    BuildContext context,
    dynamic element,
  ) {
    return ListTile(
        title: Text(
          searchFilterBloc.display(element),
        ),
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
