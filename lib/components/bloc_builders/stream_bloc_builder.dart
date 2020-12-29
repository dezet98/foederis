import 'package:engineering_thesis/blocs/abstract_blocs/stream/stream_bloc.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreamBlocBuilder extends StatelessWidget {
  final StreamBloc streamBloc;
  final Widget Function(dynamic data) buildSuccess;
  final Widget Function(dynamic exception) buildError;
  final Widget buildInProgress;
  final bool isSliver;

  StreamBlocBuilder({
    @required this.streamBloc,
    @required this.buildSuccess,
    this.buildError,
    this.buildInProgress,
    this.isSliver = false,
  });

  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: streamBloc,
        builder: (BuildContext context, state) {
          if (state is StreamRefreshFailureState ||
              state is StreamSubscribeFailed) {
            return buildError != null
                ? buildError(state.fetchingError)
                : _buildError;
          } else if (state is StreamRefreshSuccessState) {
            return buildSuccess(state.data);
          }
          return buildInProgress != null ? buildInProgress : _buildInProgress();
        });
  }

  Widget _buildInProgress() {
    if (isSliver) {
      return SliverFillRemaining(
        child: Container(),
      );
    }

    return CircularProgressIndicator();
  }

  Widget _buildError() {
    if (isSliver) {
      return SliverFillRemaining(
        child: Container(),
      );
    }

    return CustomText('Error', textType: TextType.error_text);
  }
}
