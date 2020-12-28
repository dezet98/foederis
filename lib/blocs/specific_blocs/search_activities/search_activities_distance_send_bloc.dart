import 'package:engineering_thesis/blocs/abstract_blocs/send/send_args.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:meta/meta.dart';

class SearchActivitiesDistanceSendArgs extends SendArgs {
  final int distanceKm;

  SearchActivitiesDistanceSendArgs({@required this.distanceKm});

  @override
  List<Object> get props => [distanceKm];
}

class SearchActivitiesDistanceSendBloc
    extends SendBloc<SearchActivitiesDistanceSendArgs> {
  final SharedPreferencesBloc sharedPreferencesBloc;
  int _distance = int.parse(SharedPreferences().distanceKm);

  SearchActivitiesDistanceSendBloc({@required this.sharedPreferencesBloc});

  @override
  Future<void> query(SearchActivitiesDistanceSendArgs sendArgs) {
    _distance = sendArgs.distanceKm;
    sharedPreferencesBloc.add(SharedPreferencesUpdateEvent(
      SharedPreferencesName.distanceKm,
      sendArgs.distanceKm.toString(),
    ));
    return Future.wait([]);
  }

  int get distance => _distance;
}
