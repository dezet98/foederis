import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_args.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:meta/meta.dart';

class SearchActivitiesDistanceSendArgs extends SendArgs {
  final Activity activity;

  SearchActivitiesDistanceSendArgs({@required this.activity});

  @override
  List<Object> get props => [activity];
}

class CreateActivitySendBloc
    extends SendBloc<SearchActivitiesDistanceSendArgs> {
  final ActivityRepository _activityRepository;

  CreateActivitySendBloc(this._activityRepository);

  @override
  Future<void> query(SearchActivitiesDistanceSendArgs sendArgs) async {
    await Future.delayed(Duration(seconds: 8));
    DocumentReference activityRef =
        await _activityRepository.createActivity(sendArgs.activity);
    print(activityRef);
  }
}
