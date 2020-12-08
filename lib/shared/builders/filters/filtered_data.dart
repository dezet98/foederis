import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filters/filters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredData<FilterDataType> extends StatelessWidget {
  final FiltersBloc filtersBloc;
  final List<FilterDataType> data;
  final Widget Function(BuildContext context, List<FilterDataType> data) child;

  FilteredData(
      {@required this.filtersBloc, @required this.data, @required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: filtersBloc,
      builder: (BuildContext context, state) {
        return child(
          context,
          filtersBloc.filter(data),
        );
      },
    );
  }
}
