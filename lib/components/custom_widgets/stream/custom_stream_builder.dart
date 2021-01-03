import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomStreamBuilder<DataType> extends StatelessWidget {
  final Stream<DataType> stream;
  final Widget Function(DataType data) buildActive;
  final Widget buildError;
  final Widget buildInProgress;

  CustomStreamBuilder({
    @required this.stream,
    @required this.buildActive,
    this.buildError,
    this.buildInProgress,
  });

  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return buildError;
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.waiting:
              return SizedBox(
                child: LinearProgressIndicator(),
                width: MediaQuery.of(context).size.width / 8,
              );
              break;
            case ConnectionState.active:
              return buildActive(snapshot.data);
              break;
            case ConnectionState.done:
              return buildActive(snapshot.data);
              break;
          }
          return Container();
        });
  }
}
