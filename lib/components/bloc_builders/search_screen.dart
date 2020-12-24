import 'package:flutter/material.dart';

import '../../blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'custom_search.dart';

class SearchScreen {
  static show(BuildContext context, SearchFilterBloc searchFilterBloc) async {
    await showSearch<dynamic>(
      context: context,
      delegate: CustomSearch(searchFilterBloc: searchFilterBloc),
    );
  }
}
