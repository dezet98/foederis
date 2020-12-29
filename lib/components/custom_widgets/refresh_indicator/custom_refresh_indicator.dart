import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final double displacement;

  CustomRefreshIndicator(
      {@required this.child,
      @required this.onRefresh,
      this.displacement = 0.0});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
      displacement: displacement,
    );
  }

  static cupertinoRefreshIndicator(Future<void> Function() onRefresh) {
    return CupertinoSliverRefreshControl(
      onRefresh: () => onRefresh(),
    );
  }
}
