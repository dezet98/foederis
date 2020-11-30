import 'package:engineering_thesis/blocs/search_activities_multi_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities_regular_filter.dart';
import 'package:engineering_thesis/shared/builders/multi_choice_filter.dart';
import 'package:engineering_thesis/shared/builders/single_choice_filter.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          MultiChoiceFilter(SearchActivitiesMultiFilterBloc()),
          SingleChoiceFilter(SearchActivitiesRegularFilter())
        ],
      ),
    );
  }
}
