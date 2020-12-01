import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/filters/filters_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/multi_choice_filter/multi_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/single_choice_filter/single_choice_filter_bloc.dart';
import 'package:engineering_thesis/shared/builders/multi_choice_filter.dart';
import 'package:engineering_thesis/shared/builders/single_choice_filter.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  final FiltersBloc filtersBloc;

  FiltersScreen({@required this.filtersBloc});
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          for (FilterBloc bloc in widget.filtersBloc.filtersBlocs)
            _buildFilter(bloc),
          RaisedButton(
            onPressed: () {
              widget.filtersBloc.add(FiltersChangedEvent());
            },
            child: Text('Apply'),
          )
        ],
      ),
    );
  }

  Widget _buildFilter(FilterBloc bloc) {
    if (bloc is MultiChoiceFilterBloc) {
      return MultiChoiceFilter(bloc);
    } else if (bloc is SingleChoiceFilterBloc) {
      return SingleChoiceFilter(bloc);
    }
    assert(false);
    return Container();
  }

  void filtersChanged() {}
}
