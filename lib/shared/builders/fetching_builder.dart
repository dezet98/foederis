import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filters/filters_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchingBuilder extends StatelessWidget {
  final FetchBloc fetchingCubit;
  final FiltersBloc filtersCubit;
  final Widget Function(dynamic data) buildSuccess;
  final Widget buildError;
  final Widget buildInProgress;

  FetchingBuilder({
    @required this.fetchingCubit,
    @required this.buildSuccess,
    this.filtersCubit,
    this.buildError,
    this.buildInProgress,
  });

  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: fetchingCubit,
        builder: (BuildContext context, state) {
          if (state is FetchFailureState) {
            return buildError;
          } else if (state is FetchSuccessState) {
            return buildSuccess(state.data);
          }

          return buildInProgress;
        });
  }
}
