import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/filters/filters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchingBuilder extends StatefulWidget {
  final FetchBloc fetchingCubit;
  final FiltersBloc filtersCubit;
  final Widget Function(dynamic data) buildSuccess;
  final Widget buildError;
  final Widget buildInProgress;

  FetchingBuilder(
      {@required this.fetchingCubit,
      @required this.buildSuccess,
      this.filtersCubit,
      this.buildError,
      this.buildInProgress});

  @override
  _FetchingBuilderState createState() => _FetchingBuilderState();
}

class _FetchingBuilderState extends State<FetchingBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: widget.fetchingCubit,
        builder: (BuildContext context, state) {
          if (state is FetchFailureState) {
            return Text('Error');
          } else if (state is FetchSuccessState) {
            return widget.buildSuccess(state.data);
          }

          return CircularProgressIndicator();
        });
  }

  // Widget _buildInProgress() {
  //   if (widget.buildInProgress != null) {
  //     return widget.buildInProgress;
  //   }

  //   return CircularProgressIndicator();
  // }

  // Widget _buildError() {
  //   if (widget.buildError != null) {
  //     return widget.buildError;
  //   }

  //   return Text('Error');
  // }
}
