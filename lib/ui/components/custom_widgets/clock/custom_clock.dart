import 'package:engineering_thesis/ui/components/custom_widgets/stream/custom_stream_builder.dart';
import 'package:flutter/material.dart';

class CustomClock extends StatelessWidget {
  final Widget child;
  final Duration period;

  CustomClock({@required this.child, this.period = const Duration(seconds: 1)});

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
      stream: Stream.periodic(period),
      buildActive: (_) => child,
    );
  }
}
