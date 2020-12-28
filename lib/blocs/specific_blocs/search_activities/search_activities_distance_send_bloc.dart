import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:meta/meta.dart';

class SearchActivitiesDistanceSendBloc extends SendBloc {
  final SharedPreferencesBloc sharedPreferencesBloc;
  int _distance = int.parse(SharedPreferences().distanceKm);

  SearchActivitiesDistanceSendBloc({@required this.sharedPreferencesBloc});

  @override
  Future<void> query(Map<String, dynamic> queryFields) {
    _distance = queryFields['distance'];
    sharedPreferencesBloc.add(SharedPreferencesUpdateEvent(
      SharedPreferencesName.distanceKm,
      queryFields['distance'].toString(),
    ));
    return Future.wait([]);
  }

  int get distance => _distance;
}
