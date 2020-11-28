import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchingBuilder extends StatefulWidget {
  final FetchBloc fetchingCubit;
  final Widget Function(dynamic data) buildSuccess;
  final Widget Function() buildError;
  final Widget Function() buildInProgress;

  FetchingBuilder(
      {@required this.fetchingCubit,
      @required this.buildSuccess,
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
            return _buildInitialError();
          } else if (state is FetchSuccessState) {
            return widget.buildSuccess(state.data);
          }
          return _buildInitialInProgress();
        });
  }

  Widget _buildInitialInProgress() {
    return CircularProgressIndicator();
  }

  Widget _buildInitialError() {
    return CircularProgressIndicator();
  }
}
