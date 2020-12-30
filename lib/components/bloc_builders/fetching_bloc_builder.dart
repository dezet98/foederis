import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/abstract_blocs/fetch/fetch_bloc.dart';

class FetchingBlocBuilder extends StatelessWidget {
  final FetchBloc fetchingCubit;
  final Widget Function(dynamic data) buildSuccess;
  final Widget Function(dynamic exception) buildError;
  final Widget buildInProgress;
  final bool isSliver;

  FetchingBlocBuilder({
    @required this.fetchingCubit,
    @required this.buildSuccess,
    this.buildError,
    this.buildInProgress,
    this.isSliver = false,
  });

  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: fetchingCubit,
        builder: (BuildContext context, state) {
          if (state is FetchInitialFailureState ||
              state is FetchRefreshFailureState) {
            return buildError != null
                ? buildError(
                    state.fetchingException) //todo hard bug to find to change
                : _buildError;
          } else if (state is FetchInitialSuccessState ||
              state is FetchRefreshSuccessState) {
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
