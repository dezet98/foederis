import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/shared/local_database/shared_preferences.dart';
import 'package:meta/meta.dart';

class SearchActivitiesDistanceSendBloc extends SendBloc {
  final SharedPreferencesBloc sharedPreferencesBloc;
  int _distance = int.parse(SharedPreferences().distanceKm);

  SearchActivitiesDistanceSendBloc({@required this.sharedPreferencesBloc});

  @override
  Future<void> query(Map<String, dynamic> valuesMap) {
    _distance = valuesMap[SharedPreferencesName.distanceKm];
    sharedPreferencesBloc.add(SharedPreferencesUpdateEvent(
      SharedPreferencesName.distanceKm,
      valuesMap[SharedPreferencesName.distanceKm].toString(),
    ));
    return Future.wait([]);
  }

  int get distance => _distance;
}
