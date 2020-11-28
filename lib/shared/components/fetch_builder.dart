import 'package:engineering_thesis/blocs/search_activities/search_activities_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBuilder extends StatefulWidget {
  final SearchActivitiesBloc fetchingBloc;
  final Widget Function(List<Activity> results) buildSuccess;
  final Widget Function() buildError;
  final Widget Function() buildInProgress;

  FetchBuilder(
      {@required this.fetchingBloc,
      @required this.buildSuccess,
      this.buildError,
      this.buildInProgress});

  @override
  _FetchBuilderState createState() => _FetchBuilderState();
}

class _FetchBuilderState extends State<FetchBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchActivitiesBloc, SearchActivitiesState>(
        builder: (BuildContext context, state) {
      if (state is SearchActivitiesFetchFailureState) {
        return _buildInitialError();
      } else if (state is SearchActivitiesFetchSuccessState) {
        return widget.buildSuccess(state.activites);
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
