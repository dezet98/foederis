import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  CustomSwitch({@required this.value, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PlatformSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}
