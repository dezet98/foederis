import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'send_event.dart';
part 'send_state.dart';

abstract class SendBloc extends Bloc<SendEvent, SendState> {
  SendBloc() : super(SendInitialState());

  Future<void> query(Map<String, dynamic> queryFields);

  @override
  Stream<SendState> mapEventToState(
    SendEvent event,
  ) async* {
    if (event is SendDataEvent) {
      yield* mapSendDataEvent(event.queryData);
    }
  }

  Stream<SendState> mapSendDataEvent(Map<String, dynamic> queryFields) async* {
    try {
      yield SendDataInProgressState();
      await query(queryFields);
      yield SendDataSuccessState();
    } catch (e) {
      if (e is SendingDataException)
        yield SendDataFailureState(sendingDataException: e);
      else
        yield SendDataFailureState(
          sendingDataException: SendingDataException(
            sendingDataError: UploadDataError.undefined,
            message: e.toString(),
          ),
        );
    }
  }
}
