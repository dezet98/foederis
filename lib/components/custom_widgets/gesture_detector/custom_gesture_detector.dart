import 'package:flutter/widgets.dart';

class CustomGestureDetector extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  CustomGestureDetector({@required this.onTap, @required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}
