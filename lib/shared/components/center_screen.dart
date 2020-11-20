import 'package:flutter/widgets.dart';

class CenterScreen extends StatelessWidget {
  final Widget content;

  CenterScreen({this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: content,
        ),
      ],
    );
  }
}
