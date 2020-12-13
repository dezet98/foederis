import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:flutter/material.dart';

import 'builders/custom_search.dart';

class SearchScreen {
  static show(BuildContext context, SearchFilterBloc searchFilterBloc) async {
    await showSearch<dynamic>(
      context: context,
      delegate: CustomSearch(searchFilterBloc: searchFilterBloc),
    );
  }
}
