import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final bool enabled;

  CustomSwitch({
    @required this.value,
    @required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformSwitch(
      value: value,
      onChanged: enabled ? onChanged : null,
    );
  }
}
