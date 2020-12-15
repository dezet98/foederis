import 'package:engineering_thesis/models/shared_preferences.dart';
import 'package:flutter/widgets.dart';

class SharedPreferenceBuilder extends StatelessWidget {
  final SharedPreferencesName preferencesName;
  final Widget Function(SharedPreferencesCode) preferencesCode;

  SharedPreferenceBuilder(
      {@required this.preferencesName, @required this.preferencesCode});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
