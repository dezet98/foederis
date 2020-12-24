import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFutureBuilder<DataType> extends StatelessWidget {
  final Future future;
  final Widget Function(DataType data) buildSuccess;
  final Widget buildError;
  final Widget buildInProgress;

  CustomFutureBuilder({
    @required this.future,
    @required this.buildSuccess,
    this.buildError,
    this.buildInProgress,
  });

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot state) {
          if (state.hasError) {
            return buildError;
          } else if (state.hasData) {
            DataType data = state.data;
            return buildSuccess(data);
          }

          return buildInProgress;
        });
  }
}
